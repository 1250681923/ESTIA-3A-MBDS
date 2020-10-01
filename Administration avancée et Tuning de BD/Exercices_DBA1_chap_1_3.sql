/*
Exercices A : chap.2 & 3 

2.1 Gestion d’une instance au nic=veau CDB uniquemeny
	a) quel est le nom des instances actives sur votre machine host ?
	b) arrêter et démarrer votre instance via les services windows et sur la ligne de commande
		base arrêté, tenter de vous connecter via SQLPLUS. Faite la même chose base ouverte.
	c) Arrêter puis Faite un démarrage partiel (NOMOUNT) de votre INSTANCE sous SQLPLUS. 	
	Essayer de créer une table. Compléter le démarrage par pallier (MOUNT) puis OPEN. 
	Expliquer 	les différents états
	d) arrêter le listener et tenter de vous de vous connecter à la base via SQLPLUS. 
	Redémarrer le listener et tentez à nouveau de vous connecter
	e) se connecter sur l’instance via EM EXPRESS (Enterprise Manager Express)
	f) afficher les information sur l’instance (v$instance)
	

2.2 Découverte de l'arborescence d'Oracle et de quelques fichiers sensibles
	a)	localiser les fichiers suivants et indiqués leur rôle :
		. alert_DBCOURS.log (Unix, NT). catalog.sql (NT, UNIX)courLGWR.trc (NT) ou lgwr_cour.trc (Unix)					. *ora*.trc (NT) ou ora_*.trc(Unix)		. Oracle.exe (NT) ou oracle (Unix)						. initCOUR.ora (NT) ou initCOURS.ora (Unix)  spfileCOUR.ora(NT, Unix)			. Dbshut, dbstart et oratab (Unix)
		NOTA : Localiserles fichiers suivis de (NT) 

2.3	paramètres d''initialisations
	a)	donner les différentes possibilités pour visualiser les paramètres d''initialisation d''une instance 
	active. 
*/
sql> show parameter
sql> show parameter sga
sql> desc v$paramter
sql> select name, value from v$paramter order by name;
sql> 
/*
	b)	lister via un ordre SQL les paramètres modifiés
*/
sql> select name, value from v$parameter where isdefault = 'FALSE';

sql> select name, value from v$parameter where isdefault = 'FALSE' and name = 'control_files';

sql> select table_name from dict where table_name like '%PARAMETER%';

/*
	c)	lister via un ordre SQL les paramètres modifiables pour une instance entière
*/



/*
	d) lister via un ordre SQL les paramètres modifiables pendant une session
*/


/*	

	
e) Modifier le paramètre sga_target, sga_max_size, pga_aggregate_target à 50% de la valeur de
 memory_max_target et memory_target

scope=both
    scope=spfile
    Oracle spfile就是动态参数文件，里面设置了Oracle 的各种参数。所谓的动态，
就是说你可以在不关闭数据库的情况下，更改数据库参数，记录在spfile里面。更改参数
的时候，有4种scope选项，scope就是范围。
    scope=spfile 仅仅更改spfile里面的记载，不更改内存，也就是不立即生效，而是等
下次数据库启动生效。
    有一些参数只允许用这种方法更改，scope=memory 仅仅更改内存，不改spfile。也就是下次
启动就失效了
    scope=both 内存和spfile都更改，不指定scope参数，等同于scope=both。
*/
//下次启动时生效
alter system sga_max_size=3G scope=spfile;
alter system sga_target=3G scope=both;

/*
f) Faite en sorte d’afficher les messages dans une autre langue que la langue courante (paramètre 	
NLS_LANGUAGE et NLS_DATE_FORMAT)
//展示系统时间并且改变形式
*/


show parameter nls_date_format
select sysdate from dual;
alter session set nls_date_format = 'DD-MM-YYYY';
select sysdate from dual;

 
select to_date(sysdate, 'DD-MM-YYYY') from dual;
 
 
/*
g) a quoi sert la variable d’environnement NLS_LANG, ORACLE_BASE?, ORACLE_HOME, PATH
h) que vaut db_cache_size ? Et pourquoi ?

2.4 Le dictionnaire de données d'Oracle
 a) donner la liste des vues du dictionnaire de données d'Oracle(dict) triée par nom
 b) Lister uniquement les vues concernant les TABLES

2.5 Donner la liste des utilisateurs (v$session : username, serial#, sid, paddr, program, terminal, 
ident) connectés sur votre instance courante. Ident est une colonne rajoutée pour identifier de 
façon explicite les process background et les process utilisateurs. S''il s'agit d'un process utilisateur, 
ident vaut "PROCESS BACKGROUND" sinon il vaut "PROCESS UTILISATEUR".	

//可以看出现在连接的用户
*/

select * from v$session order by username;
/*


		
2.6  Déterminer la taille de la SGA
 a) taille globale (v$sga)
 b) taille détaillée (v$sgastat)
2.7	Indiquer si la taille des buffers de données est suffisante ou non en calculant le ratio suivant :
			R =  ( 1 - (Physical reads / (db block gets + consistent gets))) * 100
 		Dans le cas ou elle n''est pas suffisante, proposer des mesures pour améliorer la situation.
		Notes :
			a) Nom des statistiques intéressantes :
				- db block gets 		: nombre de blocs lus
				- consistent gets	: nombre de blocs recherchés dans le buffer RBS ou le RBS
				- physical reads		: nombre de blocs lus sur disque.
			b) db block gets + consistent gets = nombre total de blocs lus en mémoire ou sur disque
			Nota : Utiliser le DATABASE CONTROL
*/
select * from v$sga;
select * from v$sgastat;


/*
2.8	La PGA 
a) Déterminer la taille de la PGA associée à votre session en mode server dédié 
(v$session, v$sesstat, v$statname).
b) Lister les informations sur la PGA globale (V$PGASTAT)
c) Utiliser le DATABASE CONTROL
*/
select * from v$pgastat;


//查出用户的操作

select PARSING_SCHEMA_NAME, sql_text
from v$sqlarea
where PARSING_SCHEMA_NAME like '%2B20'
order by PARSING_SCHEMA_NAME;


/*
2.9	Donner le texte de la requête lancée par chaque utilisateur connecté sur la base 
(v$sqlarea, v$session).

2.10. Visualisation des propriétés de la base

Afficher les différentes propriétés de la base (vue database_properties).

Afficher les informations sur la base de données (v$database)

	
*/