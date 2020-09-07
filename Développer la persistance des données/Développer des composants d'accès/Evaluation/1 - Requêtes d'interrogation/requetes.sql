/* 1 - Liste des contacts français */

SELECT CompanyName AS "Société", ContactName AS "Contact", ContactTitle AS "Fonction", Phone AS "Téléphone"
FROM customers
WHERE Country = "France";

/* 2 - Produits vendus par le fournisseur « Exotic Liquids » */

SELECT ProductName AS "Produit", UnitPrice AS "Prix"
FROM products
JOIN suppliers
WHERE products.SupplierID = suppliers.SupplierID
AND suppliers.CompanyName = "Exotic Liquids";

/* 3 - Nombre de produits vendus par les fournisseurs Français dans l’ordre décroissant */

SELECT CompanyName AS "Fournisseur", COUNT(products.SupplierID) AS "Nombre de produits"
FROM suppliers
JOIN products
WHERE suppliers.SupplierID = products.SupplierID
AND suppliers.country = "France"
GROUP BY CompanyName
ORDER BY COUNT(products.SupplierID) DESC;

/* 4 - Liste des clients Français ayant plus de 10 commandes */