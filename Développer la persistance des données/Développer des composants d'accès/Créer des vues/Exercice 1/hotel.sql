/* ------------- Vues sur la base hotel -----------------*/

/* Afficher la liste des hôtels avec leur station */

CREATE VIEW v_hotstat
AS
SELECT hot_nom AS "Nom d'hôtel", sta_nom AS "Nom de station"
FROM hotel
JOIN station
ON hot_sta_id = sta_id
ORDER BY hot_nom;

SELECT * FROM v_hotstat