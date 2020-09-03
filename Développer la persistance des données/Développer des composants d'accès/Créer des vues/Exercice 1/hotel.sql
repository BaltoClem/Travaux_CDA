/* ------------- Vues sur la base hotel -----------------*/

/* Afficher la liste des hôtels avec leur station */

CREATE VIEW v_hotstat
AS
SELECT hot_nom AS "Nom d'hôtel", sta_nom AS "Nom de station"
FROM hotel
JOIN station
ON hot_sta_id = sta_id
ORDER BY hot_nom;

SELECT * FROM v_hotstat;

/* Afficher la liste des chambres et leur hôtel */

CREATE VIEW v_chahot
AS
SELECT cha_numero AS "Numéro de chambre", hot_nom AS "Nom d'hôtel"
FROM chambre
JOIN hotel
ON cha_hot_id = hot_id
ORDER BY cha_numero;

SELECT * FROM v_chahot;

/* Afficher la liste des réservations avec le nom des clients */

CREATE VIEW v_rescli
AS
SELECT res_id AS "Numéro de réservation", cli_nom AS "Nom du client"
FROM reservation
JOIN client
ON res_cli_id = cli_id
ORDER BY res_id;

SELECT * FROM v_rescli;

/* Afficher la liste des chambres avec le nom de l’hôtel et le nom de la station */

CREATE VIEW v_chahotres
AS
SELECT cha_numero AS "Numéro de chambre", hot_nom AS "Numéro de l'hôtel", sta_nom AS "Nom de la station"
FROM chambre, hotel, station
WHERE cha_hot_id = hot_id AND hot_sta_id = sta_id
ORDER BY cha_numero;

SELECT * FROM v_chahotres;

/* Afficher les réservations avec le nom du client et le nom de l’hôtel */

CREATE VIEW v_resclihot
AS
SELECT res_id AS "Numéro de réservation", cli_nom AS "Nom du client", hot_nom AS "Nom de l'hôtel"
FROM reservation, client, chambre, hotel
WHERE res_cli_id = cli_id AND res_cha_id = cha_id AND cha_hot_id = hot_id
ORDER BY res_id;

SELECT * FROM v_resclihot;