/* ---- MySql : les déclencheurs, Papyrus ---- */

/* Création d'un déclencheur AFTER UPDATE */

/* Créer une table ARTICLES_A_COMMANDER */

CREATE TABLE ARTICLES_A_COMMANDER (

codart      CHAR(4) PRIMARY KEY,
datecomm    DATETIME,
qte         INT,
FOREIGN KEY(codart) REFERENCES produit(codart)

);

/* Créer un déclencheur UPDATE sur la table produit */


DELIMITER //

CREATE TRIGGER prod_maj AFTER UPDATE ON produit
    FOR EACH ROW
    BEGIN

    DECLARE stockale INT;
    DECLARE stockphy INT;
    DECLARE codarticle CHAR(4);
    DECLARE datecom DATETIME;
    DECLARE qteacom INT;

    SET codarticle = NEW.codart;
    SET stockale = (SELECT stkale FROM produit WHERE codart = codarticle);
    SET stockphy = (SELECT stkphy FROM produit WHERE codart = codarticle);
    SET qteacom = (SELECT qte FROM articles_a_commander WHERE codart = codarticle);
    SET datecom = (SELECT datecomm FROM articles_a_commander WHERE codart = codarticle);
        IF stockphy < stockale AND qteacom IS NULL THEN
        INSERT INTO articles_a_commander(codart, datecomm, qte)
        VALUES ( NEW.codart, NOW(), stockale - stockphy);
            ELSEIF qteacom IS NOT NULL THEN
            UPDATE articles_a_commander 
            SET qte=((stockale - stockphy) - qteacom)
            WHERE codart = codarticle;
        END IF;
    END;

//

DELIMITER ;