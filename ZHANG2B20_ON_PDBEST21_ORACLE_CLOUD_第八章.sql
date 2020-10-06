//µÚ°ËÕÂ£¬Ï°Ìâ


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
