/* Codez deux procédures stockées correspondant aux requêtes 9 et 10. Les procédures stockées doivent prendre en compte les éventuels paramètres. */

/* 1 */

DELIMITER |

CREATE PROCEDURE lastDate(IN nom_ent VARCHAR(40))

BEGIN
   SELECT MAX(orders.OrderDate) AS "Date de dernière commande"
    FROM orders, customers
    WHERE orders.CustomerID = customers.CustomerID
    AND CompanyName = nom_ent;
END |

DELIMITER ;

CALL lastDate('Du monde entier');

/* 2 */

DELIMITER |

CREATE PROCEDURE delaiMoy (IN comm INT)

BEGIN
   SELECT ROUND(AVG(DATEDIFF(ShippedDate, OrderDate))) AS "Délai moyen de livraison en jours"
    FROM orders
    WHERE OrderID = comm;
END |

DELIMITER ;

CALL delaiMoy(10248);
