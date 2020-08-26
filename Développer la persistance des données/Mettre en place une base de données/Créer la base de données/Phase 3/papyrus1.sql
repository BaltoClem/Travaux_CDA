DROP DATABASE IF EXISTS papyrus;
CREATE DATABASE papyrus;
USE papyrus;

CREATE TABLE produit (

CODART      CHAR(4) NOT NULL PRIMARY KEY,
LIBART      VARCHAR(30),
STKALE      INT(10),
STKPHY      INT(10),
QTEANN      INT(10),
UNIMES      CHAR(5)

);

CREATE TABLE fournis (

NUMFOU      VARCHAR(25) NOT NULL PRIMARY KEY,
NOMFOU      VARCHAR(25),
RUEFOU      VARCHAR(50),
POSFOU      CHAR(5),
VILFOU      VARCHAR(30),
CONFOU      VARCHAR(15),
SATISF      TINYINT(3)

);

CREATE TABLE vente (

DELLIV      SMALLINT(5),
QTE1        INT(10),
PRIX1       VARCHAR(50),
QTE2        INT(10),
PRIX2       VARCHAR(50),
QTE3        INT(10),
PRIX3       VARCHAR(50),
NUMFOU      VARCHAR(25) NOT NULL,
CODART      CHAR(4) NOT NULL,
PRIMARY KEY (NUMFOU, CODART),
FOREIGN KEY (NUMFOU) REFERENCES fournis(NUMFOU),
FOREIGN KEY (CODART) REFERENCES produit(CODART)

);

CREATE TABLE entcom (

NUMCOM      INT(10) NOT NULL PRIMARY KEY,
OBSCOM      VARCHAR(50),
DATCOM      DATE,
NUMFOU      VARCHAR(25),
FOREIGN KEY (NUMFOU) REFERENCES fournis(NUMFOU)

);

CREATE TABLE ligcom (

NUMLIG      TINYINT(3) NOT NULL PRIMARY KEY,
QTECDE      INT(10),
PRIUNI      VARCHAR(50),
QTELIV      INT(10),
DERLIV      DATETIME,
NUMCOM      INT(10) NOT NULL,
CODART      CHAR(4) NOT NULL,
FOREIGN KEY (CODART) REFERENCES produit(CODART),
FOREIGN KEY (NUMCOM) REFERENCES entcom(NUMCOM)

);