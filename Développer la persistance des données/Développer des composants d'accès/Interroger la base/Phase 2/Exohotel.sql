/* ------------------- Lot 1 ----------------------*/

/* 1 - Afficher la liste des hôtels. 
Le résultat doit faire apparaître le nom de l’hôtel et la ville */

SELECT hot_nom AS "Nom de l'hôtel", hot_ville AS "Ville"
FROM hotel;

/* 2 - Afficher la ville de résidence de Mr White. 
Le résultat doit faire apparaître le nom, le prénom, et l'adresse du client*/

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

/* 6 - Afficher la liste des hôtels située sur la ville de Bretou et possédant une catégorie>3 
Le résultat doit faire apparaître le nom de l'hôtel, ville et la catégorie*/

SELECT hot_nom, hot_ville, hot_categorie
FROM hotel
WHERE hot_ville = "Bretou" AND hot_categorie > 3;

/* ------------------- Lot 2 ----------------------*/