LOAD DATA LOCAL INFILE 'C:\\Users\\80010-91-10\\Documents\\Travaux_CDA\\produit.csv'
INTO TABLE produit
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(CODART, LIBART, UNIMES, STKALE, STKPHY, QTEANN);

INSERT INTO fournis (NUMFOU, NOMFOU, RUEFOU, POSFOU, VILFOU, CONFOU, SATISF)
VALUES  ('120', 'GROBRIGAN', '20 rue du papier', '92200', 'Papercity', 'Georges', 08),
        ('540', 'ECLIPSE', '53 rue laisse flotter les rubans', '78250', 'Bugbugville', 'Nestor', 07),
        ('8700', 'MEDICIS', '120 rue des plantes', '75014', 'Paris', 'Lison', NULL),
        ('9120', 'DISCOBOL', '11 rue des sports', '85100', 'La Roche sur Yon', 'Hercule', 08),
        ('9150', 'DEPANPAP', '26 avenue des locomotives', '59987', 'Coroncountry', 'Pollux', 05),
        ('9180', 'HURRYTAPE ', '68 boulevard des octets', '04044', 'Dumpville', 'Track', NULL);
        
LOAD DATA LOCAL INFILE 'C:\\Users\\80010-91-10\\Documents\\Travaux_CDA\\vente.csv'
INTO TABLE vente
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(NUMFOU,CODART,DELLIV,QTE1,PRIX1,QTE2,PRIX2,QTE3,PRIX3);

INSERT INTO entcom (NUMCOM, OBSCOM, DATCOM, NUMFOU)
VALUES  (70010, NULL, '2007-02-10 00:00:00', '120'),
        (70011, 'Commande urgente', '2007-03-01 00:00:00', '540'),
        (70020, NULL, '2007-04-25 00:00:00', '540'),
        (70025, 'Commande urgente', '2007-04-30 00:00:00', '9150');

INSERT INTO ligcom (NUMLIG, QTECDE, PRIUNI, QTELIV, DERLIV, NUMCOM, CODART)
VALUES  (01, 3000, '470 €', 3000, '2007-03-15 00:00:00', 70010, 'I100'),
        (02, 2000, '485 €', 2000, '2007-07-05 00:00:00', 70010, 'I105'),
        (03, 1000, '680 €', 1000, '2007-08-20 00:00:00', 70010, 'I108'),
        (04, 200, '40 €', 250, '2007-02-20 00:00:00', 70010, 'D035');