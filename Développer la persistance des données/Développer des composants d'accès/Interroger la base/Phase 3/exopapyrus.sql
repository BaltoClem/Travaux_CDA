/* --------- LES BESOINS D’AFFICHAGE -----------------*/

/* 1 - Quelles sont les commandes du fournisseur 09120 ? */

SELECT numcom AS "Numéro de commande"
FROM entcom
WHERE numfou = 9120;

/* 2 - Afficher le code des fournisseurs pour lesquels des 
commandes ont été passées.*/

SELECT numfou, COUNT(numcom) as 'nombre de commande'
FROM entcom
GROUP BY numfou;

/* 3 - Afficher le nombre de commandes fournisseurs passées, et le nombre de
fournisseur concernés */

SELECT COUNT(numcom) AS 'Nombre de commandes', COUNT (DISTINCT numfou) AS 'Nombre de fournisseurs'
FROM entcom;

/* 4 - . Editer les produits ayant un stock inférieur ou égal au stock d'alerte et dont la
quantité annuelle est inférieur est inférieure à 1000
(informations à fournir : n° produit, libellé produit, stock, stock actuel d'alerte,
quantité annuelle)
 */

SELECT codart, libart, stkphy, stkale, qteann
FROM produit
WHERE stkphy <= stkale AND qteann < 1000;

/* 5. Quels sont les fournisseurs situés dans les départements 75 78 92 77 ?
L’affichage (département, nom fournisseur) sera effectué par département
décroissant, puis par ordre alphabétique */

SELECT nomfou, SUBSTRING(posfou, 1,2) AS 'Départements'
FROM fournis
WHERE posfou LIKE '75%' 
OR posfou LIKE '78%' 
OR posfou LIKE '92%'
OR posfou LIKe '77%'
ORDER BY posfou DESC, nomfou;

/* 6. Quelles sont les commandes passées au mois de mars et avril ? */

SELECT numcom,datcom
FROM entcom
WHERE MONTH(datcom) = 3 OR MONTH(datcom) = 4;

/* 7. Quelles sont les commandes du jour qui ont des observations particulières ?
(Affichage numéro de commande, date de commande) */

SELECT numcom, datcom
FROM entcom
WHERE obscom IS NOT NULL 
AND DATE(datcom) = DATE(NOW());

/* 8. Lister le total de chaque commande par total décroissant
(Affichage numéro de commande et total) */

SELECT numcom, SUM(qtecde*priuni) AS 'Total'
FROM ligcom
GROUP BY numcom
ORDER BY Total DESC;

/* 9. Lister les commandes dont le total est supérieur à 10 000€ ; on exclura dans le
calcul du total les articles commandés en quantité supérieure ou égale à 1000.
(Affichage numéro de commande et total) */

SELECT numcom, SUM(qtecde*priuni) AS 'Total'
FROM ligcom
WHERE qtecde < 1000
GROUP BY numcom
HAVING SUM(qtecde*priuni)>10000;

/* 10.Lister les commandes par nom fournisseur
(Afficher le nom du fournisseur, le numéro de commande et la date) */

SELECT nomfou AS "Nom de fournisseur", numcom AS "Numéro de commande", datcom AS "Date de commande"
FROM fournis, entcom
WHERE entcom.numfou = fournis.numfou;

/* 11.Sortir les produits des commandes ayant le mot "urgent' en observation
(Afficher le numéro de commande, le nom du fournisseur, le libellé du produit et
le sous total = quantité commandée * Prix unitaire) */

SELECT entcom.numcom, nomfou, libart, SUM(qtecde*priuni) AS 'Sous-Total'
FROM entcom, fournis, ligcom, produit
WHERE obscom LIKE "%urgent%"
AND entcom.numfou = fournis.numfou
AND entcom.numcom = ligcom.numcom
AND produit.codart = ligcom.codart
GROUP BY entcom.numcom, nomfou, libart;

/* 12.Coder de 2 manières différentes la requête suivante :
Lister le nom des fournisseurs susceptibles de livrer au moins un article */

SELECT DISTINCT nomfou
FROM entcom, fournis, ligcom
WHERE entcom.numfou = fournis.numfou 
AND entcom.numcom = ligcom.numcom
AND qteliv >= 1;

/* 13 Coder de 2 manières différentes la requête suivante
Lister les commandes (Numéro et date) dont le fournisseur est celui de la
commande 70210 */

SELECT numcom, datcom 
FROM entcom
WHERE numfou = (SELECT numfou FROM entcom WHERE numcom = 70210);

/* 14.Dans les articles susceptibles d’être vendus, lister les articles moins chers (basés
sur Prix1) que le moins cher des rubans (article dont le premier caractère
commence par R). On affichera le libellé de l’article et prix1 */

SELECT libart,prix1
FROM vente, produit
WHERE produit.codart = vente.codart and stkphy > 0 and prix1 < (SELECT min(prix1) FROM vente,produit WHERE produit.codart = vente.codart and libart  LIKE 'R%' )
GROUP BY libart,prix1;

/* 15.Editer la liste des fournisseurs susceptibles de livrer les produits dont le stock est
inférieur ou égal à 150 % du stock d'alerte. La liste est triée par produit puis
fournisseur */

SELECT libart, fournis.numfou
FROM produit, fournis, vente
WHERE fournis.numfou = vente.numfou
AND vente.codart = produit.codart
AND stkphy <= (SELECT SUM(stkale*1.5) FROM produit WHERE stkale > 0 AND stkphy > 0)
ORDER BY libart, fournis.numfou;

/* 16.Éditer la liste des fournisseurs susceptibles de livrer les produit dont le stock est
inférieur ou égal à 150 % du stock d'alerte et un délai de livraison d'au plus 30
jours. La liste est triée par fournisseur puis produit */

SELECT libart, fournis.numfou
FROM produit, fournis, vente
WHERE fournis.numfou = vente.numfou
AND vente.codart = produit.codart
AND stkphy <= (SELECT SUM(stkale*1.5) FROM produit WHERE stkale > 0 AND stkphy > 0 AND delliv < 30)
ORDER BY libart, fournis.numfou;

/* 17.Avec le même type de sélection que ci-dessus, sortir un total des stocks par
fournisseur trié par total décroissant */

SELECT numfou, SUM(stkphy) AS "Stock"
FROM vente,produit
WHERE vente.codart = produit.codart
GROUP BY numfou
ORDER BY stock DESC;

/* 18.En fin d'année, sortir la liste des produits dont la quantité réellement commandée
dépasse 90% de la quantité annuelle prévue. */

SELECT libart, SUM(qtecde) AS "Quantite"
FROM produit, ligcom
WHERE produit.codart = ligcom.codart
GROUP BY libart, qteann
HAVING (qteann * 0.90) < SUM(qtecde);

/* 19.Calculer le chiffre d'affaire par fournisseur pour l'année 93 sachant que les prix
indiqués sont hors taxes et que le taux de TVA est 20%.*/

SELECT numfou, SUM(qtecde * priuni *1.20) AS "Prix TTC"
FROM ligcom, entcom
WHERE entcom.numcom = ligcom.numcom
GROUP BY numfou