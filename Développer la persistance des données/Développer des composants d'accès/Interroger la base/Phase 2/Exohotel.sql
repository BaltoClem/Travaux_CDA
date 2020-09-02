/* ------------------- LOT 1 ----------------------*/

/* 1 - Afficher la liste des hôtels. 
Le résultat doit faire apparaître le nom de l’hôtel et la ville */

SELECT hot_nom AS "Nom de l'hôtel", hot_ville AS "Ville"
FROM hotel;

/* 2 - Afficher la ville de résidence de Mr White. 
Le résultat doit faire apparaître le nom, le prénom, et l'adresse du client*/

SELECT cli_nom, cli_prenom, cli_ville
FROM client
WHERE cli_nom = "White";

/* 3 - Afficher la liste des stations dont l’altitude < 1000 
Le résultat doit faire apparaître le nom de la station et l'altitude*/

SELECT sta_nom, sta_altitude
FROM station
WHERE sta_altitude < 1000;

/* 4 - Afficher la liste des chambres ayant une capacité > 1
Le résultat doit faire apparaître le numéro de la chambre ainsi que la capacité*/

SELECT cha_numero AS "Numéro de chambre", cha_capacite AS "Capacité de la chambre"
FROM chambre 
WHERE cha_capacite > 1;

/* 5 - Afficher les clients n’habitant pas à Londres
Le résultat doit faire apparaître le nom du client et la ville*/

SELECT cli_nom, cli_ville
FROM client
WHERE cli_ville != "Londre";

/* 6 - Afficher la liste des hôtels située sur la ville de Bretou et possédant une catégorie>3 
Le résultat doit faire apparaître le nom de l'hôtel, ville et la catégorie*/

SELECT hot_nom, hot_ville, hot_categorie
FROM hotel
WHERE hot_ville = "Bretou" AND hot_categorie > 3;

/* ------------------- LOT 2 ----------------------*/

/* 7 - Afficher la liste des hôtels avec leur station 
Le résultat doit faire apparaître le nom de la station, le nom de l’hôtel, la catégorie, la ville)*/

SELECT hot_nom, hot_categorie, hot_ville, sta_nom
FROM station
INNER JOIN hotel
WHERE sta_id = hot_sta_id;

/* 8 - Afficher la liste des chambres et leur hôtel 
Le résultat doit faire apparaître le nom de l’hôtel, la catégorie, la ville, le numéro de la chambre)*/

SELECT cha_numero, hot_nom, hot_categorie, hot_ville
FROM hotel
INNER JOIN chambre
WHERE hot_id = cha_hot_id;

/* 9 - Afficher la liste des chambres de plus d'une place dans des 
hôtels situés sur la ville de Bretou 
Le résultat doit faire apparaître le nom de l’hôtel, la catégorie, 
la ville, le numéro de la chambre et sa capacité)*/

SELECT cha_numero, hot_nom, hot_categorie, hot_ville, cha_capacite
FROM hotel
INNER JOIN chambre
ON hot_id = cha_hot_id
WHERE cha_capacite > 1 AND hot_ville = "Bretou";

/* 10 - Afficher la liste des réservations avec le nom des clients 
Le résultat doit faire apparaître le nom du client, le nom de l’hôtel, 
la date de réservation*/

SELECT cli_nom AS "Nom du client", hot_nom AS "Nom de l'hôtel", res_date As "Date de réservation"
FROM reservation
INNER JOIN client
ON res_cli_id = cli_id
INNER JOIN chambre
ON res_cha_id = cha_id
INNER JOIN hotel
ON cha_hot_id = hot_id;

/* 11 - Afficher la liste des chambres avec le nom de l’hôtel 
et le nom de la station 
Le résultat doit faire apparaître le nom de la station, 
le nom de l’hôtel, le numéro de la chambre et sa capacité)*/

SELECT sta_nom AS "Nom de station", hot_nom AS "Nom de l'hôtel", cha_numero AS "Numéro de chambre", cha_capacite AS "Capacité de la chambre"
FROM station
INNER JOIN hotel
ON sta_id = hot_sta_id
INNER JOIN chambre
ON hot_id = cha_hot_id;

/* 12 -  Afficher les réservations avec le nom du client et le nom de l’hôtel 
Le résultat doit faire apparaître le nom du client, le nom de l’hôtel,
la date de début du séjour et la durée du séjour*/

SELECT cli_nom AS "Nom du client", hot_nom AS "Nom de l'hôtel", res_date_debut AS "Début du séjour", DATEDIFF(res_date_fin, res_date_debut) AS "Durée du séjour (en jours)"
FROM client
INNER JOIN reservation
ON res_cli_id = cli_id
INNER JOIN chambre
ON res_cha_id = cha_id 
INNER JOIN hotel
ON cha_hot_id = hot_id;

/* ------------------- LOT 3 ----------------------*/

/* 13 - Compter le nombre d’hôtel par station */

SELECT sta_nom AS "Nom de la station", COUNT(hot_id) AS "Nombre d'hôtels"
FROM station
INNER JOIN hotel
ON sta_id = hot_sta_id
GROUP BY sta_nom;

/* 14 - Compter le nombre de chambre par station */

SELECT sta_nom AS "Nom de la station", COUNT(cha_id) AS "Nombre de chambres"
FROM station
INNER JOIN hotel
ON sta_id = hot_sta_id
INNER JOIN chambre
ON hot_id = cha_hot_id
GROUP BY sta_nom;

/* 15 - Compter le nombre de chambre par station ayant une capacité > 1 */

SELECT sta_nom AS "Nom de la station", COUNT(cha_id) AS "Nombre de chambres"
FROM station
INNER JOIN hotel
ON sta_id = hot_sta_id
INNER JOIN chambre
ON hot_id = cha_hot_id
WHERE cha_capacite > 1
GROUP BY sta_nom;

/* 16 - Afficher la liste des hôtels pour lesquels Mr Squire a effectué une réservation */

SELECT cli_nom AS "Nom Client", hot_nom AS "Nom d'hotel"
FROM hotel
JOIN chambre
ON hot_id = cha_hot_id
JOIN reservation
ON cha_id = res_cha_id
JOIN client
ON cli_id = res_cli_id
WHERE cli_nom = "Squire";

/* 17 - Afficher la durée moyenne des réservations par station */

SELECT sta_nom AS "Nom de la Station", AVG(DATEDIFF(res_date_fin,res_date_debut)) AS "Durée moyenne"
FROM station
JOIN hotel
ON sta_id = hot_sta_id
JOIN chambre
ON hot_id = cha_hot_id
JOIN reservation
ON cha_id = res_cha_id
GROUP BY sta_nom;