/* ---------------- Vues sur la base papyrus -------------*/

/* A partir de la table Ligcom, afficher par code produit, 
la somme des quantités commandées et le prix total correspondant : 
on nommera la colonne correspondant à la somme des quantités 
commandées, QteTot et le prix total, PrixTot. */

CREATE VIEW v_GlobalCde1
AS
SELECT codart,SUM(qtecde) AS "Qtetot", SUM(qtecde*priuni) AS "Prixtot"
FROM ligcom
GROUP BY codart

SELECT * FROM v_GlobalCde1