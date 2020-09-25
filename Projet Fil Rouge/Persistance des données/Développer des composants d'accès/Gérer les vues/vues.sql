/* Vue correspondat à la jointure Produits-Fournisseurs */

CREATE VIEW v_ProFour
AS
SELECT *
FROM produit, envoie, fournisseur
WHERE pro_id = env_pro_id
AND env_four_id = four_id

SELECT * FROM v_ProFour

/* Vue correspondat à la jointure Produits-Rubrique/Sous-rubrique */

CREATE VIEW v_ProRub
AS
SELECT *
FROM produit, sous_rubrique, rubrique
WHERE pro_s_rub_id = s_rub_id 
AND s_rub_rub_id = rub_id

SELECT * FROM v_ProRub