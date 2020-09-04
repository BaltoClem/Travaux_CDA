DELIMITER |

CREATE PROCEDURE CA_Fournisseur(IN four VARCHAR(50), IN annee INT)
BEGIN
    SELECT numfou, SUM(qtecde * priuni *1.20) AS "Chiffre d'affaire annuel"
    FROM ligcom, entcom
    WHERE entcom.numcom = ligcom.numcom
    AND four = numfou
    AND annee = YEAR(datcom)
    GROUP BY numfou;
END |

DELIMITER ;

CALL CA_Fournisseur('120', 2018);