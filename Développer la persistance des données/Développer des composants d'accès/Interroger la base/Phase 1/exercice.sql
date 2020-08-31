/* EXERCICE - La Base 'Exemple' */

/* 1 */

SELECT *
FROM employe;

/* 2 */

SELECT *
FROM dept;

/* 3 */

SELECT nom AS 'Nom de l’Employé', dateemb, nosup, nodep, salaire
FROM employe;

/* 4 */

SELECT DISTINCT titre
FROM employe;

/* 5 */

SELECT DISTINCT titre, salaire
FROM employe ;

/* 6 */

SELECT nom, noemp, nodep
FROM employe
WHERE titre = 'secrétaire' ;

/* 7 */

SELECT nom, nodep
FROM employe
WHERE nodep > 40 ;

/* 8 */

SELECT nom, prenom
FROM employe
WHERE nom < prenom ;

/* 9 */

SELECT nom, salaire, nodep
FROM employe
WHERE titre = 'représentant' AND nodep = '35' AND salaire > 20000 ;
