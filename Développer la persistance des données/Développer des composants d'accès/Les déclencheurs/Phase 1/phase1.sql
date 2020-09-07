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
        SET reserv = (SELECT hot_id FROM hotel JOIN chambre, reservation
        WHERE hot_id = cha_hot_id AND res_cha_id = cha_id);
        IF COUNT(reserv)>10 THEN
    SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Capacité maximum atteinte !';
    END IF;
    END;
//

DELIMITER ;