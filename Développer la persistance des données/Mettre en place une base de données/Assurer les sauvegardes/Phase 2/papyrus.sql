-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 28 août 2020 à 08:49
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
-- Base de données : `papyrus`
--

-- --------------------------------------------------------

--
-- Structure de la table `entcom`
--

CREATE TABLE `entcom` (
  `NUMCOM` int(10) NOT NULL,
  `OBSCOM` varchar(50) DEFAULT NULL,
  `DATCOM` date DEFAULT NULL,
  `NUMFOU` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fournis`
--

CREATE TABLE `fournis` (
  `NUMFOU` varchar(25) NOT NULL,
  `NOMFOU` varchar(25) DEFAULT NULL,
  `RUEFOU` varchar(50) DEFAULT NULL,
  `POSFOU` char(5) DEFAULT NULL,
  `VILFOU` varchar(30) DEFAULT NULL,
  `CONFOU` varchar(15) DEFAULT NULL,
  `SATISF` tinyint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ligcom`
--

CREATE TABLE `ligcom` (
  `NUMLIG` tinyint(3) NOT NULL,
  `QTECDE` int(10) DEFAULT NULL,
  `PRIUNI` varchar(50) DEFAULT NULL,
  `QTELIV` int(10) DEFAULT NULL,
  `DERLIV` datetime DEFAULT NULL,
  `NUMCOM` int(10) NOT NULL,
  `CODART` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `CODART` char(4) NOT NULL,
  `LIBART` varchar(30) DEFAULT NULL,
  `STKALE` int(10) DEFAULT NULL,
  `STKPHY` int(10) DEFAULT NULL,
  `QTEANN` int(10) DEFAULT NULL,
  `UNIMES` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

CREATE TABLE `vente` (
  `DELLIV` smallint(5) DEFAULT NULL,
  `QTE1` int(10) DEFAULT NULL,
  `PRIX1` varchar(50) DEFAULT NULL,
  `QTE2` int(10) DEFAULT NULL,
  `PRIX2` varchar(50) DEFAULT NULL,
  `QTE3` int(10) DEFAULT NULL,
  `PRIX3` varchar(50) DEFAULT NULL,
  `NUMFOU` varchar(25) NOT NULL,
  `CODART` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `entcom`
--
ALTER TABLE `entcom`
  ADD PRIMARY KEY (`NUMCOM`),
  ADD KEY `NUMFOU` (`NUMFOU`);

--
-- Index pour la table `fournis`
--
ALTER TABLE `fournis`
  ADD PRIMARY KEY (`NUMFOU`);

--
-- Index pour la table `ligcom`
--
ALTER TABLE `ligcom`
  ADD PRIMARY KEY (`NUMLIG`),
  ADD KEY `CODART` (`CODART`),
  ADD KEY `NUMCOM` (`NUMCOM`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`CODART`);

--
-- Index pour la table `vente`
--
ALTER TABLE `vente`
  ADD PRIMARY KEY (`NUMFOU`,`CODART`),
  ADD KEY `CODART` (`CODART`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `entcom`
--
ALTER TABLE `entcom`
  ADD CONSTRAINT `entcom_ibfk_1` FOREIGN KEY (`NUMFOU`) REFERENCES `fournis` (`NUMFOU`);

--
-- Contraintes pour la table `ligcom`
--
ALTER TABLE `ligcom`
  ADD CONSTRAINT `ligcom_ibfk_1` FOREIGN KEY (`CODART`) REFERENCES `produit` (`CODART`),
  ADD CONSTRAINT `ligcom_ibfk_2` FOREIGN KEY (`NUMCOM`) REFERENCES `entcom` (`NUMCOM`);

--
-- Contraintes pour la table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `vente_ibfk_1` FOREIGN KEY (`NUMFOU`) REFERENCES `fournis` (`NUMFOU`),
  ADD CONSTRAINT `vente_ibfk_2` FOREIGN KEY (`CODART`) REFERENCES `produit` (`CODART`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
