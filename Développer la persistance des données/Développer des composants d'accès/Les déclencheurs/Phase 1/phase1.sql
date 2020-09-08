/* --------Bien débuter : les déclencheurs --------------- */

/* ------------------- Premier exemple--------------------- */

DELIMITER //

CREATE TRIGGER insert_station AFTER INSERT ON station
    FOR EACH ROW
    BEGIN
        DECLARE altitude INT;
        SET altitude = NEW.sta_altitude;
        IF altitude<1000 THEN
            SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Règle de gestion altitude !';
        END IF;
END;
//

DELIMITER ;

/* Interdire la modification des réservations 
(on autorise l'ajout et la suppression). */

DELIMITER //

CREATE TRIGGER modif_reservation AFTER UPDATE ON reservation
    FOR EACH ROW
    BEGIN
        SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. 
        Interdiction de modifier !';
    END;
//

DELIMITER ;

/* Interdire l'ajout de réservation pour les hôtels possédant 
déjà 10 réservations.*/

DELIMITER //

CREATE TRIGGER insert_reservation AFTER INSERT ON reservation
    FOR EACH ROW
    BEGIN
        DECLARE reserv INT;
        SET reserv = (SELECT COUNT(cha_hot_id)
        FROM reservation, chambre, hotel
        WHERE res_cha_id = cha_id AND cha_hot_id = hot_id);
        IF reserv > 10 THEN
            SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Capacité insuffisante !';
        END IF;
    END;
//

DELIMITER ;

/* Interdire les réservations si le client possède déjà 3 réservations.*/

DELIMITER //

CREATE TRIGGER insert_reservation2 AFTER INSERT ON reservation
    FOR EACH ROW
    BEGIN
        DECLARE clireserv INT;
        DECLARE numcli INT;
        SET numcli = NEW.res_cli_id;
        SET clireserv = (SELECT COUNT(res_id) FROM reservation WHERE res_cli_id = numcli);
        IF clireserv > 3 THEN
            SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Trop de réservations de la part du client !';
        END IF;
    END;
//

DELIMITER ;

/* Lors d'une insertion, on calcule le total des capacités des chambres pour l'hôtel, 
si ce total est supérieur à 50, on interdit l'insertion de la chambre.*/

DELIMITER //

CREATE TRIGGER insert_chambre AFTER INSERT ON chambre
    FOR EACH ROW
    BEGIN
        DECLARE capacite INT;
        DECLARE numcham INT;
        SET numcham = NEW.cha_hot_id;
        SET capacite = (SELECT SUM(cha_capacite)
        FROM chambre, hotel
        WHERE cha_hot_id = hot_id AND cha_hot_id = numcham);
        IF capacite > 50 THEN
            SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Capacité des chambres insuffisante pour cet hôtel !';
        END IF;
    END; 
//
DELIMITER ;

/* ------------------- Cas pratique--------------------- */

DELIMITER //

CREATE TRIGGER maj_total AFTER INSERT ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = NEW.id_commande; 
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c);
        UPDATE commande SET total=tot WHERE id=id_c;
END;
//
DELIMITER ;

/* 1 - Mettez en place ce trigger, puis ajoutez un produit dans une commande, vérifiez que le champ total est bien mis à jour. */

/* 2 - Ce trigger ne fonctionne que lorsque l'on ajoute des produits dans la commande, 
les modifications ou suppressions ne permettent pas de recalculer le total. 
Modifiez le code ci-dessus pour faire en sorte que la modification ou la 
suppression de produit recalcul le total de la commande. */ 

DELIMITER //

CREATE TRIGGER maj_total_ins AFTER INSERT ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = NEW.id_commande; 
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c);
        UPDATE commande SET total=tot WHERE id=id_c;
END //

CREATE TRIGGER maj_total_up AFTER UPDATE ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = NEW.id_commande; 
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c);
        UPDATE commande SET total=tot WHERE id=id_c;
END //

CREATE TRIGGER maj_total_del AFTER DELETE ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = OLD.id_commande; 
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c);
        UPDATE commande SET total=tot WHERE id=id_c;
END;

//
DELIMITER ;

/* 3 - Un champ remise était prévu dans la table commande. 
Prenez en compte ce champ dans le code de votre trigger. */ 

DELIMITER //

CREATE TRIGGER maj_total_ins AFTER INSERT ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = NEW.id_commande; 
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c);
        UPDATE commande SET total=(tot-(tot*(remise/100))) WHERE id=id_c;
END //

CREATE TRIGGER maj_total_up AFTER UPDATE ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = NEW.id_commande; 
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c);
        UPDATE commande SET total=(tot-(tot*(remise/100))) WHERE id=id_c;
END //

CREATE TRIGGER maj_total_del AFTER DELETE ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = OLD.id_commande; 
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_c);
        UPDATE commande SET total=(tot-(tot*(remise/100))) WHERE id=id_c;
END;

//
DELIMITER ;