//第八章，习题



drop table employe_o cascade constraints;
drop table dept_o cascade constraints;
drop type dept_t force;
drop type employe_t force;
drop type  listRefEmployes_t force;
drop type  setEmployes_t force;
drop type  tabPrenoms_t;


create or replace type dept_t


create or replace type tabPrenoms_t as varray(4) of varchar2(40)



create or replace type EMPLOYE_T AS OBJECT(	
	EMPNO      number(8),
	ENAME      varchar2(15),
	PRENOMS    tabPrenoms_t,	
	JOB        Varchar2(20),
	SAL        number(7,2),	
	CV         CLOB,
	DATE_NAISS date,
	DATE_EMB   date,
	refDept    REF DEPT_T,
	ORDER MEMBER FUNCTION compEMP (emp IN employe_t) RETURN NUMBER
);

create or replace type listRefEmployes_t as table of REF employe_t


create or replace type setEmployes_t as table of employe_t


create or replace type DEPT_T AS OBJECT(
	DEPTNO      number(4),
	DNAME       varchar2(30),
	LOC         varchar2(30),
	listRefEmp  listRefEmployes_t,
	static function getDept (deptno1 IN number) return dept_t,
	Static function getInfoEmp(deptno1 IN number) return setEmployes_t,
	MAP MEMBER FUNCTION compDept RETURN VARCHAR2,
	member procedure addLinkListeEmployes(RefEmp1 REF Employe_t),
	member procedure deleteLinkListeEmployes (RefEmp1 REF Employe_t),
	member procedure updateLinkListeEmployes (RefEmp1 REF Employe_t,
		RefEmp2 REF Employe_t)
);


commit;




create table employe_o of EMPLOYE_T(
    CONSTRAINT pk_employe_o_empno PRIMARY KEY(EMPNO),
    CONSTRAINT chk_employe_o_job CHECK(JOB IN ('Ingénieur', 'Secrétaire', 'Directeur', 'Planton', 'PDG')),
    CONSTRAINT nl_employe_o_job JOB NOT NULL,
    CONSTRAINT nl_employe_o_ENAME ENAME NOT NULL,
    CONSTRAINT chk_employe_o_ENAME check(ename = upper(ename)),
    CONSTRAINT ck_employe_o_salaire CHECK((SAL between 1500 and 15000)
        and sal is not null),
    CONSTRAINT nl_employe_o_DATE_NAISS DATE_NAISS NOT NULL,
    CONSTRAINT ckh_employe_o_DATE_EMB CHECK (DATE_EMB > DATE_NAISS) ,
    CONSTRAINT nl_employe_o_DATE_EMB DATE_EMB NOT NULL
)
LOB (CV) STORE AS storeLobCv;





create table dept_o of dept_t(
CONSTRAINT pk_dept_o_deptno deptno primary key,
CONSTRAINT chk_dept_o_deptno CHECK (DEPTNO between 1000 AND 9999),
CONSTRAINT chk_dept_o_dname CHECK (DNAME IN 
    ('Recherche', 'RH', 'Marketing', 'Ventes', 'Finance')),
CONSTRAINT nl_dept_o_dname DNAME not null ,
CONSTRAINT nl_dept_o_loc loc not null
)
NESTED TABLE listRefEmp STORE AS table_listRefEmp;

commit;

				   
				   
				   
				
create unique index idx_dept_o_dname on DEPT_o(dname)


ALTER TABLE table_listRefEmp
    ADD (SCOPE FOR (column_value) IS EMPLOYE_O);

ALTER TABLE EMPLOYE_O
	ADD (SCOPE FOR (refDept) IS DEPT_O);
    
CREATE UNIQUE INDEX IDX_table_listRefEmp_nested_table_id_column_value 
ON table_listRefEmp (nested_table_id, column_value);


commit;

CREATE INDEX idx_employe_o_refDept on employe_o (refDept)

commit;


desc dept_o







declare
	refDept1	   REF dept_t;
	refDept2	   REF dept_t;
	refEmp1		   REF Employe_t;
	refEmp2		   REF Employe_t;
	refEmp3		   REF Employe_t;
    
    
    
begin

insert into dept_o od 
values (dept_t(1000, 'RH', 'Nice', LISTREFEMPLOYES_T()  )  )
returning ref(od) INTO refDept1;

insert into dept_o od 
values (dept_t(1001, 'Recherche', 'Paris', LISTREFEMPLOYES_T()  )  )
returning ref(od) INTO refDept2;

insert into employe_o oe
values (employe_t(
1,
'KING',
TABPRENOMS_T('LeRoi', 'Merlin'),
'PDG',
15000,
EMPTY_CLOB(),
to_date('12-11-1962', 'DD-MM-YYYY'),
to_date('12-11-1992', 'DD-MM-YYYY'),
refDept1
)) 
returning ref(oe) into refEmp1;


insert into employe_o oe
values (employe_t(
2,
'BARON',
TABPRENOMS_T('Samedi'),
'Planton',
1500,
'Baron Samedi est le dieu des cimetieres',
to_date('12-11-1804', 'DD-MM-YYYY'),
to_date('12-11-1820', 'DD-MM-YYYY'),
refDept1
)) 
returning ref(oe) into refEmp2;

insert into employe_o oe
values (employe_t(
3,
'GIBRAN',
TABPRENOMS_T('Khalil'),
'Ingénieur',
11000,
EMPTY_CLOB(),
to_date('12-11-1904', 'DD-MM-YYYY'),
to_date('12-11-1920', 'DD-MM-YYYY'),
refDept2
)) 
returning ref(oe) into refEmp3;
-- Etape 3: Mettre a jour la liste des references de chaquen departement


INSERT INTO TABLE(SELECT d.listRefEmp 
FROM dept_o d
WHERE d.Deptno = 1000)   
values (refEmp1);

INSERT INTO TABLE(SELECT d.listRefEmp 
FROM dept_o d
WHERE d.Deptno = 1000)   
values (refEmp2);

INSERT INTO TABLE(SELECT d.listRefEmp 
FROM dept_o d
WHERE d.Deptno = 1001)   
values (refEmp3);


end;
/
//如果之前做了commit, 需要这么做
delete from employe_o;
delete from dept_o;
commit;

///
select * from dept_o;
