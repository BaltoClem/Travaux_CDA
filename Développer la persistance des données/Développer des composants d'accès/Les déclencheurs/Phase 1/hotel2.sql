-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 07 sep. 2020 à 11:13
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
-- Base de données : `hotel2`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ajoutClient` (IN `nom` VARCHAR(50), IN `prenom` VARCHAR(50), IN `ville` VARCHAR(50))  BEGIN
   INSERT INTO client (cli_nom, cli_prenom, cli_ville) VALUES (nom, prenom, ville);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listeClient` ()  BEGIN
    SELECT cli_id, cli_nom, cli_prenom, cli_ville FROM client;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listeClientParVille` (IN `ville` VARCHAR(50))  BEGIN
   SELECT cli_id, cli_nom, cli_prenom, cli_ville 
   FROM client
   WHERE cli_ville = ville;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `cha_id` int(11) NOT NULL,
  `cha_hot_id` int(11) NOT NULL,
  `cha_numero` int(11) NOT NULL,
  `cha_capacite` int(11) NOT NULL,
  `cha_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`cha_id`, `cha_hot_id`, `cha_numero`, `cha_capacite`, `cha_type`) VALUES
(1, 1, 1, 2, 1),
(2, 1, 2, 3, 1),
(3, 1, 3, 2, 1),
(4, 1, 101, 1, 1),
(5, 1, 102, 2, 1),
(6, 1, 103, 3, 1),
(7, 1, 201, 2, 1),
(8, 1, 202, 7, 1),
(9, 1, 203, 1, 1),
(10, 2, 1, 2, 1),
(11, 2, 2, 2, 1),
(12, 2, 3, 1, 1),
(13, 2, 101, 2, 1),
(14, 2, 102, 1, 1),
(15, 2, 103, 3, 1),
(16, 2, 201, 2, 1),
(17, 2, 202, 4, 1),
(18, 2, 203, 4, 1),
(19, 3, 1, 3, 1),
(20, 3, 2, 1, 1),
(21, 3, 3, 2, 1),
(22, 3, 101, 2, 1),
(23, 3, 102, 2, 1),
(24, 3, 103, 2, 1),
(25, 3, 201, 2, 1),
(26, 3, 202, 4, 1),
(27, 3, 203, 4, 1),
(28, 4, 1, 4, 1),
(29, 4, 2, 2, 1),
(30, 4, 3, 4, 1),
(31, 4, 101, 1, 1),
(32, 4, 102, 2, 1),
(33, 4, 103, 2, 1),
(34, 4, 201, 2, 1),
(35, 4, 202, 2, 1),
(36, 4, 203, 3, 1),
(37, 5, 1, 3, 1),
(38, 5, 2, 2, 1),
(39, 5, 3, 2, 1),
(40, 5, 101, 1, 1),
(41, 5, 102, 4, 1),
(42, 5, 103, 1, 1),
(43, 5, 201, 2, 1),
(44, 5, 202, 4, 1),
(45, 5, 203, 4, 1),
(46, 6, 1, 1, 1),
(47, 6, 2, 1, 1),
(48, 6, 3, 1, 1),
(49, 6, 101, 1, 1),
(50, 6, 102, 1, 1),
(51, 6, 103, 1, 1),
(52, 6, 201, 1, 1),
(53, 6, 202, 1, 1),
(54, 6, 203, 1, 1),
(55, 7, 1, 1, 1),
(56, 7, 2, 5, 1),
(57, 7, 3, 5, 1),
(58, 7, 101, 5, 1),
(59, 7, 102, 5, 1),
(60, 7, 103, 5, 1),
(61, 7, 201, 5, 1),
(62, 7, 202, 5, 1),
(63, 7, 203, 5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `cli_id` int(11) NOT NULL,
  `cli_nom` varchar(50) DEFAULT NULL,
  `cli_prenom` varchar(50) DEFAULT NULL,
  `cli_adresse` varchar(50) DEFAULT NULL,
  `cli_ville` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`cli_id`, `cli_nom`, `cli_prenom`, `cli_adresse`, `cli_ville`) VALUES
(1, 'Doe', 'John', '', 'LA'),
(2, 'Homme', 'Josh', '', 'Palm Desert'),
(3, 'Paul', 'Weller', '', 'Londre'),
(4, 'White', 'Jack', '', 'Detroit'),
(5, 'Claypool', 'Les', '', 'San Francisco'),
(6, 'Squire', 'Chris', '', 'Londre'),
(7, 'Wood', 'Ronnie', '', 'Londre'),
(8, 'Jessica', 'Pikatchien', NULL, 'Dunkerque');

-- --------------------------------------------------------

--
-- Structure de la table `hotel`
--

CREATE TABLE `hotel` (
  `hot_id` int(11) NOT NULL,
  `hot_sta_id` int(11) NOT NULL,
  `hot_nom` varchar(50) NOT NULL,
  `hot_categorie` int(11) NOT NULL,
  `hot_adresse` varchar(50) NOT NULL,
  `hot_ville` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `hotel`
--

INSERT INTO `hotel` (`hot_id`, `hot_sta_id`, `hot_nom`, `hot_categorie`, `hot_adresse`, `hot_ville`) VALUES
(1, 1, 'Le Magnifique', 3, 'rue du bas', 'Pralo'),
(2, 1, 'Hotel du haut', 1, 'rue du haut', 'Pralo'),
(3, 2, 'Le Narval', 3, 'place de la liberation', 'Vonten'),
(4, 2, 'Les Pissenlis', 4, 'place du 14 juillet', 'Bretou'),
(5, 2, 'RR Hotel', 5, 'place du bas', 'Bretou'),
(6, 2, 'La Brique', 2, 'place du haut', 'Bretou'),
(7, 3, 'Le Beau Rivage', 3, 'place du centre', 'Toras');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `res_id` int(11) NOT NULL,
  `res_cha_id` int(11) NOT NULL,
  `res_cli_id` int(11) NOT NULL,
  `res_date` datetime NOT NULL,
  `res_date_debut` datetime NOT NULL,
  `res_date_fin` datetime NOT NULL,
  `res_prix` decimal(6,2) NOT NULL,
  `res_arrhes` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`res_id`, `res_cha_id`, `res_cli_id`, `res_date`, `res_date_debut`, `res_date_fin`, `res_prix`, `res_arrhes`) VALUES
(1, 1, 1, '2017-01-10 00:00:00', '2017-07-01 00:00:00', '2017-07-15 00:00:00', '2400.00', '800.00'),
(2, 2, 2, '2017-01-10 00:00:00', '2017-07-01 00:00:00', '2017-07-15 00:00:00', '3400.00', '100.00'),
(3, 1, 3, '2017-01-10 00:00:00', '2017-07-01 00:00:00', '2017-07-15 00:00:00', '400.00', '50.00'),
(4, 2, 4, '2017-01-10 00:00:00', '2017-07-01 00:00:00', '2017-07-15 00:00:00', '7200.00', '1800.00'),
(5, 3, 5, '2017-01-10 00:00:00', '2017-07-01 00:00:00', '2017-07-15 00:00:00', '1400.00', '450.00'),
(6, 4, 6, '2017-01-10 00:00:00', '2017-07-01 00:00:00', '2017-07-15 00:00:00', '2400.00', '780.00'),
(7, 4, 6, '2017-01-10 00:00:00', '2017-07-01 00:00:00', '2017-07-15 00:00:00', '500.00', '80.00'),
(8, 4, 1, '2017-01-10 00:00:00', '2017-07-01 00:00:00', '2017-07-15 00:00:00', '40.00', '0.00');

-- --------------------------------------------------------

--
-- Structure de la table `station`
--

CREATE TABLE `station` (
  `sta_id` int(11) NOT NULL,
  `sta_nom` varchar(50) NOT NULL,
  `sta_altitude` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `station`
--

INSERT INTO `station` (`sta_id`, `sta_nom`, `sta_altitude`) VALUES
(1, 'La Montagne', 2500),
(2, 'Le Sud', 200),
(3, 'La Plage', 10);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_chahot`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `v_chahot` (
`Numéro de chambre` int(11)
,`Nom d'hôtel` varchar(50)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_chahotres`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `v_chahotres` (
`Numéro de chambre` int(11)
,`Numéro de l'hôtel` varchar(50)
,`Nom de la station` varchar(50)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_hotstat`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `v_hotstat` (
`Nom d'hôtel` varchar(50)
,`Nom de station` varchar(50)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_rescli`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `v_rescli` (
`Numéro de réservation` int(11)
,`Nom du client` varchar(50)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_resclihot`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `v_resclihot` (
`Numéro de réservation` int(11)
,`Nom du client` varchar(50)
,`Nom de l'hôtel` varchar(50)
);

-- --------------------------------------------------------

--
-- Structure de la vue `v_chahot`
--
DROP TABLE IF EXISTS `v_chahot`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_chahot`  AS  select `chambre`.`cha_numero` AS `Numéro de chambre`,`hotel`.`hot_nom` AS `Nom d'hôtel` from (`chambre` join `hotel` on((`chambre`.`cha_hot_id` = `hotel`.`hot_id`))) order by `chambre`.`cha_numero` ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_chahotres`
--
DROP TABLE IF EXISTS `v_chahotres`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_chahotres`  AS  select `chambre`.`cha_numero` AS `Numéro de chambre`,`hotel`.`hot_nom` AS `Numéro de l'hôtel`,`station`.`sta_nom` AS `Nom de la station` from ((`chambre` join `hotel`) join `station`) where ((`chambre`.`cha_hot_id` = `hotel`.`hot_id`) and (`hotel`.`hot_sta_id` = `station`.`sta_id`)) order by `chambre`.`cha_numero` ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_hotstat`
--
DROP TABLE IF EXISTS `v_hotstat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_hotstat`  AS  select `hotel`.`hot_nom` AS `Nom d'hôtel`,`station`.`sta_nom` AS `Nom de station` from (`hotel` join `station` on((`hotel`.`hot_sta_id` = `station`.`sta_id`))) order by `hotel`.`hot_nom` ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_rescli`
--
DROP TABLE IF EXISTS `v_rescli`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rescli`  AS  select `reservation`.`res_id` AS `Numéro de réservation`,`client`.`cli_nom` AS `Nom du client` from (`reservation` join `client` on((`reservation`.`res_cli_id` = `client`.`cli_id`))) order by `reservation`.`res_id` ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_resclihot`
--
DROP TABLE IF EXISTS `v_resclihot`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_resclihot`  AS  select `reservation`.`res_id` AS `Numéro de réservation`,`client`.`cli_nom` AS `Nom du client`,`hotel`.`hot_nom` AS `Nom de l'hôtel` from (((`reservation` join `client`) join `chambre`) join `hotel`) where ((`reservation`.`res_cli_id` = `client`.`cli_id`) and (`reservation`.`res_cha_id` = `chambre`.`cha_id`) and (`chambre`.`cha_hot_id` = `hotel`.`hot_id`)) order by `reservation`.`res_id` ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`cha_id`),
  ADD KEY `cha_hot_id` (`cha_hot_id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`cli_id`);

--
-- Index pour la table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`hot_id`),
  ADD KEY `hot_sta_id` (`hot_sta_id`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`res_id`),
  ADD KEY `res_cha_id` (`res_cha_id`),
  ADD KEY `res_cli_id` (`res_cli_id`);

--
-- Index pour la table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`sta_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `chambre`
--
ALTER TABLE `chambre`
  MODIFY `cha_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `cli_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `hot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `res_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `station`
--
ALTER TABLE `station`
  MODIFY `sta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD CONSTRAINT `chambre_ibfk_1` FOREIGN KEY (`cha_hot_id`) REFERENCES `hotel` (`hot_id`);

--
-- Contraintes pour la table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`hot_sta_id`) REFERENCES `station` (`sta_id`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`res_cha_id`) REFERENCES `chambre` (`cha_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`res_cli_id`) REFERENCES `client` (`cli_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
