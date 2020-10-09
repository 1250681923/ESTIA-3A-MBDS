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
	
	
	
	
	
	
	
	
	
	
08/10/2020
	
-- Chap_1_8.5.1 Modifier la localité d'un département connaissant son 
-- nom
UPDATE  DEPT_O
SET   LOC = 'BAYONNE'	
WHERE 	DNAME = 'RH';
rollback;


-- Chap_1_8.5.2 Modifier la date d'embauche d'un Employé connaissant 
-- son nom sachant qu'il doit travailler dans l'un des départements 
-- suivants : 'Recherche', 'Finance' ou  'RH'
UPDATE EMPLOYE_O oe
SET DATE_EMB = to_date('08-10-2020','DD-MM-YYYY')
WHERE ENAME = 'BARON' AND oe.refdept.dname in ('Recherche', 'Finance', 'RH');


-- Chap_1_8.5.3 Supprimer un DEPT et mettre la référence vers le 
-- département à null 
-- dans la table employe_o
	

-- solution 1 : lente 
DECLARE
redept1		 REF dept_T;

BEGIN
	DELETE FROM dept_o V6 WHERE deptno = 1000
		RETURNING REF(v6)	INTO refDept1;
		
	update employe_o oe
	set oe.refDept=null
	where oe.refDept=refDept1;
END;
/

-- solution 2 : rapide
update employe_o o set o.refdept = null 
where o.refdept.deptno = 1000;

delete from dept_o o where deptno=1000;

	
	
	
	
	
-- Chap_1_8.6.1 Faire un Listing des DEPTs triés par nom
SELECT * FROM dept_o
ORDER BY DNAME;

-- Chap_1_8.6.2 Pour un DEPT donné, lister tous les EMPLOYEs qui y 
-- travaillent PL/SQL et Procédures stockées

---solution 1
select lre.column_value.ename,
lre.column_value.empno,
lre.column_value.refDept.deptno,
lre.column_value.refDept.dname,
lre.column_value.sal
from TABLE(select od.listRefEmp
from dept_o od where od.deptno = 1000) lre;
----solution 2
Select oe.ename, oe.empno,oe.refdept.deptno,oe.refdept.dname, oe.sal 
from employe_o oe
where oe.refdept.deptno=1000;
--solution 3
SELECT od.listRefEmp
from dept_o od, TABLE(od.listRefEmp)
where od.deptno = 1000;
	
	
	
-- Chap_1_8.1 Implémenter les méthodes du type EMPLOYE_T
-- Ci-dessous une implémentation à vide à compléter en remplaçant
-- null par du vrai code. Le code null permet une implémentation
-- incrémentatale. En effet PLSQL toutes les fonctions d'un package
-- doivent être codées avant d'être testez
-- Les prototypes des fonctions doivent être identiques
-- à la spécification.



create or replace type BODY EMPLOYE_T AS 
ORDER MEMBER FUNCTION compEMP (emp IN EMploye_t) RETURN NUMBER IS
	position1 NUMBER :=0;
	position2 NUMBER :=0;
	concEmp1 VARCHAR2(60) := SELF.empno||SELF.ename;
	concEmp2 VARCHAR2(60) := emp.empno||emp.ename;
	BEGIN
		CASE SELF.job
			WHEN 'PDG' THEN position1 := 1;
			WHEN 'Directeur' THEN position1 := 2;
			WHEN 'Ingénieur' THEN position1 := 3;
			WHEN 'Secrétaire' THEN position1 := 4;
			WHEN 'Planton' THEN position1 := 5;
		END CASE;
		CASE emp.job
			WHEN 'PDG' THEN position2 := 1;
			WHEN 'Directeur' THEN position2 := 2;
			WHEN 'Ingénieur' THEN position2 := 3;
			WHEN 'Secrétaire' THEN position2 := 4;
			WHEN 'Planton' THEN position2 := 5;
		END CASE;
		concEmp1 := position1||concEmp1;
		concEmp2 := position2||concEmp2;
		--11KING
		--22BARON
		IF concEmp1 = concEmp2 THEN return 0;
		ELSIF concEmp1 > concEmp2 THEN return 1;
		ELSIF concEmp1 < concEmp2 THEN return -1;
		END IF;
	END;
end;
/


-- Chap_1_8.2 Implémenter les méthodes du type DEPT_T
-- Ci-dessous une implémentation à vide à compléter en remplaçant
-- null par du vrai code. Le code null permet une implémentation
-- incrémentatale. En effet PLSQL toutes les fonctions d'un package
-- doivent être codées avant d'être testez
-- Les prototypes des fonctions doivent être identiques
-- à la spécification.


    
create or replace type BODY DEPT_T AS

static function getDept (deptno1 IN number)
    return dept_t IS
dept1 dept_t:=null;
BEGIN
    select value(od) INTO dept1 
	from dept_o od where od.deptno = deptno1;
	return dept1;
	EXCEPTION
		WHEN OTHERS THEN
			raise;
END;
Static function getInfoEmp(deptno1 IN number)
    return setEmployes_t IS
	setEmp setEmployes_t;
BEGIN
	SELECT cast(collect(deref(lre.column_value)) 
	AS setEmployes_t) INTO setEmp
	FROM TABLE(
	SELECT listRefEmp 
	from dept_o od 
	where od.deptno = deptno1) lre;
	return setEmp;
END;
member procedure addLinkListeEmployes(RefEmp1 REF Employe_t) IS
BEGIN
    null;
END;
member procedure deleteLinkListeEmployes (RefEmp1 REF Employe_t) IS
BEGIN
    null;
END;
member procedure updateLinkListeEmployes (RefEmp1 REF Employe_t,
    RefEmp2 REF Employe_t) IS
BEGIN
    null;
END;

map member function compDept return varchar2 IS
BEGIN
	return self.deptno || self.dname || self.loc;
END;
end;
/


-- Chap_1_8.3 Tester chaque méthode du type EMPLOYE_T
select * from employe_o oe order by value(oe);
-- Chap_1_8.4 Tester chaque méthode du type DEPT_T
--test de compDept
select * from dept_o od order by value(od);
	
--test de getDept
set serveroutput on
declare
dept1 dept_t;
begin
	dept1:=dept_t.getDept(1000);
	dbms_output.put_line('dname'||dept1.dname);
	EXCEPTION
		WHEN OTHERS THEN
		dbms_output.put_line('Erreur dans le programme');
		dbms_output.put_line('sqlcode='||sqlcode);
		dbms_output.put_line('sqlerrm='||sqlerrm);
end;
/
