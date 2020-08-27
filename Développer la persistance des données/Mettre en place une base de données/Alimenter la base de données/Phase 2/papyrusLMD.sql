DROP DATABASE IF EXISTS papyrusLMD;
CREATE DATABASE papyrusLMD;
USE papyrusLMD;

CREATE TABLE produit (

CODART      CHAR(4) NOT NULL PRIMARY KEY,
LIBART      VARCHAR(30) NOT NULL,
UNIMES      CHAR(5) NOT NULL,
STKALE      INT(10) NOT NULL,
STKPHY      INT(10) NOT NULL,
QTEANN      INT(10) NOT NULL


);

CREATE TABLE fournis (

NUMFOU      VARCHAR(25) NOT NULL PRIMARY KEY,
NOMFOU      VARCHAR(25) NOT NULL,
RUEFOU      VARCHAR(50) NOT NULL,
POSFOU      CHAR(5) NOT NULL,
VILFOU      VARCHAR(30) NOT NULL,
CONFOU      VARCHAR(15) NOT NULL,
SATISF      TINYINT(2)

);

CREATE TABLE vente (

NUMFOU      VARCHAR(25) NOT NULL,
CODART      CHAR(4) NOT NULL,
DELLIV      SMALLINT(5) NOT NULL,
QTE1        INT(10) NOT NULL,
PRIX1       VARCHAR(50) NOT NULL,
QTE2        INT(10),
PRIX2       VARCHAR(50),
QTE3        INT(10),
PRIX3       VARCHAR(50),
PRIMARY KEY (NUMFOU, CODART),
FOREIGN KEY (NUMFOU) REFERENCES fournis(NUMFOU),
FOREIGN KEY (CODART) REFERENCES produit(CODART)

);

CREATE TABLE entcom (

NUMCOM      INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
OBSCOM      VARCHAR(50),
DATCOM      DATETIME NOT NULL,
NUMFOU      VARCHAR(25),
FOREIGN KEY (NUMFOU) REFERENCES fournis(NUMFOU)

);

CREATE INDEX NUMFOUIND ON entcom(NUMFOU);

CREATE TABLE ligcom (

NUMLIG      TINYINT(3) NOT NULL PRIMARY KEY,
QTECDE      INT(10) NOT NULL,
PRIUNI      VARCHAR(50) NOT NULL,
QTELIV      INT(10),
DERLIV      DATETIME NOT NULL,
NUMCOM      INT(10) NOT NULL,
CODART      CHAR(4) NOT NULL,
FOREIGN KEY (NUMCOM) REFERENCES entcom(NUMCOM),
FOREIGN KEY (CODART) REFERENCES produit(CODART)

);

/* 

L'ordre à adopter pour alimenter la BDD pourrait être :

produit, fournis, vente, ligcom et entcom

Cet ordre est idéal puisque les deux premières tables n'ont pas de clés étrangères selon
le MCD de Papyrus, du coup aucun conflits liés à ces clés étrangères ne peut
arriver

*/

INSERT INTO fournis (NUMFOU, NOMFOU, RUEFOU, POSFOU, VILFOU, CONFOU, SATISF)
VALUES  ('00120', 'GROBRIGAN', '20 rue du papier', '92200', 'Papercity', 'Georges', 08),
        ('00540', 'ECLIPSE', '53 rue laisse flotter les rubans', '78250', 'Bugbugville', 'Nestor', 07),
        ('08700', 'MEDICIS', '120 rue des plantes', '75014', 'Paris', 'Lison', NULL),
        ('09120', 'DISCOBOL', '11 rue des sports', '85100', 'La Roche sur Yon', 'Hercule', 08),
        ('09150', 'DEPANPAP', '26 avenue des locomotives', '59987', 'Coroncountry', 'Pollux', 05),
        ('09180', 'HURRYTAPE ', '68 boulevard des octets', '04044', 'Dumpville', 'Track', NULL)
        


LOAD DATA LOCAL INFILE 'C:\\Users\\80010-91-10\\Documents\\Travaux_CDA\\vente.csv'
INTO TABLE vente
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(NUMFOU,CODART,DELLIV,QTE1,PRIX1,QTE2,PRIX2,QTE3,PRIX3);

