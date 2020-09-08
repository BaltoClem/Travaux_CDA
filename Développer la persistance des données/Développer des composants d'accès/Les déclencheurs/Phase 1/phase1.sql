/* --------Bien débuter : les déclencheurs ----- */

/* Premier exemple */

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

CREATE TRIGGER insert_reservation2 BEFORE INSERT ON reservation
    FOR EACH ROW
    BEGIN
    DECLARE clireserv INT;
    SET clireserv = (SELECT COUNT(res_cli_id) FROM reservation 
    GROUP BY res_cli_id LIMIT 1);
    IF clireserv > 3 THEN
        SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Trop de réservations de la part du client!';
    END IF;
    END;
//

DELIMITER ;

/* Lors d'une insertion, on calcule le total des capacités des chambres pour l'hôtel, 
si ce total est supérieur à 50, on interdit l'insertion de la chambre.*/

