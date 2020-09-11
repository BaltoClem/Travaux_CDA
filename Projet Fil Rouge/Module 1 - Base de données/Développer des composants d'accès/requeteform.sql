/*-------- Formaliser des requêtes à l'aide du langage SQL -----------------*/


/* 1 - Pour chacune des interrogations demandées pour la réalisation 
du tableau de bord (voir cahier des charges), 
créez un script contenant la ou les requêtes nécessaires. */

/*Chiffre d'affaires mois par mois pour une année sélectionnée*/

SELECT MONTH(cmd_date) AS "Mois 2020", SUM(se_compose_cmd_prix_tot) AS "Chiffre d'affaires du mois"
FROM se_compose_de, commande
WHERE commande.cmd_id = se_compose_de.se_compose_cmd_id
AND YEAR(cmd_date) = "2020"
GROUP BY MONTH(cmd_date)
ORDER BY MONTH(cmd_date) ASC;

/*Chiffre d'affaires généré pour un fournisseur*/

SELECT four_nom AS "Nom du fournisseur", SUM(produit.pro_prix_achat*envoie.env_qte) AS "Chiffre d'affaires"
FROM fournisseur, envoie, produit
WHERE fournisseur.four_id = envoie.env_four_id
AND produit.pro_id = envoie.env_pro_id
GROUP BY four_nom
ORDER BY SUM(produit.pro_prix_achat*envoie.env_qte) ASC;

/*TOP 10 des produits les plus commandés pour une année sélectionnée (référence et nom du produit, quantité commandée, fournisseur)*/

SELECT  YEAR(commande.cmd_date) AS "Année", 
        four_nom AS "Fournisseur",
        se_compose_pro_id AS "Référence", 
        pro_lib AS "Produit",
        SUM(se_compose_cmd_nb_produits) AS "Quantité"
FROM produit, se_compose_de, commande, envoie, fournisseur
WHERE produit.pro_id = se_compose_de.se_compose_pro_id
AND produit.pro_id = envoie.env_pro_id
AND envoie.env_four_id = fournisseur.four_id
AND commande.cmd_id = se_compose_de.se_compose_cmd_id
AND YEAR(commande.cmd_date) = "2020"
GROUP BY four_nom, se_compose_pro_id, YEAR(commande.cmd_date)
ORDER BY SUM(se_compose_cmd_nb_produits) DESC
LIMIT 10;

/*TOP 10 des produits les plus rémunérateurs pour une année sélectionnée (référence et nom du produit, marge, fournisseur)*/

SELECT  YEAR(commande.cmd_date) AS "Année",
        pro_id AS "Référence",
        pro_lib AS "Nom du produit",
        se_compose_pro_prix_vente - pro_prix_achat AS "Marge",
        four_nom AS "Fournisseur"
FROM produit, se_compose_de, fournisseur, envoie, commande
WHERE fournisseur.four_id = envoie.env_four_id
AND envoie.env_pro_id = produit.pro_id
AND produit.pro_id = se_compose_de.se_compose_pro_id
AND commande.cmd_id = se_compose_de.se_compose_cmd_id
AND YEAR(commande.cmd_date) = "2020"
GROUP BY pro_id, pro_lib, four_nom, YEAR(commande.cmd_date), se_compose_pro_prix_vente - pro_prix_achat
ORDER BY se_compose_pro_prix_vente - pro_prix_achat DESC
LIMIT 10;

/*Top 10 des clients en nombre de commandes ou chiffre d'affaires*/

/* Top 10 des clients en nombre de commandes */

SELECT client.cli_nom AS "Nom du client", COUNT(passe.passe_cli_id) AS "Nombre de commandes"
FROM client, passe
WHERE client.cli_id = passe_cli_id
GROUP BY client.cli_nom
ORDER BY COUNT(passe.passe_cli_id) DESC
LIMIT 10;

/* Top 10 des clients en chiffre d'affaires */

SELECT client.cli_nom AS "Nom du client", SUM(se_compose_cmd_prix_tot) AS "Chiffre d'affaires"
FROM client, passe, commande, se_compose_de
WHERE client.cli_id = passe_cli_id
AND passe.passe_cmd_id = commande.cmd_id
AND commande.cmd_id = se_compose_de.se_compose_cmd_id
GROUP BY client.cli_nom
ORDER BY SUM(se_compose_cmd_prix_tot) DESC
LIMIT 10;

/* Top 10 réunis */

SELECT client.cli_nom AS "Nom du client", SUM(se_compose_cmd_prix_tot) AS "Chiffre d'affaires",COUNT(passe.passe_cli_id) AS "Nombre de commandes"
FROM client, passe,commande, se_compose_de
WHERE client.cli_id = passe_cli_id
AND passe.passe_cmd_id = commande.cmd_id
AND commande.cmd_id = se_compose_de.se_compose_cmd_id
GROUP BY client.cli_nom
ORDER BY COUNT(passe.passe_cli_id) DESC
LIMIT 10;

/*Répartition du chiffre d'affaires par type de client*/

SELECT DISTINCT client.cli_categ AS "Type de client", SUM(se_compose_cmd_prix_tot) AS "Chiffre d'affaires"
FROM client, passe, commande, se_compose_de
WHERE client.cli_id = passe_cli_id
AND passe.passe_cmd_id = commande.cmd_id
AND commande.cmd_id = se_compose_de.se_compose_cmd_id
GROUP BY client.cli_categ;

/* Nombre de commandes en cours de livraison. */

SELECT COUNT(liv_etat) AS "Nombre de commandes en cours de livraison"
FROM livraison
WHERE liv_etat = "En cours de livraison";

/* 2 - Exportez les tables principales (entité) 
vers des tableaux d’un tableur de votre choix. */