/* ------------- LES BESOINS DE MISE A JOUR ----------------- */

/* 1. Application d'une augmentation de tarif de 4% pour le prix 1, 2% pour le prix2
pour le fournisseur 9180 */

UPDATE vente
SET prix1 = prix1*1.04, prix2 = prix2 *1.02
WHERE numfou = 9180;

/* 2. Dans la table vente, mettre à jour le prix2 des articles dont le prix2 est null, en
affectant a valeur de prix */

UPDATE vente
SET prix2=prix1
WHERE prix2 = 0;

/* 3. Mettre à jour le champ obscom en positionnant '*****' pour toutes les commandes
dont le fournisseur a un indice de satisfaction <5 */

UPDATE entcom 
SET obscom = '*****'
FROM entcom
JOIN fournis
ON entcom.numfou = fournis.numfou 
WHERE satisf <5;

/* 4. Suppression du produit I110 */

DELETE FROM vente
JOIN produit
ON produit.codart = vente.codart
WHERE produit.codart = 'I110';

DELETE FROM ligcom
JOIN produit
ON produit.codart = ligcom.codart
WHERE produit.codart = 'I110';

DELETE FROM produit
WHERE produit.codart = 'I110';

/*5. Suppression des entête de commande qui n'ont aucune ligne*/

DELETE FROM entcom
JOIN ligcom
ON ligcom.numcom = entcom.numcom
WHERE entcom.numcom IN (SELECT ligcom.numcom FROM ligcom, entcom WHERE entcom.numcom <> ligcom.numcom);