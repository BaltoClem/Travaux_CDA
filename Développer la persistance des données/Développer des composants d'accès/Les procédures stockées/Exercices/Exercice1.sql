DELIMITER |

CREATE PROCEDURE Lst_fournis()
BEGIN
    SELECT numfou, COUNT(numcom) AS 'Nombre de commandes'
    FROM entcom
    GROUP BY numfou;
END |

DELIMITER ;

CALL Lst_fournis();

SHOW CREATE PROCEDURE Lst_fournis;
