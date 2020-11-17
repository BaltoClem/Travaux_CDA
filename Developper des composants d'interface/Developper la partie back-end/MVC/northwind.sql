-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 17 nov. 2020 à 10:39
-- Version du serveur :  5.7.24
-- Version de PHP : 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `northwind`
--

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `company_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_title` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20201110143527', '2020-11-10 14:36:50', 2391),
('DoctrineMigrations\\Version20201110144226', '2020-11-10 14:42:41', 217),
('DoctrineMigrations\\Version20201110144748', '2020-11-10 14:48:00', 202),
('DoctrineMigrations\\Version20201110145047', '2020-11-10 14:50:59', 680),
('DoctrineMigrations\\Version20201110145601', '2020-11-10 14:56:10', 240),
('DoctrineMigrations\\Version20201110150133', '2020-11-10 15:01:49', 698),
('DoctrineMigrations\\Version20201110151141', '2020-11-10 15:11:52', 525),
('DoctrineMigrations\\Version20201112153612', '2020-11-12 15:36:36', 2298),
('DoctrineMigrations\\Version20201113093353', '2020-11-13 09:34:52', 2514);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `required_date` datetime DEFAULT NULL,
  `shipped_date` datetime DEFAULT NULL,
  `ship_via` int(11) DEFAULT NULL,
  `freight` decimal(10,4) DEFAULT NULL,
  `ship_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_address` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_city` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_region` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_postal_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_country` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `unit_price` decimal(10,4) NOT NULL,
  `quantity` smallint(6) NOT NULL,
  `discount` decimal(8,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `quantity_per_unit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_price` decimal(14,4) NOT NULL,
  `units_in_stock` smallint(6) NOT NULL,
  `units_on_order` smallint(6) NOT NULL,
  `reorder_level` smallint(6) NOT NULL,
  `discontinued` tinyint(1) NOT NULL,
  `supplier_id_id` int(11) DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `product_name`, `category_id`, `quantity_per_unit`, `unit_price`, `units_in_stock`, `units_on_order`, `reorder_level`, `discontinued`, `supplier_id_id`, `picture`) VALUES
(1, 'Chai', 1, '10 boxes x 20 bags', '18.0000', 39, 0, 10, 0, 1, NULL),
(2, 'Chang', 1, '24 - 12 oz bottles', '19.0000', 17, 40, 25, 0, 1, NULL),
(3, 'Aniseed Syrup', 2, '12 - 550 ml bottles', '10.0000', 13, 70, 25, 0, 1, NULL),
(4, 'Chef Anton\'s Cajun Seasoning', 2, '48 - 6 oz jars', '22.0000', 53, 0, 0, 1, 2, '4.jpeg'),
(9, 'Produit avec image', 1, '1', '10.0000', 1, 1, 1, 0, 1, 'wallpapertip-sombra-wallpaper-100445-5fae49bff0bda.jpeg');

-- --------------------------------------------------------

--
-- Structure de la table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `company_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_title` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_page` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `suppliers`
--

INSERT INTO `suppliers` (`id`, `company_name`, `contact_name`, `contact_title`, `address`, `city`, `region`, `postal_code`, `country`, `phone`, `fax`, `home_page`) VALUES
(1, 'Exotic Liquids', 'Charlotte Cooper', 'Purchasing Manager', '49 Gilbert st.', 'London', NULL, 'EC14SD', 'UK', '(171) 555-1222', NULL, NULL),
(2, 'New Orleans Cajun Delights', 'Shelley Burke', 'Order Administrator', 'P.O. Box 78934', 'New Orleans', 'L.A.', '70117', 'U.S.A.', '(100) 555-4822', NULL, '#CAJUN.HTM#'),
(3, 'Grandma Kelly\'s Homestead', 'Regina Murphy', 'Sales Representative', '707 Oxford Rd.', 'Ann Arbor', 'MI', '48104', 'U.S.A.', '(313) 555-5735', '(313) 555-3349', NULL),
(4, 'Tokyo Traders', 'Yushi Nagaze', 'Marketing Mananger', '9-8 Sekimai Musashino-Shi', 'Tokyo', NULL, '100', 'Japan', '(03) 3555-5011', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `role`) VALUES
(1, 'test@test.fr', '$2y$13$rAcOm./nf4AyEBtHwH62Puvwb3Q7NahVzOs5KK2qH64ymHvDU8xGi', 'client'),
(2, 'testauth@test.fr', '$2y$12$93wuVWBnT2mwAaHH.MQ3eev57YRl1fhJWToo67OflENsZfHQwpJk6', 'client'),
(3, 'testadmin@test.fr', '$2y$12$/P9W21L.GdC8/yEhVWtx/ezkc3IVh8Mc5L3xxVjPg.hxAjWE1uciC', 'administrateur');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E52FFDEEB171EB6C` (`customer_id_id`);

--
-- Index pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B3BA5A5AA65F9C7D` (`supplier_id_id`);

--
-- Index pour la table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_E52FFDEEB171EB6C` FOREIGN KEY (`customer_id_id`) REFERENCES `customers` (`id`);

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_B3BA5A5AA65F9C7D` FOREIGN KEY (`supplier_id_id`) REFERENCES `suppliers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
