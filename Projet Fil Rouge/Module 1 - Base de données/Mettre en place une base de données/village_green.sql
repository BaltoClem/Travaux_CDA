-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 01 sep. 2020 à 09:55
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
  `pro_prix_achat` decimal(10,2) DEFAULT NULL,
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
(14, 'Millenium MX222BX Standard Set BK', 'Pied droit de cymbale / Pédale de charleston / Pédale de grosse caisse', '248.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/156270/11461086_800.jpg', 5, 1, 7),
(15, 'Millenium HD-120 E-Drum Set', 'Pour débutants et enfants / Encombrement requis: 1000 x 600 mm / 12 kits de batterie', '222.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/461227/14367118_800.jpg', 5, 1, 8),
(16, 'Millenium MPS-150 E-Drum Set', 'Idéale pour les débutants / 108 sons / 10 kits de batterie', '258.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/360221/10083900_800.jpg', 5, 1, 8),
(17, 'Zildjian 06 A-Custom Splash', 'Finition: Brillante / Cymbale martelée à la main / Bronze', '95.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/128024/14013887_800.jpg', 5, 1, 9),
(18, 'Zildjian 06 A-Series Splash', 'Finition: Régulière / Cymbale martelée à la main / Bronze', '105.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/100883/10389887_800.jpg', 5, 1, 9),
(19, 'Millenium 7A Drum Sticks Maple -Wood-', 'En érable / Olives en bois / Ovale', '2.19', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/144009/1732818_800.jpg', 5, 1, 10),
(20, 'Vic Firth 7AN American Classic Hickory', 'En hickory américain / Longueur: 394 mm / Olives en nylon', '11.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/101813/13297521_800.jpg', 5, 1, 10),
(21, 'LP 808Z 11 Quinto Galaxy BH', 'Série Galaxy / En fibre de verre / Partie intérieure supérieure renforcée de fibre de kevlar', '666.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/172275/10411396_800.jpg', 5, 1, 11),
(22, 'Thomann Latin Expert 12,5 Conga', 'Fabriqué entièrement à la main / Construction classique type tonneau / Cercle et accastillage chromés', '199.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/441859/13668056_800.jpg', 5, 1, 11),
(23, 'Yamaha PSR-SX900', '61 touches sensibles à la vélocité / Nouveau clavier FSB / 525 styles', '1890.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/471242/14616988_800.jpg', 5, 1, 12),
(24, 'Startone MKR 61', '61 touches / 128 sons / 128 rythmes', '49.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/353537/9980986_800.jpg', 5, 1, 12),
(25, 'Behringer DeepMind 12', '49 touches semi-lestées sensibles à la vélocité avec Aftertouch / 4 moteurs d\'effets tc electronic et Klark Teknik / 3 générateurs ADSR', '699.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/402983/11710168_800.jpg', 5, 1, 13),
(26, 'Sequential Pro 3 Special Edition', 'Edition spéciale avec panneau de commande inclinable et garniture en noyer / Clavier 37 touches / 2 VCOs', '2199.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/482583/15274583_800.jpg', 5, 1, 13),
(27, 'AKAI Professional MPK mini MK2 white', '25 mini-touches synth-action / Arpégiateur / Couleur: Blanc', '89.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/417635/12313797_800.jpg', 5, 1, 14),
(28, 'AKAI Professional MPK Mini MK3', '25 touches miniatures sensibles à la vélocité / Arpégiateur / Sélecteur de 10 octaves', '99.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/498231/15420811_800.jpg', 5, 1, 14),
(29, 'Thomann DP-26', '88 touches lestées / Mécanique à marteaux / 20 sons', '309.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/352258/14120887_800.jpg', 5, 1, 15),
(30, 'Thomann SP-320', '88 touches semi-lestées sensibles à la vélocité / 12 sons / 12 morceaux de démonstration', '239.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/381525/11740155_800.jpg', 5, 1, 15),
(31, 'Thomann DP-33 WH', '88 touches lestées sensibles à la vélocité / Mécanique à marteaux / 26 sonorités', '399.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/347195/9512041_800.jpg', 5, 1, 16),
(32, 'Korg B2 SP Black', '88 touches / Mécanique à marteaux / 12 sons', '533.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/468703/14217257_800.jpg', 5, 1, 16),
(33, 'Kawai GL 10 E/P Grand Piano', 'Mécaniques ultra-réactives / Marteaux feutrés / Capot à fermeture sans bruit', '9799.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/371903/10395977_800.jpg', 5, 1, 17),
(34, 'Startone Maja 48 Accordion Red', '26 touches de mélodie / 48 boutons de basse / 3 registres de mélodie', '398.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/232825/12879087_800.jpg', 5, 1, 18),
(35, 'Focusrite Scarlett 2i2 3rd Gen', 'Connexion USB-C / 2 préamplis micro Scarlett / Fonction Air commutable', '145.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/467950/14226632_800.jpg', 5, 1, 19),
(36, 'Rode NT1-A Complete Vocal Recording', 'Microphone rode NT1A / Suspension SM6 deluxe avec filtre anti-pop intégrée / 6 mètres de câble', '179.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/235937/11669583_800.jpg', 5, 1, 20),
(37, 'Steinberg Cubase Artist 10.5', 'Entier 32 bits et 64 bits flottante / 64 pistes audio et 128 pistes MIDI / 32 pistes instruments', '269.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/prod/451260.jpg', 5, 1, 21),
(38, 'Zoom H1n', 'Surface caoutchoutée / Couple de microphones X-Y / Haut-parleur intégré', '88.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/430079/12882282_800.jpg', 5, 1, 22),
(39, 'beyerdynamic DT-770 Pro 250 Ohms', 'Fermé / Dynamique / Circum-aural', '118.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/106864/9154081_800.jpg', 5, 1, 23),
(40, 'Behringer WING', '40 entrées stéréo / 8 entrées auxiliaires stéréo / 8 sorties analogiques Midas Line', '2850.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/478472/14611348_800.jpg', 5, 1, 24),
(41, 'Behringer EPS500MP3', 'Jusqu\'à 500W crête / Lecteur MP3 intégré via clé USB / Égaliseur 2 bandes pour tous les canaux', '344.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/308724/6598901_800.jpg', 5, 1, 25),
(42, 'Behringer Xenyx X1622USB', 'Faders de 60 mm / 4x entrées ligne stéréo / Faders de 60 mm', '175.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/243140/13760486_800.jpg', 5, 1, 26),
(43, 'Swissonic SA 125', 'Puissance: 120 Watt / 4x entrées niveau micro ou ligne / Entrée auxiliaire', '149.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/277370/12732067_800.jpg', 5, 1, 27),
(44, 'Shure SM58 LC', 'Version sans interrupteur marche/arrêt / Directivité: Cardioïde / Réponse en fréquence: 50 - 15.000 Hz', '98.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/105767/8805536_800.jpg', 5, 1, 28),
(45, 'Millenium MS 2003', 'Socle en fonte / Trépied pliable / Vis en métal au niveau de la rotule', '16.90', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/133136/13413261_800.jpg', 5, 1, 29),
(46, 'the sssnake IPP1030', 'Longueur: 3 m / Jack 6,3 mm - Jack 6,3 mm / Couleur: Noir', '3.44', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/128549/9507926_800.jpg', 5, 1, 30),
(47, 'Stairville PAR 56 Active 300W DMX black', 'Convient pour lampes de PAR56 de 300 Watt et douille GX16D / Boîtier professionnel en aluminium / Câble et fiche de sécurité', '59.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/394815/11855875_800.webp', 5, 1, 31),
(48, 'Stairville LED Vintage Bowl 30 RGBA', 'Élément de décoration pour les scènes, les clubs et les événements / Construction métallique robuste / Diamètre : 30 cm', '154.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/472343/15341222_800.jpg', 5, 1, 32),
(49, 'Stairville AF-250 Fog Machine 1300W DMX', 'Interface DMX-512 intégrée / Contrôlable avec n\'importe quel contrôleur DMX-512 / Corps de chauffe: 1300 Watt', '149.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/340945/9584365_800.jpg', 5, 1, 33),
(50, 'Stairville LED BossFx-1 Pro Bundle Comple', 'Montage et démontage rapide / Une installation suspendue est possible avec le support de montage également fourni / Panneaux lumineux: 12x LEDs RVB de 9 Watt', '355.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/424577/14799741_800.jpg', 5, 1, 34),
(51, 'Stairville Wild Wash 132 LED RGB', 'Contrôle DMX / LED / Mélange de couleurs', '75.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/399664/11703403_800.jpg', 5, 1, 35),
(52, 'Native Instruments Traktor S2 MK3', 'EQ 3 bandes par canal / Boutons de sélection à la volée / Platines de précision de 14 cm', '248.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/447929/13624516_800.jpg', 5, 1, 36),
(53, 'Numark NDX 500', 'Lecture de CD mp3, CD audio et CR-R / Tempo master / Large molette de recherche', '219.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/350295/9517082_800.jpg', 5, 1, 37),
(54, 'Pro-Ject Debut III matt black', 'Entraînement de précision par courroie avec moteur synchrone / Nouveau support moteur en TPE / Tapis en feutre', '232.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/494994/15403492_800.jpg', 5, 1, 38),
(55, 'Behringer DJX900USB', '5 canaux / Effets numériques 24 bits / Faders contrôlés par VCA', '205.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/259424/13819361_800.jpg', 5, 1, 39),
(56, 'Serato DJ Pro', 'Contrôle de 2 ou 4 plateaux numériques simultanément / Mode entrainement avec 2 plateaux pour préparer des sets sans matériel hardware / Contrôle simplifié avec interface utilisateur individuelle et conviviale 2 ou 4 plateaux', '120.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/404311/12941409_800.jpg', 5, 1, 40),
(57, 'Boss RC-505', 'Pour le live et le studio / Commande à la main / 5 pistes stéréo avec contrôles dédiés', '449.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/311795/12651821_800.jpg', 5, 1, 41),
(58, 'Sennheiser HD-25', 'Dynamique / Fermé / Oreillette droite pivotante', '111.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/379291/11041266_800.jpg', 5, 1, 42),
(59, 'Gator G-112A Amp Transporter', 'Caisse en contreplaqué / Revêtement extérieur en nylon / Rembourrage intérieur de 20 mm', '109.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/212416/13733646_800.jpg', 5, 1, 43),
(60, 'Flyht Pro WP Safe Box 5 IP65', 'En matière plastique résistante / Etanche à l\'eau, la poussière et l\'air / Poignée robuste', '58.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/330507/13763551_800.jpg', 5, 1, 44),
(61, 'Millenium SD-180 B StudioDesk', 'Table de travail spacieuse pour les studios d\'enregistrement et de production / Plan de travail, étagères de moniteurs, tiroir pour clavier et panneau de base en panneau MDF plastifié / Tubes de raccordement en métal thermolaqué (couleur : noir)', '298.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/446802/13792401_800.jpg', 5, 1, 45),
(62, 'Thomann Smartcart', 'Roulement à billes / Capacité de charge max.: 100 kg / Couleur: Noir', '19.90', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/451162/13879781_800.jpg', 5, 1, 46),
(63, 'Millenium Blue Wheel Bundle 100 mm', 'Roulette pivotante avec frein / Diamètre de la roulette: 100 mm / Largeur de la roulette: 36 mm', '22.90', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/415294/12322322_800.jpg', 5, 1, 47),
(64, 'Millenium MDT4 Drum Throne Round', 'Assise ronde / Diamètre de l\'assise: 280 mm / Couleur: Noir', '44.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/190868/15190888_800.jpg', 5, 1, 48),
(65, 'Elacin Ear Protection Filter 25', 'Filtre 25 dB / Filtre de remplacement / Une paire', '68.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/152823/11584739_800.jpg', 5, 1, 49),
(66, 'Seiko WPM1000BE Metronome', 'Bois / Marron / Avec cloche', '98.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/495112/15265913_800.jpg', 5, 1, 50),
(67, 'Mollard S-Series 35cm Baton Pau Ferro', 'Série S / Longueur: 35 cm / Tige blanche lisse', '30.00', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/176897/11033666_800.jpg', 5, 1, 51),
(68, 'Knosti LP Cleaning Fluid', 'Pour kit de nettoyage Knoti Clening Set / 1 litre', '15.70', 'https://thumbs.static-thomann.de/thumb/orig/pics/bdb/179795/11567699_800.jpg', 5, 1, 52);

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
