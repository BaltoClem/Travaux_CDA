```
-- Adminer 4.6.3 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `offer` varchar(255) NOT NULL,
  `active` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- 2020-02-03 10:37:04
```

# Ce test sera en deux phases : Répondre aux questions suivantes, puis créer les fonctions demandés dans le fichier `functions.php`
# L'énoncé de chaque function se trouve dans le fichier `index.php`
# Attention ! Il ne faudra modifier que le fichier `functions.php`
# Modifier les accès à la base de données dans le fichier `database.php`
# Créer la table dans la base avec le script SQL ci-dessus

## Question :
### 1. Quelles variables superglobales permettent de récupérer des données provenant d'un formulaire ?

### 2. Quelle fonction PHP peuvent être utilisés pour connaître les extensions disponibles sur le système ?

### 3. Quelle sera la sortie du code suivant ?
```
$a = 1;
++$a;
$a *= $a;
echo $a--;
```

### 4. Comment initialiser la variable session en PHP ?

### 5. Comment déclare-t-on une variable de classe privée ?

### 6. Défini une classe A avec comme variable de classe : privée $a et $b, publique $c et $d. Et la fonction getA() en fonction privée
 
### 7. A-t-on accès à la fonction getA() en dehors de la classe ? Et pourquoi ?

### 8. Comment nomme-t-on une fonction commençant par Get/Set qui permet de récupérer ou initialiser une variable de classe ?

### 9. En SQL, donne la requête suivante pour le résultant suivant : `Je veux obtenir le nom de tous les utilisateurs et ainsi que leur offre, trié par ordre alphabétique sur le nom de l'offre` (cf. table ci-dessous) : 

### 10. Cite différents framework et CMS du langage PHP


### SQL TABLE
```
Table : `users`
Column : 
    - id
    - first_name
    - last_name
    - offer_id

Table : `offers`
Column : 
    - id
    - name
```