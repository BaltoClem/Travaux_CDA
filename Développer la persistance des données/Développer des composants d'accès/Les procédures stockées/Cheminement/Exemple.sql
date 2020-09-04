/* ------- MySql : Les procédures stockées, bien débuter --------*/

/* Création d'une procédure stockée avec un SELECT simple */

/* On modifie le délimiteur initial ; en le remplacant par | */
DELIMITER |

CREATE PROCEDURE listeClient()
BEGIN
    SELECT cli_id, cli_nom, cli_prenom, cli_ville FROM client;
END |

/* On rétablit le délimiteur initial */
DELIMITER ;

CALL listeClient;

/* Paramètres */

DELIMITER |

CREATE PROCEDURE listeClientParVille(In ville Varchar(50))

BEGIN
   SELECT cli_id, cli_nom, cli_prenom, cli_ville 
   FROM client
   WHERE cli_ville = ville;
END |

DELIMITER ;

CALL listeClientParVille('Londre');

/* Procédure stockée avec plusieurs paramètres */

DELIMITER |

CREATE PROCEDURE ajoutClient(
    In nom varchar (50), 
    In prenom varchar (50), 
    In ville varchar (50)
)

BEGIN
   INSERT INTO client (cli_nom, cli_prenom, cli_ville) VALUES (nom, prenom, ville);
END |

DELIMITER ;

CALL ajoutClient('Jessica', 'Pikatchien', 'Dunkerque');