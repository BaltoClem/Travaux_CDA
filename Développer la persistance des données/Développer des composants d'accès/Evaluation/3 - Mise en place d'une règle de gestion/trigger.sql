/* Pour tenir compte des coûts liés au transport, on vérifiera que pour chaque produit d’une commande, 
le client réside dans le même pays que le fournisseur du même produit */

SELECT orders.OrderID AS "Numéro de commande", products.ProductName AS "Nom du produit", customers.CompanyName AS "Nom du client", customers.Country AS "Pays du client", suppliers.CompanyName AS "Nom du fournisseur", suppliers.Country AS "Pays du fournisseur"
FROM products, suppliers, `order details`, orders, customers
WHERE suppliers.SupplierID = products.SupplierID
AND products.ProductID = `order details`.ProductID
AND `order details`.OrderID = orders.OrderID
AND orders.CustomerID = customers.CustomerID
AND suppliers.Country = customers.Country;

DELIMITER //

CREATE TRIGGER new_commande AFTER INSERT ON `order details`
FOR EACH ROW
BEGIN
    DECLARE sup_country VARCHAR(15);
    DECLARE cust_country VARCHAR(15);
    DECLARE num_order INT;
    SET num_order = NEW.OrderID;
    SET sup_country = ( SELECT Country 
                        FROM suppliers, products, `order details` 
                        WHERE suppliers.SupplierID = products.SupplierID
                        AND products.ProductID = `order details`.ProductID
                        AND `order details`.OrderID = num_order);
    SET cust_country = (SELECT Country 
                        FROM customers, orders, `order details`
                        WHERE customers.CustomerID = orders.CustomerID
                        AND orders.OrderID = `order details`.OrderID
                        AND`order details`.OrderID = num_order);  
                                          
        IF sup_country != cust_country THEN
        SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Commande impossible ! Pays différents !';
        END IF;
END;

//

DELIMITER ;