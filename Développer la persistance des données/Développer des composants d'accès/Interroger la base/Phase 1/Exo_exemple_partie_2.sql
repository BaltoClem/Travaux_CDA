/* EXERCICE - La Base 'Exemple' Partie 1 */

/* ------------------------JOINTURES --------------------------*/

/* Rechercher le prénom des employés et le numéro de la région de leur
département. */

SELECT prenom, noregion
FROM employe
INNER JOIN dept
ON nodep = nodept;

/* Rechercher le numéro du département, le nom du département, le
nom des employés classés par numéro de département (renommer les
tables utilisées). */

SELECT nodept AS "Numéro de Département", dept.nom AS "Nom de Département", employe.nom AS "Nom employés"
FROM dept
INNER JOIN employe
ON nodep = nodept
ORDER BY nodept ASC;

/* Rechercher le nom des employés du département Distribution.  */

SELECT employe.nom AS "Nom des Employés Distribution"
FROM employe
INNER JOIN dept
ON nodep = nodept
WHERE dept.nom = "distribution";

/* ----------------------AUTO-JOINTURES-------------------------- */

SELECT E.nom, E.salaire, P.nom, P.salaire
FROM employe E INNER JOIN employe P
ON E.nosup = P.noemp
WHERE E.salaire > P.salaire;

/* -----------------------SOUS-REQUETES----------------------------*/

/* Rechercher le nom et le titre des employés qui ont le même titre que
Amartakaldire. */

SELECT nom, titre
FROM employe
WHERE titre IN (SELECT titre FROM employe WHERE nom = "amartakaldire");

/* Rechercher le nom, le salaire et le numéro de département des
employés qui gagnent plus qu'un seul employé du département 31,
classés par numéro de département et salaire. */

SELECT nom, salaire, nodep
FROM employe
WHERE salaire > ANY (SELECT salaire FROM employe WHERE nodep = 31)
ORDER BY nodep, salaire;

/* Rechercher le nom, le salaire et le numéro de département des
employés qui gagnent plus que tous les employés du département 31,
classés par numéro de département et salaire. */

SELECT nom, salaire, nodep
FROM employe
WHERE salaire > ALL (SELECT salaire FROM employe WHERE nodep = 31)
ORDER BY nodep, salaire;

/*Rechercher le nom et le titre des employés du service 31 qui ont un
titre que l'on trouve dans le département 32. */

SELECT nom, titre
FROM employe
WHERE nodep = 31 AND titre IN (SELECT titre FROM employe WHERE nodep = 32);

/*Rechercher le nom et le titre des employés du service 31 qui ont un
titre l'on ne trouve pas dans le département 32. */

SELECT nom, titre
FROM employe
WHERE nodep = 31 AND titre NOT IN (SELECT titre FROM employe WHERE nodep = 32);

/*Rechercher le nom, le titre et le salaire des employés qui ont le même
titre et le même salaire que fairent. */

SELECT nom, titre, salaire
FROM employe
WHERE titre IN (SELECT titre FROM employe WHERE nom = "fairent") 
AND salaire IN (SELECT salaire FROM employe WHERE nom = "fairent");

/*Rechercher le numéro de département, le nom du département, le
nom des employés, en affichant aussi les départements dans lesquels
il n'y a personne, classés par numéro de département.*/

SELECT dept.nodept, dept.nom, employe.nom
FROM dept
LEFT JOIN employe
ON nodep = nodept
ORDER BY nodept DESC;

/*--------------------- LES GROUPES -----------------------*/

/* Calculer le nombre d'employés de chaque titre.*/

SELECT titre, COUNT(noemp) AS "Nombre d'employés"
FROM employe
GROUP BY titre;

/* Calculer la moyenne des salaires et leur somme, par région.*/

SELECT nodep AS "Numéro de département", AVG(salaire) AS "Moyenne des salaires", SUM(salaire) AS "Somme des salaires"
FROM employe
GROUP BY nodep ASC;

/*--------------------- LA CLAUSE HAVING -----------------------*/

/* Afficher les numéros des départements ayant au moins 3 employés. */

SELECT nodep, COUNT(noemp) AS "Nombre d'employés"
FROM employe
GROUP BY nodep
HAVING COUNT(noemp) >= 3;

/* Afficher les lettres qui sont l'initiale d'au moins trois employés. */

SELECT LEFT(nom, 1) AS "Initial"
FROM employe
GROUP BY LEFT(nom, 1)
HAVING COUNT(nom) >= 3;

/* Rechercher le salaire maximum et le salaire minimum parmi tous les
salariés et l'écart entre les deux. */

SELECT MAX(salaire) AS "Salaire maximum", MIN(salaire) AS "Salaire minimum", MAX(salaire) - MIN(salaire) AS "Ecart"
FROM employe;

/* Rechercher le nombre de titres différents.  */

SELECT COUNT(titre) AS "Nombre de titres"
FROM employe;

/* Pour chaque titre, compter le nombre d'employés possédant ce titre. */

SELECT titre As "Nom du titre", COUNT(titre) AS "Nombre de titres"
FROM employe
GROUP BY titre;

/* Pour chaque nom de département, afficher le nom du département et
le nombre d'employés. */

SELECT dept.nom AS "Nom de département", COUNT(employe.noemp) AS "Nombre d'employés"
FROM employe
INNER JOIN dept
ON nodep = nodept
GROUP BY dept.nom;

/* Rechercher les titres et la moyenne des salaires par titre dont la
moyenne est supérieure à la moyenne des salaires des Représentants. */

SELECT titre, AVG(salaire) AS "Moyenne des salaires", (SELECT AVG(salaire) FROM employe WHERE titre = "représentant") AS "Moyenne salaires rep"
FROM employe
GROUP BY titre
HAVING AVG(salaire) > (SELECT AVG(salaire) FROM employe WHERE titre = "représentant");

/* Rechercher le nombre de salaires renseignés et le nombre de taux de
commission renseignés. */

SELECT COUNT(salaire) AS "Nombre de salaires renseignés", COUNT(tauxcom) AS "Taux de commission renseignés"
FROM employe;