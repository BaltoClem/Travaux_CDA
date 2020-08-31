DROP DATABASE IF EXISTS village_green;
CREATE DATABASE village_green;
USE village_green;

CREATE TABLE fournisseur(
   four_id INT NOT NULL,
   four_nom VARCHAR(50),
   four_type VARCHAR(50),
   PRIMARY KEY(four_id)
);

CREATE TABLE rubrique(
   rub_id INT NOT NULL,
   rub_nom VARCHAR(50),
   PRIMARY KEY(rub_id)
);

CREATE TABLE commande(
   cmd_id INT NOT NULL,
   cmd_date DATE,
   cmd_reduc DECIMAL(5,2),
   cmd_fact_id INT NOT NULL,
   cmd_fact_date DATE,
   cmd_cli_adresse_fact VARCHAR(50),
   cmd_cli_cp_fact CHAR(5),
   cmd_cli_ville_fact VARCHAR(50),
   cmd_cli_adresse_liv VARCHAR(50),
   cmd_cli_cp_liv CHAR(5),
   cmd_cli_ville_liv VARCHAR(50),
   cmd_cli_coeff DECIMAL(5,2),
   PRIMARY KEY(cmd_id)
);

CREATE TABLE livraison(
   liv_id INT NOT NULL,
   liv_date DATE,
   liv_cmd_id INT NOT NULL,
   PRIMARY KEY(liv_id),
   FOREIGN KEY(liv_cmd_id) REFERENCES Commande(cmd_id)
);

CREATE TABLE commercial(
   com_id INT NOT NULL,
   com_nom VARCHAR(50),
   com_prenom VARCHAR(50),
   PRIMARY KEY(com_id)
);

CREATE TABLE sous_rubrique(
   s_rub_id INT NOT NULL,
   s_rub_nom VARCHAR(50),
   s_rub_rub_id INT NOT NULL,
   PRIMARY KEY(s_rub_id),
   FOREIGN KEY(s_rub_rub_id) REFERENCES Rubrique(rub_id)
);

CREATE TABLE produit(
   pro_id INT NOT NULL,
   pro_lib VARCHAR(50),
   pro_descr VARCHAR(250),
   pro_prix_achat DECIMAL(5,2),
   pro_photo VARCHAR(250),
   pro_stock INT,
   pro_actif BOOLEAN,
   pro_s_rub_id INT NOT NULL,
   PRIMARY KEY(pro_id),
   FOREIGN KEY(pro_s_rub_id) REFERENCES Sous_Rubrique(s_rub_id)
);

CREATE TABLE client(
   cli_id INT NOT NULL,
   cli_nom VARCHAR(50),
   cli_prenom VARCHAR(50),
   cli_adresse VARCHAR(250),
   cli_cp CHAR(5),
   cli_ville VARCHAR(50),
   cli_regl VARCHAR(50),
   cli_categ VARCHAR(50),
   cli_coeff DECIMAL(5,2),
   cli_com_id INT NOT NULL,
   PRIMARY KEY(cli_id),
   FOREIGN KEY(cli_com_id) REFERENCES Commercial(com_id)
);

CREATE TABLE envoie(
   env_four_id INT NOT NULL,
   env_pro_id INT NOT NULL,
   PRIMARY KEY(env_four_id, env_pro_id),
   FOREIGN KEY(env_four_id) REFERENCES Fournisseur(four_id),
   FOREIGN KEY(env_pro_id) REFERENCES Produit(pro_id)
);

CREATE TABLE se_compose_de(
   se_compose_pro_id INT NOT NULL,
   se_compose_cmd_id INT NOT NULL,
   se_compose_cmd_nb_produits INT,
   se_compose_pro_prix_vente DECIMAL(5,2),
   se_compose_cmd_prix_tot DECIMAL(5,2),
   PRIMARY KEY(se_compose_pro_id, se_compose_cmd_id),
   FOREIGN KEY(se_compose_pro_id) REFERENCES Produit(pro_id),
   FOREIGN KEY(se_compose_cmd_id) REFERENCES Commande(cmd_id)
);

CREATE TABLE contient(
   contient_pro_id INT NOT NULL,
   contient_liv_id INT NOT NULL,
   contient_liv_qte INT,
   PRIMARY KEY(contient_pro_id, contient_liv_id),
   FOREIGN KEY(contient_pro_id) REFERENCES Produit(pro_id),
   FOREIGN KEY(contient_liv_id) REFERENCES Livraison(liv_id)
);

CREATE TABLE passe(
   passe_cmd_id INT NOT NULL,
   passe_cli_id INT NOT NULL,
   PRIMARY KEY(passe_cmd_id, passe_cli_id),
   FOREIGN KEY(passe_cmd_id) REFERENCES Commande(cmd_id),
   FOREIGN KEY(passe_cli_id) REFERENCES Client(cli_id)
);