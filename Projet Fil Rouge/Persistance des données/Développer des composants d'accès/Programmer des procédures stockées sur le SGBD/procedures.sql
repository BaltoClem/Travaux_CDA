/* Sélectionne les commandes non soldées (en cours de livraison) */

DELIMITER |

CREATE PROCEDURE coursLivr(IN livr VARCHAR(250))

BEGIN
    SELECT liv_id, liv_date, liv_cmd_id, liv_etat AS "Commande(s) en cours de livraison"
    FROM livraison
    WHERE liv_etat = livr;

END |

DELIMITER ;

CALL coursLivr('En cours de livraison');

/* Renvoie le délai moyen entre la date de commande et la date de facturation */

DELIMITER |

CREATE PROCEDURE delaiMoy (IN commande INT)

BEGIN
   SELECT ROUND(AVG(DATEDIFF(cmd_fact_date, cmd_date))) AS "Délai moyen de livraison en jours"
    FROM commande
    WHERE cmd_id = commande;
END |

DELIMITER ;

CALL delaiMoy(1);