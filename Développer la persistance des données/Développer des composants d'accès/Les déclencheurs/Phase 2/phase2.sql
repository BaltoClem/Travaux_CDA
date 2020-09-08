/* ---- Création d'un déclencheur AFTER UPDATE ---- */

/* Créer une table ARTICLES_A_COMMANDER */

CREATE TABLE ARTICLES_A_COMMANDER (

codart      CHAR(4) PRIMARY KEY,
datecomm    DATETIME,
qte         INT,
FOREIGN KEY(codart) REFERENCES produit(codart)

);