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

SELECT CompanyName AS "Client", COUNT(orders.CustomerID) AS "Nombre de Commandes"
FROM orders, customers
WHERE orders.CustomerID = customers.CustomerID
AND Country = "France" 
GROUP BY CompanyName
HAVING COUNT(orders.CustomerID) > 10;

/* 5 - Liste des clients ayant un chiffre d’affaires > 30.000 */

SELECT CompanyName AS "Client", SUM(UnitPrice*Quantity) AS "Chiffre d'affaires", Country AS "Pays"
FROM `order details`, customers, orders
WHERE `order details`.OrderID = orders.OrderID AND orders.CustomerID = customers.CustomerID
GROUP BY CompanyName, Country
HAVING SUM(UnitPrice*Quantity) > 30000
ORDER BY SUM(UnitPrice*Quantity) DESC;

/* 6 – Liste des pays dont les clients ont passé commande de produits 
fournis par « Exotic Liquids »  */

SELECT DISTINCT customers.Country AS "Pays"
FROM suppliers, products, `order details`, orders, customers
WHERE suppliers.SupplierID = products.SupplierID
AND products.ProductID = `order details`.ProductID
AND `order details`.OrderID = orders.OrderID
AND orders.CustomerID = customers.CustomerID
AND suppliers.CompanyName = "Exotic Liquids"
ORDER BY customers.Country ASC;

/* 7 – Montant des ventes de 1997  */

SELECT SUM(UnitPrice*Quantity) AS "Montant des ventes de 1997"
FROM orders, `order details`
WHERE `order details`.OrderID = orders.OrderID
AND YEAR(orders.OrderDate) = 1997;

/* 8 – Montant des ventes de 1997 mois par mois  */

SELECT MONTH(orders.OrderDate) AS "Mois 1997", SUM(UnitPrice*Quantity) AS "Montant des ventes de 1997"
FROM orders, `order details`
WHERE `order details`.OrderID = orders.OrderID
AND YEAR(orders.OrderDate) = 1997
GROUP BY MONTH(orders.OrderDate)
ORDER BY MONTH(orders.OrderDate) ASC;

/* 9 – Depuis quelle date le client « Du monde entier » n’a plus commandé ? */

SELECT MAX(orders.OrderDate) AS "Date de dernière commande"
FROM orders, customers
WHERE orders.CustomerID = customers.CustomerID
AND CompanyName = "Du monde entier";

/* 10 – Quel est le délai moyen de livraison en jours ? */

SELECT ROUND(AVG(DATEDIFF(ShippedDate, OrderDate))) AS "Délai moyen de livraison en jours"
FROM orders;