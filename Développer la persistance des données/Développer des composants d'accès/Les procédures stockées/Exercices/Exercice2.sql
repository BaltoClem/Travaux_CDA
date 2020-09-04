DELIMITER |

CREATE PROCEDURE Lst_Commandes(IN comm VARCHAR(50))
BEGIN
    SELECT entcom.numcom, nomfou, libart, SUM(qtecde*priuni) AS 'Sous-Total', obscom AS "Commentaire"
    FROM entcom, fournis, ligcom, produit
    WHERE obscom LIKE comm
    AND entcom.numfou = fournis.numfou
    AND entcom.numcom = ligcom.numcom
    AND produit.codart = ligcom.codart
    GROUP BY entcom.numcom, nomfou, libart;
END |

DELIMITER ;

CALL Lst_Commandes('%cad%');

