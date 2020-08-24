DROP DATABASE IF EXISTS phase2;
CREATE DATABASE phase2;
USE phase2;

CREATE TABLE Personne (

  per_num       INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  per_nom       VARCHAR(50),
  per_prenom    VARCHAR(50),
  per_adresse   VARCHAR(50),
  per_ville     VARCHAR(50)
);

CREATE TABLE Groupe (

  gro_num       INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  gro_libelle   VARCHAR(50)
);

CREATE TABLE Appartient (
  per_num       INT NOT NULL,
  gro_num       INT NOT NULL,
  PRIMARY KEY (per_num, gro_num),
  FOREIGN KEY (per_num) REFERENCES Personne(per_num),
  FOREIGN KEY (gro_num) REFERENCES Groupe(gro_num)
);

