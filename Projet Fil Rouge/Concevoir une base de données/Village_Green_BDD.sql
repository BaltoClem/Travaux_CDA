DROP DATABASE IF EXISTS village_green;
CREATE DATABASE village_green;
USE village_green;

CREATE TABLE Fournisseur(
   four_id INT,
   four_nom VARCHAR(50),
   four_type VARCHAR(50),
   PRIMARY KEY(four_id)
);

CREATE TABLE Rubrique(
   rub_id INT,
   rub_nom VARCHAR(50),
   PRIMARY KEY(rub_id)
);

CREATE TABLE Commande(
   cmd_id INT,
   cmd_date DATE,
   cmd_reduc DECIMAL(5,2),
   fact_id INT,
   fact_date DATE,
   cli_adresse_fact VARCHAR(50),
   cli_cp_fact CHAR(5),
   cli_ville_fact VARCHAR(50),
   cli_adresse_liv VARCHAR(50),
   cli_cp_liv CHAR(5),
   cli_ville_liv VARCHAR(50),
   cli_coeff DECIMAL(5,2),
   PRIMARY KEY(cmd_id)
);

CREATE TABLE Livraison(
   liv_id INT,
   liv_date DATE,
   cmd_id INT NOT NULL,
   PRIMARY KEY(liv_id),
   FOREIGN KEY(cmd_id) REFERENCES Commande(cmd_id)
);

CREATE TABLE Commercial(
   com_id INT,
   com_nom VARCHAR(50),
   com_prenom VARCHAR(50),
   PRIMARY KEY(com_id)
);

CREATE TABLE Sous_Rubrique(
   s_rub_id INT,
   s_rub_nom VARCHAR(50),
   rub_id INT NOT NULL,
   PRIMARY KEY(s_rub_id),
   FOREIGN KEY(rub_id) REFERENCES Rubrique(rub_id)
);

CREATE TABLE Produit(
   pro_id INT,
   pro_lib VARCHAR(50),
   pro_descr VARCHAR(250),
   pro_prix_achat DECIMAL(5,2),
   pro_photo VARCHAR(250),
   pro_stock INT,
   pro_actif BOOLEAN,
   s_rub_id INT NOT NULL,
   PRIMARY KEY(pro_id),
   FOREIGN KEY(s_rub_id) REFERENCES Sous_Rubrique(s_rub_id)
);

CREATE TABLE Client(
   cli_id INT,
   cli_nom VARCHAR(50),
   cli_prenom VARCHAR(50),
   cli_adresse VARCHAR(250),
   cli_cp CHAR(5),
   cli_ville VARCHAR(50),
   cli_regl VARCHAR(50),
   cli_categ VARCHAR(50),
   cli_coeff DECIMAL(5,2),
   com_id INT NOT NULL,
   PRIMARY KEY(cli_id),
   FOREIGN KEY(com_id) REFERENCES Commercial(com_id)
);

CREATE TABLE Envoie(
   four_id INT,
   pro_id INT,
   PRIMARY KEY(four_id, pro_id),
   FOREIGN KEY(four_id) REFERENCES Fournisseur(four_id),
   FOREIGN KEY(pro_id) REFERENCES Produit(pro_id)
);

CREATE TABLE SeComposeDe(
   pro_id INT,
   cmd_id INT,
   cmd_nb_produits INT,
   pro_prix_vente DECIMAL(5,2),
   cmd_prix_tot DECIMAL(5,2),
   PRIMARY KEY(pro_id, cmd_id),
   FOREIGN KEY(pro_id) REFERENCES Produit(pro_id),
   FOREIGN KEY(cmd_id) REFERENCES Commande(cmd_id)
);

CREATE TABLE Contient(
   pro_id INT,
   liv_id INT,
   qte_livr INT,
   PRIMARY KEY(pro_id, liv_id),
   FOREIGN KEY(pro_id) REFERENCES Produit(pro_id),
   FOREIGN KEY(liv_id) REFERENCES Livraison(liv_id)
);

CREATE TABLE Passe(
   cmd_id INT,
   cli_id INT,
   PRIMARY KEY(cmd_id, cli_id),
   FOREIGN KEY(cmd_id) REFERENCES Commande(cmd_id),
   FOREIGN KEY(cli_id) REFERENCES Client(cli_id)
);