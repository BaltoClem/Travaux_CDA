/*---------------- Exercice 1 -------------------*/

    START TRANSACTION;

    SELECT nomfou FROM fournis WHERE numfou=120;

    UPDATE fournis  SET nomfou= 'GROSBRIGAND' WHERE numfou=120;

    SELECT nomfou FROM fournis WHERE numfou=120 


/* ------------Que concluez-vous ? --------------? */

/* La modification s'effectue mais elle n'est pas permanente,
nous n'avons qu'un aperçu */

/* ------------Les données sont-elles modifiables par 
d'autres utilisateurs (ouvrez une nouvelle fenêtre de requête 
pour interroger le fournisseur 120 par une instruction 
SELECT) ? --------------? */

/* Non, d'autres utilisateurs ne peuvent pas accéder 
à l'interrogation */

/* ------------ La transaction est-elle terminée ? --------------? */

/* Non , il manque l'instruction COMMIT pour que la transaction 
soit terminée*/

/* ------------ Comment rendre la modification permanente ? --------------? */

START TRANSACTION;

    SELECT nomfou FROM fournis WHERE numfou=120;

    UPDATE fournis SET nomfou= 'GROSBRIGAND' WHERE numfou=120;

    SELECT nomfou FROM fournis WHERE numfou=120;

COMMIT;

/* ------------ Comment annuler la transaction ? --------------? */
START TRANSACTION;

    SELECT nomfou FROM fournis WHERE numfou=120;

    UPDATE fournis SET nomfou= 'GROSBRIGAND' WHERE numfou=120;

    SELECT nomfou FROM fournis WHERE numfou=120;

ROLLBACK;
/*Seulement si le commit n'a pas été effectué*/