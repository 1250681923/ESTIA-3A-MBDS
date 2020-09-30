Exercices D: chap.5 , Ces exercices sont à faire uniquement dans la PDB
//所有的创建账号和赋予权限需要用主账号
//用主账号创建一个账号，所有的数据库对象的集合被称为schema
//如果是不同的PDB,不能直接删除他人的信息。
//但是可以这么做：
// select * from XXXXX2B20.XX@pdbest21.univer.fr    叫做DBlink
//此次主账号为ZHANG2B20@PDBEST21/ZHANG2B2001 此PDB连接的是美国的一个远程IP
//使用Oracle instant client和sqlplus进行操作
5.1. Créer un utilisateur oracle ayant votre nom XXXx avec les caractéristiques 
suivantes :
- tablespace par défaut : users
- tablespace temporaire : temp
- mot de passe : à votre choix


//用主账号登录后进行创建
create user zhangquan identified by 111111
default tablespace users
temporary tablespace temp;

5.2. Connectez vous comme étant XXXx. Que constatez vous ?

//权限不足，需要给与创建权限
sql>connect zhangquan/111111
ERROR:
ORA-01045: user ZHANGQUAN lacks CREATE SESSION privilege; logon denied







5.3. Etant System, Affectez le privilège CREATE SESSION à l''utilisateur 
et reconnectez vous comme étant XXXx. Si la connexion a réussi, tentez 
de créer la table PILOTEx. Que constatez vous ? Remedier au problème.

sql> grant create session to zhangquan;
SQL> connect zhangquan@pdbest21/111111
Connected.

sql>create table pilote (pl# number(8) constraint pk_pilote_pl# primary key,
plnom varchar2(30)
);

-----
create table pilote (pl# number(8) constraint pk_pilote_pl# primary key,
*
ERROR at line 1:
ORA-01031: insufficient privileges


sql>grant create table to zhangquan;


sql>create table pilote (pl# number(8) constraint pk_pilote_pl# primary key,
plnom varchar2(30)
);
------
Table created.



sql> insert into pilote (pl#, plnom) values (1, 'King');
ERROR at line 1:
ORA-01950: no privileges on tablespace 'USERS'


sql> dorp table pilote
sql>create table pilote (pl# number(8) constraint pk_pilote_pl# primary key,
plnom varchar2(30)
)
segment creation immediate;
------
Table created.

//主用户赋予权限
sql>alter user zhangquan quota unlimited on users;

//再次插入
sql> insert into pilote (pl#, plnom) values (1, 'King');

1 row created.


//最后
commit;







5.4. Etant System, retirer les privilèges accordés à XXX et supprimez 
la table qu''il à créée
//主用户
sql> revoke create session, create table from zhangquan;

//剥夺权限后，只能从主用户中删除表和创建表
sql> drop table zhangquan.pilote;
sql>create table zhangquan.pilote (pl# number(8) constraint pk_pilote_pl# primary key,
plnom varchar2(30)
)
segment creation immediate;
-----
Table created.

sql> insert into zhangquan.pilote (pl#, plnom) values (1, 'King');

sql> select * from zhangquan.pilote;







5.5. Etant System, créer un rôle RL_XXX qui permettent à l''utilisateur XXX
 de se connecter, de créer des tables, d''insérer des lignes dans ses tables 
 et de créer des clusters
//主账号
sql>create role r1_zhangquan;
sql>grant create session, create table, create cluster to r1_zhangquan;









 5.6. Créer un rôle RL_ADMINx qui vous permet de supprimer, consulter 
 et alterer des tables dans
 n''importe quel schéma. Ce rôle doit être créé avec un mot de passe.
 
 5.7. Affectez RL_XXX et RL_ADMINx à l''utilisateur XXX. Attention le rôle 
 RL_ADMINx ne doit pas être un rôle par défaut
 
 5.8. Connectez vous comme étant XXX. Tentez decréer la fameuse table 
 PILOTEx dans votre schéma. Ensuite utilisez votre rôle RL_ADMINx pour 
 supprimer la table pilote de votre voisin.
 
 5.9. Connectez vous comme étant System. Rétirez le privilège de création
 d''une table à XXX. Injectez dans le schéma de XXX les tables VOLx et 
 AVIONx manquantes.Y insérer des enregistrements
 
 5.10. Etant System, créer un profile PF_XXX qui permet à XXX de ne pas pouvoir 
 créer plus de 2 sessions et d''être déconnecté si pendant deux minute, 
 il n''a rien fait. Testez et vérifier les informasations dans le dictionnaire

5.11 Vérifier que l’option d’audit BD est bien active. Auditer l’ensemble 
de l’activité de l’utilisateur UAIRBASE en cas de succès ou d’insuccès. 
Connnectez vous comme étant UAIRBASE et faite de l’activité (consulter 
scott.emp, verrouiller  en exclusif scott.bonus, supprimer toutes les 
lignes de scott.emp, faite Rollback). Visualiser les options d’audit 
posées et l’audit fait sur uairbase.
