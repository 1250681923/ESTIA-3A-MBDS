Exercices A : chap.6 , Ces exercices sont à faire uniquement dans la PDB


//普通学生没有权限

Partie 1: SAUVGARDE ET RESTAURATION MANUELLE

a) SANS ARCHIVES
6.1. Vérifier le status actuel de votre base et se mettre en mode sans archive si utile

6.2  Arrêter la base de données et prendre une sauvegarde complète

6.3 Perdre un fichier de contrôle et le restaurer à partir des fichiers multiplexés

6.4 Créer une table dans le tablespace USERS y insérer des lignes. Changer 6 fois 
de groupes de REDO LOG. Arrêter la base et sauver les fichiers du tablespace USERS

6.5 Perdre les fichiers du tablespace USERS. Redemarrer la base. Remédier au 
problème en partant des fichiers du tablespace USERS de la sauvegarde faite en 
6.2. Rémédier  problèmes

a) Avec ARCHIVES
6.6 Passer la base de données en mode avec archives

6.7 Insérer des lignes dans la table créé en 6.4. Changer 6 fois de groupes de REDO LOG. 
Arrêter la base et sauver les fichiers du tablespace USERS

6.8 Perdre les fichiers du tablespace USERS. Redemarrer la base. Remédier au 
problème en partant des fichiers du tablespace USERS de la sauvegarde faite en 
6.4. Recouvrez la base

6.5 RMAN et sauvegarde

6.5.1. Faire passer la base en mode avec Archive si elle ne l’est pas déjà 
sql> connect sys as sysdba
sql> archive log list;

-------
mode Database log         mode Archive
........


sql>shutdown immediate 
sql>startup mount;
sql>AlTER DATABASE O
















6.5.2. Configuration de RMAN
se connecter à RMAN sur la base TARGET 
	a) Visualiser la configuration actuelle
	b) mettre les fichiers de contrôles en sauvegarde automatique
	c) Mettre la redondance à 3 fichiers
	d) Omettre la sauvegarde d’un fichier le fichier a déjà été sauvegardé par RMAN et 	
	qu’il n’a pas été modifié	
	e) Conserver chaque sauvegarde au moins 7 jours
	f) Exclure de la sauvegarde les fichiers du tablespace TS_TAB_AIRBASE_AUTO
	h) visualiser la configuration
	i) Inclure la sauvegarde des fichiers du tablespace TS_TAB_AIRBASE_AUTO


6.5.3 Backup de la base de données
	a) Faire une sauvegarde de la base entière en y incluant les archives, les fichiers
	de contrôles et le spfile
	
cmd : en tant que administrateur
c: \> set ORACLE_SID=dbtext19
c: \> rman
rman> connect target sys/passdesys
rman> backup database;

rman> backup database plus archivelog;
	
	b) Afficher la liste des sauvegardes de la base target
	
rman> list backup;


	c) Ajouter un tablespace à la base et effectuer les sauvegardes appropriés y compris 
	le fichier de contrôle
	
	

	d) afficher la liste des copies de sauvegarde
	e) Faire de l’activité sur la base de données dans le tablespace ajouté. Changer 
	au moins 6 fois de groupe de fichiers redolog


alter system switch logfile;

6.5.4 Restauration et recouvrement de la base
a) Provoquer de l’activité dans le tablespace créé en 6.5.3 changer de groupes de logs
b) sauvegarder les archives uniquement
c) arrêter la base et faire perdre les fichiers de ce tablespace
d) Restaurer les fichiers de ce tablespace
c) Recouvrez la base

rman> restore database;
rman> restore pluggable database 