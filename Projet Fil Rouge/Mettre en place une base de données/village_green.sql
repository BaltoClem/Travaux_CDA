-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 31 août 2020 à 14:25
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
-- Base de données : `village_green`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `cli_id` int(11) NOT NULL,
  `cli_nom` varchar(50) DEFAULT NULL,
  `cli_prenom` varchar(50) DEFAULT NULL,
  `cli_adresse` varchar(250) DEFAULT NULL,
  `cli_cp` char(5) DEFAULT NULL,
  `cli_ville` varchar(50) DEFAULT NULL,
  `cli_regl` varchar(50) DEFAULT NULL,
  `cli_categ` varchar(50) DEFAULT NULL,
  `cli_coeff` decimal(5,2) DEFAULT NULL,
  `cli_com_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`cli_id`, `cli_nom`, `cli_prenom`, `cli_adresse`, `cli_cp`, `cli_ville`, `cli_regl`, `cli_categ`, `cli_coeff`, `cli_com_id`) VALUES
(1, 'RICHARD', 'François', '1 rue de la République', '80000', 'Amiens', 'Immédiat', 'Particulier', '1.00', 1),
(2, 'DUBOIS', 'Jean', '2 rue de la Liberté', '80000', 'Amiens', 'Différé', 'Professionnel', '2.00', 2),
(3, 'THOMAS', 'Evelyne', '3 rue de la Fraternité', '80000', 'Amiens', 'Immédiat', 'Particulier', '1.00', 3),
(4, 'MARTIN', 'Martine', '4 rue de la Démocratie', '80000', 'Amiens', 'Immédiat', 'Particulier', '1.00', 4),
(5, 'LANDON', 'Catherine', '5 rue de la Révolution', '80000', 'Amiens', 'Immédiat', 'Particulier', '1.00', 5);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `cmd_id` int(11) NOT NULL,
  `cmd_date` date DEFAULT NULL,
  `cmd_reduc` decimal(5,2) DEFAULT NULL,
  `cmd_fact_id` int(11) NOT NULL,
  `cmd_fact_date` date DEFAULT NULL,
  `cmd_cli_adresse_fact` varchar(50) DEFAULT NULL,
  `cmd_cli_cp_fact` char(5) DEFAULT NULL,
  `cmd_cli_ville_fact` varchar(50) DEFAULT NULL,
  `cmd_cli_adresse_liv` varchar(50) DEFAULT NULL,
  `cmd_cli_cp_liv` char(5) DEFAULT NULL,
  `cmd_cli_ville_liv` varchar(50) DEFAULT NULL,
  `cmd_cli_coeff` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commercial`
--

CREATE TABLE `commercial` (
  `com_id` int(11) NOT NULL,
  `com_nom` varchar(50) DEFAULT NULL,
  `com_prenom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commercial`
--

INSERT INTO `commercial` (`com_id`, `com_nom`, `com_prenom`) VALUES
(1, 'DURAND', 'Gérard'),
(2, 'DUPONT', 'Jean'),
(3, 'MUSQUIN', 'Marie-Ange'),
(4, 'MORTEZ', 'Pierre'),
(5, 'EPOUSIX', 'Josette');

-- --------------------------------------------------------

--
-- Structure de la table `contient`
--

CREATE TABLE `contient` (
  `contient_pro_id` int(11) NOT NULL,
  `contient_liv_id` int(11) NOT NULL,
  `contient_liv_qte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `envoie`
--

CREATE TABLE `envoie` (
  `env_four_id` int(11) NOT NULL,
  `env_pro_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `four_id` int(11) NOT NULL,
  `four_nom` varchar(50) DEFAULT NULL,
  `four_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`four_id`, `four_nom`, `four_type`) VALUES
(1, 'Fournisseur1', 'Constructeur'),
(2, 'Fournisseur2', 'Importateur'),
(3, 'Fournisseur3', 'Constructeur'),
(4, 'Fournisseur4', 'Importateur'),
(5, 'Fournisseur5', 'Constructeur');

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE `livraison` (
  `liv_id` int(11) NOT NULL,
  `liv_date` date DEFAULT NULL,
  `liv_cmd_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `passe`
--

CREATE TABLE `passe` (
  `passe_cmd_id` int(11) NOT NULL,
  `passe_cli_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `pro_id` int(11) NOT NULL,
  `pro_lib` varchar(50) DEFAULT NULL,
  `pro_descr` varchar(250) DEFAULT NULL,
  `pro_prix_achat` decimal(5,2) DEFAULT NULL,
  `pro_photo` varchar(250) DEFAULT NULL,
  `pro_stock` int(11) DEFAULT NULL,
  `pro_actif` tinyint(1) DEFAULT NULL,
  `pro_s_rub_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`pro_id`, `pro_lib`, `pro_descr`, `pro_prix_achat`, `pro_photo`, `pro_stock`, `pro_actif`, `pro_s_rub_id`) VALUES
(1, 'Harley Benton SC-1000', 'Progressive Line / Table bombée / Corps en acajou', '198.00', 'https://images.static-thomann.de/pics/prod/314901.jpg', 5, 1, 1),
(2, 'Harley Benton DC-Junior', 'Corps en acajou / Manche collé en acajou / Touche en ébène', '248.00', 'https://images.static-thomann.de/pics/prod/478683.jpg', 5, 1, 1),
(3, 'Harley Benton GL-2NT', 'Guitare classique 1/8 / Table en épicéa / Fond et éclisses en acajou (Entandrophragma cylindricum)', '49.00', 'https://images.static-thomann.de/pics/prod/371679.jpg', 3, 1, 2),
(4, 'Startone CG 851', 'Taille : 1/8 / Corps en tilleul / Manche en nato', '31.00', 'https://images.static-thomann.de/pics/prod/219218.jpg', 5, 1, 2),
(5, 'Harley Benton D-120CE BK', 'Dreadnought / Pan coupé / Table en épicéa', '79.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/prod/157819.jpg', 5, 1, 3),
(6, 'Harley Benton D-120CE NT', 'Série Standard / Dreadnought / Pan coupé', '79.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/prod/336998.jpg', 5, 1, 3),
(7, 'Harley Benton JB-75MN NA Vintage Series', '4 cordes / Série Vintage / Corps en frêne américain', '158.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/prod/224321.jpg', 5, 1, 4),
(8, 'Marcus Miller V7 Swamp Ash-4 NT 2nd Gen', '4 cordes / Fabriquée par Sire / Corps en frêne des marais', '499.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/prod/446264.jpg', 5, 1, 4),
(9, 'Harley Benton Kahuna CLU-Bass Ukulele', 'Electro-acoustique / Série Custom Line Kahuna / Taille Traveller', '148.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/319677/11351477_800.jpg', 5, 1, 5),
(10, 'Harley Benton B-30BK Acoustic Bass Series', '4 cordes / Série Acoustic Bass / Super Jumbo', '148.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/prod/165299.jpg', 5, 1, 5),
(11, 'Harley Benton UK-12 Black', 'Corps en tilleul / Manche en tilleul / Touche en Roseacer', '19.90', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/257768/14757106_800.jpg', 5, 1, 6),
(12, 'Harley Benton Ukulele UK-11DW Brown', 'Table laminée / Fond et éclisses en tilleul / Touche en Roseacer', '18.90', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/320760/15089265_800.jpg', 5, 1, 6),
(13, 'Pearl EXX725BR/C Export Jet Black', 'Série Export / Fûts en acajou asiatique/peuplier / Accastillage chromé', '758.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/320760/15089265_800.jpg', 5, 1, 7),
(14, 'Millenium MX222BX Standard Set BK', 'Pied droit de cymbale / Pédale de charleston / Pédale de grosse caisse', '248.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/156270/11461086_800.jpg', 5, 1, 7);

-- --------------------------------------------------------

--
-- Structure de la table `rubrique`
--

CREATE TABLE `rubrique` (
  `rub_id` int(11) NOT NULL,
  `rub_nom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `rubrique`
--

INSERT INTO `rubrique` (`rub_id`, `rub_nom`) VALUES
(1, 'Guitares/Basses'),
(2, 'Batteries'),
(3, 'Clavier'),
(4, 'Studio'),
(5, 'Sono'),
(6, 'Eclairage'),
(7, 'DJ'),
(8, 'Cases'),
(9, 'Accessoires');

-- --------------------------------------------------------

--
-- Structure de la table `se_compose_de`
--

CREATE TABLE `se_compose_de` (
  `se_compose_pro_id` int(11) NOT NULL,
  `se_compose_cmd_id` int(11) NOT NULL,
  `se_compose_cmd_nb_produits` int(11) DEFAULT NULL,
  `se_compose_pro_prix_vente` decimal(5,2) DEFAULT NULL,
  `se_compose_cmd_prix_tot` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sous_rubrique`
--

CREATE TABLE `sous_rubrique` (
  `s_rub_id` int(11) NOT NULL,
  `s_rub_nom` varchar(50) DEFAULT NULL,
  `s_rub_rub_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `sous_rubrique`
--

INSERT INTO `sous_rubrique` (`s_rub_id`, `s_rub_nom`, `s_rub_rub_id`) VALUES
(1, 'Guitares Electriques', 1),
(2, 'Guitares Classiques', 1),
(3, 'Guitares Acoustiques', 1),
(4, 'Basses Electriques', 1),
(5, 'Basses Acoustiques', 1),
(6, 'Ukulélés', 1),
(7, 'Batteries Acoustiques', 2),
(8, 'Batteries Electroniques', 2),
(9, 'Cymbales', 2),
(10, 'Baguettes et Maillets', 2),
(11, 'Percussions', 2),
(12, 'Claviers Arrangeurs', 3),
(13, 'Synthétiseurs', 3),
(14, 'Claviers Maîtres', 3),
(15, 'Pianos de Scène', 3),
(16, 'Pianos Numériques', 3),
(17, 'Pianos à Queue', 3),
(18, 'Accordéons', 3),
(19, 'Interfaces Audio', 4),
(20, 'Microphones', 4),
(21, 'Logiciels Studio', 4),
(22, 'Enregistreurs Numériques', 4),
(23, 'Casques et Amplificateurs', 4),
(24, 'Consoles Numériques', 4),
(25, 'Enceintes', 5),
(26, 'Tables de Mixage', 5),
(27, 'Amplificateurs', 5),
(28, 'Microphones', 5),
(29, 'Pieds', 5),
(30, 'Câbles', 5),
(31, 'Projecteurs', 6),
(32, 'Eclairage', 6),
(33, 'Machines à fumée', 6),
(34, 'Lasers', 6),
(35, 'Stroboscopes', 6),
(36, 'Contrôleurs DJ', 7),
(37, 'Lecteurs', 7),
(38, 'Platines', 7),
(39, 'Tables de Mixage', 7),
(40, 'Logiciels DJ', 7),
(41, 'Effets DJ', 7),
(42, 'Casques DJ', 7),
(43, 'Flight Cases', 8),
(44, 'Housses et Etuis', 8),
(45, 'Mobilier de Studio', 8),
(46, 'Systèmes de Transport', 8),
(47, 'Racks', 8),
(48, 'Sièges', 9),
(49, 'Protections', 9),
(50, 'Métronomes', 9),
(51, 'Baguettes', 9),
(52, 'Entretiens', 9);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`cli_id`),
  ADD KEY `cli_com_id` (`cli_com_id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`cmd_id`);

--
-- Index pour la table `commercial`
--
ALTER TABLE `commercial`
  ADD PRIMARY KEY (`com_id`);

--
-- Index pour la table `contient`
--
ALTER TABLE `contient`
  ADD PRIMARY KEY (`contient_pro_id`,`contient_liv_id`),
  ADD KEY `contient_liv_id` (`contient_liv_id`);

--
-- Index pour la table `envoie`
--
ALTER TABLE `envoie`
  ADD PRIMARY KEY (`env_four_id`,`env_pro_id`),
  ADD KEY `env_pro_id` (`env_pro_id`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`four_id`);

--
-- Index pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`liv_id`),
  ADD KEY `liv_cmd_id` (`liv_cmd_id`);

--
-- Index pour la table `passe`
--
ALTER TABLE `passe`
  ADD PRIMARY KEY (`passe_cmd_id`,`passe_cli_id`),
  ADD KEY `passe_cli_id` (`passe_cli_id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `pro_s_rub_id` (`pro_s_rub_id`);

--
-- Index pour la table `rubrique`
--
ALTER TABLE `rubrique`
  ADD PRIMARY KEY (`rub_id`);

--
-- Index pour la table `se_compose_de`
--
ALTER TABLE `se_compose_de`
  ADD PRIMARY KEY (`se_compose_pro_id`,`se_compose_cmd_id`),
  ADD KEY `se_compose_cmd_id` (`se_compose_cmd_id`);

--
-- Index pour la table `sous_rubrique`
--
ALTER TABLE `sous_rubrique`
  ADD PRIMARY KEY (`s_rub_id`),
  ADD KEY `s_rub_rub_id` (`s_rub_rub_id`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`cli_com_id`) REFERENCES `commercial` (`com_id`);

--
-- Contraintes pour la table `contient`
--
ALTER TABLE `contient`
  ADD CONSTRAINT `contient_ibfk_1` FOREIGN KEY (`contient_pro_id`) REFERENCES `produit` (`pro_id`),
  ADD CONSTRAINT `contient_ibfk_2` FOREIGN KEY (`contient_liv_id`) REFERENCES `livraison` (`liv_id`);

--
-- Contraintes pour la table `envoie`
--
ALTER TABLE `envoie`
  ADD CONSTRAINT `envoie_ibfk_1` FOREIGN KEY (`env_four_id`) REFERENCES `fournisseur` (`four_id`),
  ADD CONSTRAINT `envoie_ibfk_2` FOREIGN KEY (`env_pro_id`) REFERENCES `produit` (`pro_id`);

--
-- Contraintes pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `livraison_ibfk_1` FOREIGN KEY (`liv_cmd_id`) REFERENCES `commande` (`cmd_id`);

--
-- Contraintes pour la table `passe`
--
ALTER TABLE `passe`
  ADD CONSTRAINT `passe_ibfk_1` FOREIGN KEY (`passe_cmd_id`) REFERENCES `commande` (`cmd_id`),
  ADD CONSTRAINT `passe_ibfk_2` FOREIGN KEY (`passe_cli_id`) REFERENCES `client` (`cli_id`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`pro_s_rub_id`) REFERENCES `sous_rubrique` (`s_rub_id`);

--
-- Contraintes pour la table `se_compose_de`
--
ALTER TABLE `se_compose_de`
  ADD CONSTRAINT `se_compose_de_ibfk_1` FOREIGN KEY (`se_compose_pro_id`) REFERENCES `produit` (`pro_id`),
  ADD CONSTRAINT `se_compose_de_ibfk_2` FOREIGN KEY (`se_compose_cmd_id`) REFERENCES `commande` (`cmd_id`);

--
-- Contraintes pour la table `sous_rubrique`
--
ALTER TABLE `sous_rubrique`
  ADD CONSTRAINT `sous_rubrique_ibfk_1` FOREIGN KEY (`s_rub_rub_id`) REFERENCES `rubrique` (`rub_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
