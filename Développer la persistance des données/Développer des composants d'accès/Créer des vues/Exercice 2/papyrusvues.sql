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

/* Afficher les ventes dont le code produit est le I100 (affichage de toutes les colonnes de la table Vente). */

CREATE VIEW v_Ventesl100
AS
SELECT * 
FROM vente
WHERE codart = 'I100'

SELECT * FROM v_Ventesl100

/* A partir de la vue précédente, créez v_VentesI100Grobrigan remontant toutes les ventes concernant le produit I100 et le fournisseur 00120. */

CREATE VIEW v_Ventesl100Grobrigan
AS
SELECT * 
FROM v_Ventesl100
WHERE numfou = 120

SELECT * FROM v_Ventesl100Grobrigan