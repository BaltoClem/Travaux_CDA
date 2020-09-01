/* EXERCICE - La Base 'Exemple' Partie 1 */

/* JOINTURES */

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

/* AUTO-JOINTURES */
