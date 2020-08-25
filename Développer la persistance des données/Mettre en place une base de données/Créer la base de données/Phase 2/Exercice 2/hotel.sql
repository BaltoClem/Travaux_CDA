DROP DATABASE IF EXISTS hotel;
CREATE DATABASE hotel;
USE hotel;

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