-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 08 sep. 2020 à 14:02
-- Version du serveur :  5.7.24
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `papyrus5`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CA_Fournisseur` (IN `four` VARCHAR(50), IN `annee` INT)  BEGIN
    SELECT numfou, SUM(qtecde * priuni *1.20) AS "Chiffre d'affaire annuel"
    FROM ligcom, entcom
    WHERE entcom.numcom = ligcom.numcom
    AND four = numfou
    AND annee = YEAR(datcom)
    GROUP BY numfou;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Lst_Commandes` (IN `comm` VARCHAR(50))  BEGIN
    SELECT entcom.numcom, nomfou, libart, SUM(qtecde*priuni) AS 'Sous-Total', obscom AS "Commentaire"
    FROM entcom, fournis, ligcom, produit
    WHERE obscom LIKE comm
    AND entcom.numfou = fournis.numfou
    AND entcom.numcom = ligcom.numcom
    AND produit.codart = ligcom.codart
    GROUP BY entcom.numcom, nomfou, libart;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Lst_fournis` ()  BEGIN
    SELECT numfou, COUNT(numcom) AS 'Nombre de commandes'
    FROM entcom
    GROUP BY numfou;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `entcom`
--

CREATE TABLE `entcom` (
  `numcom` int(11) NOT NULL,
  `obscom` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `datcom` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `numfou` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `entcom`
--

INSERT INTO `entcom` (`numcom`, `obscom`, `datcom`, `numfou`) VALUES
(70010, '', '2018-04-23 13:59:51', 120),
(70011, 'Commande urgente', '2018-04-23 13:59:51', 540),
(70020, '', '2018-04-23 13:59:51', 9120),
(70025, 'Commande urgente', '2018-04-23 13:59:51', 9150),
(70210, 'Commande cadencée', '2018-04-23 13:59:51', 120),
(70250, '*****', '2020-09-03 12:27:23', 8700),
(70300, '', '2018-04-23 13:59:51', 9120),
(70620, '', '2018-04-23 13:59:51', 540),
(70625, '', '2018-04-23 13:59:51', 120),
(70629, '*****', '2020-09-03 12:27:23', 9180);

-- --------------------------------------------------------

--
-- Structure de la table `fournis`
--

CREATE TABLE `fournis` (
  `numfou` int(11) NOT NULL,
  `nomfou` varchar(25) NOT NULL,
  `ruefou` varchar(50) NOT NULL,
  `posfou` char(5) NOT NULL,
  `vilfou` varchar(30) NOT NULL,
  `confou` varchar(15) NOT NULL,
  `satisf` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fournis`
--

INSERT INTO `fournis` (`numfou`, `nomfou`, `ruefou`, `posfou`, `vilfou`, `confou`, `satisf`) VALUES
(120, 'GROSBRIGAN', '20 rue du papier', '92200', 'papercity', 'Georges', 8),
(540, 'ECLIPSE', '53 rue laisse flotter les rubans', '78250', 'Bugbugville', 'Nestor', 7),
(8700, 'MEDICIS', '120 rue des plantes', '75014', 'Paris', 'Lison', 0),
(9120, 'DISCOBOL', '11 rue des sports', '85100', 'La Roche sur Yon', 'Hercule', 8),
(9150, 'DEPANPAP', '26 avenue des locomotives', '59987', 'Coroncountry', 'Pollux', 5),
(9180, 'HURRYTAPE', '68 boulevard des octets', '4044', 'Dumpville', 'Track', 0);

-- --------------------------------------------------------

--
-- Structure de la table `ligcom`
--

CREATE TABLE `ligcom` (
  `numcom` int(11) NOT NULL,
  `numlig` tinyint(4) NOT NULL,
  `codart` char(4) NOT NULL,
  `qtecde` int(11) NOT NULL,
  `priuni` decimal(5,0) NOT NULL,
  `qteliv` int(11) DEFAULT NULL,
  `derliv` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ligcom`
--

INSERT INTO `ligcom` (`numcom`, `numlig`, `codart`, `qtecde`, `priuni`, `qteliv`, `derliv`) VALUES
(70010, 1, 'I100', 3000, '470', 3000, '2007-03-15'),
(70010, 2, 'I105', 2000, '485', 2000, '2007-07-05'),
(70010, 3, 'I108', 1000, '680', 1000, '2007-08-20'),
(70010, 4, 'D035', 200, '40', 250, '2007-02-20'),
(70010, 5, 'P220', 6000, '3500', 6000, '2007-03-31'),
(70010, 6, 'P240', 6000, '2000', 2000, '2007-03-31'),
(70011, 1, 'I105', 1000, '600', 1000, '2007-05-16'),
(70011, 2, 'P220', 10000, '3500', 10000, '2007-08-31'),
(70020, 1, 'B001', 200, '140', 0, '2007-12-31'),
(70020, 2, 'B002', 200, '140', 0, '2007-12-31'),
(70025, 1, 'I100', 1000, '590', 1000, '2007-05-15'),
(70025, 2, 'I105', 500, '590', 500, '2007-03-15'),
(70210, 1, 'I100', 1000, '470', 1000, '2007-07-15'),
(70250, 1, 'P230', 15000, '4900', 12000, '2007-12-15'),
(70250, 2, 'P220', 10000, '3350', 10000, '2007-11-10'),
(70300, 1, 'I100', 50, '790', 50, '2007-10-31'),
(70620, 1, 'I105', 200, '600', 200, '2007-11-01'),
(70625, 1, 'I100', 1000, '470', 1000, '2007-10-15'),
(70625, 2, 'P220', 10000, '3500', 10000, '2007-10-31'),
(70629, 1, 'B001', 200, '140', 0, '2007-12-31'),
(70629, 2, 'B002', 200, '140', 0, '2007-12-31');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `codart` char(4) NOT NULL,
  `libart` varchar(30) NOT NULL,
  `stkale` int(11) NOT NULL,
  `stkphy` int(11) NOT NULL,
  `qteann` int(11) NOT NULL,
  `unimes` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`codart`, `libart`, `stkale`, `stkphy`, `qteann`, `unimes`) VALUES
('B001', 'Bande magnétique 1200', 20, 87, 240, 'unite'),
('B002', 'Bande magnétique 6250', 20, 12, 410, 'unite'),
('D035', 'CD R slim 80 mm', 40, 42, 150, 'B010'),
('D050', 'CD R-W 80mm', 50, 4, 0, 'B010'),
('I100', 'Papier 1 ex continu', 100, 557, 3500, 'B1000'),
('I105', 'Papier 2 ex continu', 75, 5, 2300, 'B1000'),
('I108', 'Papier 3 ex continu', 200, 557, 3500, 'B500'),
('P220', 'Pré-imprimé commande', 500, 2500, 24500, 'B500'),
('P230', 'Pré-imprimé facture', 500, 250, 12500, 'B500'),
('P240', 'Pré-imprimé bulletin paie', 500, 3000, 6250, 'B500'),
('P250', 'Pré-imprimé bon livraison', 500, 2500, 24500, 'B500'),
('P270', 'Pré-imprimé bon fabrication', 500, 2500, 24500, 'B500'),
('R080', 'ruban Epson 850', 10, 2, 120, 'unite'),
('R132', 'ruban impl 1200 lignes', 25, 200, 182, 'unite');

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE `vente` (
  `codart` char(4) NOT NULL,
  `numfou` int(11) NOT NULL,
  `delliv` smallint(6) NOT NULL,
  `qte1` int(11) NOT NULL,
  `prix1` decimal(5,0) NOT NULL,
  `qte2` int(11) DEFAULT NULL,
  `prix2` decimal(5,0) DEFAULT NULL,
  `qte3` int(11) DEFAULT NULL,
  `prix3` decimal(5,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`codart`, `numfou`, `delliv`, `qte1`, `prix1`, `qte2`, `prix2`, `qte3`, `prix3`) VALUES
('B001', 8700, 15, 0, '150', 50, '145', 100, '140'),
('B002', 8700, 15, 0, '210', 50, '200', 100, '185'),
('D035', 120, 0, 0, '40', 0, '40', 0, '0'),
('D035', 9120, 5, 0, '40', 100, '30', 0, '0'),
('I100', 120, 90, 0, '700', 50, '600', 120, '500'),
('I100', 540, 70, 0, '710', 60, '630', 100, '600'),
('I100', 9120, 60, 0, '800', 70, '600', 90, '500'),
('I100', 9150, 90, 0, '650', 90, '600', 200, '590'),
('I100', 9180, 30, 0, '749', 50, '683', 100, '490'),
('I105', 120, 90, 10, '705', 50, '630', 120, '500'),
('I105', 540, 70, 0, '810', 60, '645', 100, '600'),
('I105', 8700, 30, 0, '720', 50, '670', 100, '510'),
('I105', 9120, 60, 0, '920', 70, '800', 90, '700'),
('I105', 9150, 90, 0, '685', 90, '600', 200, '590'),
('I108', 120, 90, 5, '795', 30, '720', 100, '680'),
('I108', 9120, 60, 0, '920', 70, '820', 100, '780'),
('P220', 120, 15, 0, '3700', 100, '3500', 0, '0'),
('P220', 8700, 20, 50, '3500', 100, '3350', 0, '0'),
('P230', 120, 30, 0, '5200', 100, '5000', 0, '0'),
('P230', 8700, 60, 0, '5000', 50, '4900', 0, '0'),
('P240', 120, 15, 0, '2200', 100, '2000', 0, '0'),
('P250', 120, 30, 0, '1500', 100, '1400', 500, '1200'),
('P250', 9120, 30, 0, '1500', 100, '1400', 500, '1200'),
('R080', 9120, 10, 0, '120', 100, '100', 0, '0'),
('R132', 9120, 5, 0, '275', 0, '275', 0, '0');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_globalcde1`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `v_globalcde1` (
`codart` char(4)
,`Qtetot` decimal(32,0)
,`Prixtot` decimal(37,0)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_ventesl100`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `v_ventesl100` (
`codart` char(4)
,`numfou` int(11)
,`delliv` smallint(6)
,`qte1` int(11)
,`prix1` decimal(5,0)
,`qte2` int(11)
,`prix2` decimal(5,0)
,`qte3` int(11)
,`prix3` decimal(5,0)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_ventesl100grobrigan`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `v_ventesl100grobrigan` (
`codart` char(4)
,`numfou` int(11)
,`delliv` smallint(6)
,`qte1` int(11)
,`prix1` decimal(5,0)
,`qte2` int(11)
,`prix2` decimal(5,0)
,`qte3` int(11)
,`prix3` decimal(5,0)
);

-- --------------------------------------------------------

--
-- Structure de la vue `v_globalcde1`
--
DROP TABLE IF EXISTS `v_globalcde1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_globalcde1`  AS  select `ligcom`.`codart` AS `codart`,sum(`ligcom`.`qtecde`) AS `Qtetot`,sum((`ligcom`.`qtecde` * `ligcom`.`priuni`)) AS `Prixtot` from `ligcom` group by `ligcom`.`codart` ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_ventesl100`
--
DROP TABLE IF EXISTS `v_ventesl100`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ventesl100`  AS  select `vente`.`codart` AS `codart`,`vente`.`numfou` AS `numfou`,`vente`.`delliv` AS `delliv`,`vente`.`qte1` AS `qte1`,`vente`.`prix1` AS `prix1`,`vente`.`qte2` AS `qte2`,`vente`.`prix2` AS `prix2`,`vente`.`qte3` AS `qte3`,`vente`.`prix3` AS `prix3` from `vente` where (`vente`.`codart` = 'I100') ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_ventesl100grobrigan`
--
DROP TABLE IF EXISTS `v_ventesl100grobrigan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ventesl100grobrigan`  AS  select `v_ventesl100`.`codart` AS `codart`,`v_ventesl100`.`numfou` AS `numfou`,`v_ventesl100`.`delliv` AS `delliv`,`v_ventesl100`.`qte1` AS `qte1`,`v_ventesl100`.`prix1` AS `prix1`,`v_ventesl100`.`qte2` AS `qte2`,`v_ventesl100`.`prix2` AS `prix2`,`v_ventesl100`.`qte3` AS `qte3`,`v_ventesl100`.`prix3` AS `prix3` from `v_ventesl100` where (`v_ventesl100`.`numfou` = 120) ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `entcom`
--
ALTER TABLE `entcom`
  ADD PRIMARY KEY (`numcom`),
  ADD KEY `numfou` (`numfou`);

--
-- Index pour la table `fournis`
--
ALTER TABLE `fournis`
  ADD PRIMARY KEY (`numfou`);

--
-- Index pour la table `ligcom`
--
ALTER TABLE `ligcom`
  ADD PRIMARY KEY (`numcom`,`numlig`),
  ADD KEY `codart` (`codart`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`codart`);

--
-- Index pour la table `vente`
--
ALTER TABLE `vente`
  ADD PRIMARY KEY (`codart`,`numfou`),
  ADD KEY `numfou` (`numfou`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `entcom`
--
ALTER TABLE `entcom`
  MODIFY `numcom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70630;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `entcom`
--
ALTER TABLE `entcom`
  ADD CONSTRAINT `entcom_ibfk_1` FOREIGN KEY (`numfou`) REFERENCES `fournis` (`numfou`);

--
-- Contraintes pour la table `ligcom`
--
ALTER TABLE `ligcom`
  ADD CONSTRAINT `ligcom_ibfk_1` FOREIGN KEY (`numcom`) REFERENCES `entcom` (`numcom`),
  ADD CONSTRAINT `ligcom_ibfk_2` FOREIGN KEY (`codart`) REFERENCES `produit` (`codart`);

--
-- Contraintes pour la table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `vente_ibfk_1` FOREIGN KEY (`numfou`) REFERENCES `fournis` (`numfou`),
  ADD CONSTRAINT `vente_ibfk_2` FOREIGN KEY (`codart`) REFERENCES `produit` (`codart`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
