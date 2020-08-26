DROP DATABASE IF EXISTS hotelLMD;
CREATE DATABASE hotelLMD;
USE hotelLMD;

CREATE TABLE Station (

    stat_id       INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    stat_nom      VARCHAR(255)
  
);

CREATE TABLE Hotel (

    hotel_id        INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    hotel_nom       VARCHAR(255),
    hotel_capa      INT,
    hotel_categ     VARCHAR(255),
    hotel_adresse   VARCHAR(255),
    stat_id         INT NOT NULL,
    FOREIGN KEY (stat_id) REFERENCES Station(stat_id)
);

CREATE TABLE Chambre (

    chamb_id            INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    chamb_capa          VARCHAR(255),
    chamb_deg_conf      VARCHAR(255),
    chamb_expo          VARCHAR(255),
    chamb_type          VARCHAR(255),
    hotel_id            INT NOT NULL,
    FOREIGN KEY (hotel_id) REFERENCES Hotel(hotel_id)
);

CREATE TABLE Client (

    cli_id              INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cli_nom             VARCHAR(255),
    cli_prenom          VARCHAR(255),
    cli_adresse         VARCHAR(255)      

);

CREATE TABLE Reservation (

    reserv_date_debut           DATE,
    reserv_date_fin             DATE,
    reserv_date                 DATE,
    reserv_montant_arr          INT,
    reserv_prix_total           INT,
    chamb_id                    INT NOT NULL,
    cli_id                      INT NOT NULL,
    PRIMARY KEY (chamb_id,cli_id),
    FOREIGN KEY (chamb_id) REFERENCES Chambre(chamb_id),
    FOREIGN KEY (cli_id) REFERENCES Client(cli_id)

);

INSERT INTO station (stat_nom)
VALUES ('Saint-Jean-De-Maurienne'), ('Avoriaz'), ('Chamonix')

INSERT INTO hotel (hotel_nom, hotel_capa, hotel_categ, hotel_adresse, stat_id)
VALUES  ('Hotel1', 1, '1 étoile', 'Adresse1', 1), 
        ('Hotel2', 1, '1 étoile', 'Adresse2', 1), 
        ('Hotel3', 1, '1 étoile', 'Adresse3', 1),
        ('Hotel4', 1, '2 étoiles', 'Adresse4', 2),
        ('Hotel5', 1, '2 étoiles', 'Adresse5', 2),
        ('Hotel6', 1, '2 étoiles', 'Adresse6', 2),
        ('Hotel7', 1, '3 étoiles', 'Adresse7', 3),
        ('Hotel8', 1, '3 étoiles', 'Adresse8', 3),
        ('Hotel9', 1, '3 étoiles', 'Adresse9', 3)

INSERT INTO chambre (chamb_capa, chamb_deg_conf, chamb_expo, chamb_type, hotel_id)
VALUES  ('1 lit', '1 étoile', 'Nord', 'Simple', 1),
        ('2 lits', '1 étoile', 'Sud', 'Double', 1),
        ('3 lits', '1 étoile', 'Ouest', 'Triple', 1),
        ('1 lit', '2 étoiles', 'Est', 'Simple', 2),
        ('2 lits', '2 étoiles', 'Nord-Est', 'Double', 2),
        ('3 lits', '2 étoiles', 'Nord-Ouest', 'Triple', 2),
        ('1 lit', '3 étoiles', 'Sud-Est', 'Simple', 3),
        ('2 lits', '3 étoiles', 'Sud-Ouest', 'Double', 3),
        ('3 lits', '3 étoiles', 'Nord', 'Triple', 3),
        ('1 lit', '4 étoiles', 'Sud', 'Simple', 4),
        ('2 lits', '4 étoiles', 'Est', 'Double', 4),
        ('3 lits', '4 étoiles', 'Ouest', 'Triple', 4),
        ('1 lit', '5 étoiles', 'Nord-Est', 'Simple', 5),
        ('2 lits', '5 étoiles', 'Nord-Ouest', 'Double', 5),
        ('3 lits', '5 étoiles', 'Sud-Est', 'Triple', 5),
        ('1 lit', '1 étoile', 'Sud-Ouest', 'Simple', 6),
        ('2 lits', '1 étoile', 'Sud-Est', 'Double', 6),
        ('3 lits', '1 étoile', 'Nord', 'Triple', 6),
        ('1 lit', '2 étoiles', 'Sud', 'Simple', 7),
        ('2 lits', '2 étoiles', 'Est', 'Double', 7),
        ('3 lits', '2 étoiles', 'Ouest', 'Triple', 7),
        ('1 lit', '3 étoiles', 'Nord-Est', 'Simple', 8),
        ('2 lits', '3 étoiles', 'Nord-Ouest', 'Double', 8),
        ('3 lits', '3 étoiles', 'Sud-Est', 'Triple', 8),
        ('1 lit', '4 étoiles', 'Sud-Ouest', 'Simple', 9),
        ('2 lits', '4 étoiles', 'Nord', 'Double', 9),
        ('3 lits', '4 étoiles', 'Sud', 'Triple', 9)
