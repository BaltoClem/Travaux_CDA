/* --------------------- Exercice 2---------------------*/

/* Pourquoi ? */

/* Dès lors que l'utilisateur ayant effectué le "START TRANSACTION"
mais ne l'a pas COMMIT, personne ne peut modifier les données, ni même les lire */

/* Recommencez l'exécution du script de l'exercice précédent, 
puis ouvrez une nouvelle fenêtre (Ctrl N dans Heidy SQL), 
et définissez le niveau d'isolement à la valeur UNCOMMITTED. */

/* Si l'on veut que les autres utilisateurs lisent ce qui n'a pas été COMMIT*/

SELECT nomfou FROM fournis WHERE numfou=120;

    UPDATE fournis  SET nomfou= 'GROSBRIGANT' WHERE numfou=120;

    SELECT nomfou FROM fournis WHERE numfou=120;

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

/* Si l'on veut que les autres utilisateurs lisent ce qui a été COMMIT*/

START TRANSACTION;

SELECT nomfou FROM fournis WHERE numfou=120;

    UPDATE fournis  SET nomfou= 'GROSBRIGANT' WHERE numfou=120;

    SELECT nomfou FROM fournis WHERE numfou=120;

COMMIT;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

/* Interrogez le fournisseur 120. Que constatez-vous ? Expliquez. */

/* Nous avons configuré la transaction pour que les autres 
utilisateurs puissent voir les changements n'ayant pas subi de 
"COMMIT", dès lors, lorsqu'un utilisateur interroge le fournisseur
"120", il peut voir les changements non définitifs. */
