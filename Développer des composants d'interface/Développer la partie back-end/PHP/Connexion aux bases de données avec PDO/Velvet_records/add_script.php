<?php

include("process.php");

//Requête d'insertion des données

$pdoStat = $db->prepare("INSERT INTO disc(disc_title, disc_year, disc_picture, disc_label,disc_genre, disc_price, artist_id)
                                VALUES(:disc_title,:disc_year, :disc_picture, :disc_label,:disc_genre,:disc_price,:artist_id)");

/////////////////////////////////////////////// Conditions pour le TITRE ///////////////////////////////////////////////

if($_POST['title'] != ""){
    $pdoStat->bindValue(':disc_title', $_POST['title'], PDO::PARAM_STR);
}
else{
    echo "Erreur: Veuillez renseigner le titre de l'album";
    echo "<br>";
    header("Refresh:20;url=add_form.php");
}

/////////////////////////////////////////////// Conditions pour l'ANNEE ////////////////////////////////////////////////

if($_POST['year'] != "" && preg_match("/^(19|[2-9][0-9])\d{2}$/", $_POST['year'])){
    $pdoStat->bindValue(':disc_year', $_POST['year'], PDO::PARAM_INT);
}
else{
    echo "Erreur: Année de parution manquante ou invalide";
    echo "<br>";
    header("Refresh:20;url=add_form.php");
}

/////////////////////////////////////////////// Conditions pour le LABEL ///////////////////////////////////////////////

if($_POST['label'] != ""){
$pdoStat->bindValue(':disc_label', $_POST['label'], PDO::PARAM_STR);
}
else{
    echo "Erreur: Veuillez renseigner un label";
    echo "<br>";
    header("Refresh:20;url=add_form.php");
}

/////////////////////////////////////////////// Conditions pour le GENRE ///////////////////////////////////////////////

if($_POST['genre'] != "") {
    $pdoStat->bindValue(':disc_genre', $_POST['genre'], PDO::PARAM_STR);
}
else{
    echo "Erreur: Veuillez renseigner un genre";
    echo "<br>";
    header("Refresh:20;url=add_form.php");
}
/////////////////////////////////////////////// Conditions pour le PRIX ////////////////////////////////////////////////
if($_POST['price'] != "" && preg_match("/^[0-9]{1,3}(,[0-9]{3})*(([\\.,]{1}[0-9]*)|())$/", $_POST['price'])){
$pdoStat->bindValue(':disc_price', $_POST['price'], PDO::PARAM_STR);
}
else{
    echo "Erreur: Prix manquant ou incorrect";
    echo "<br>";
    header("Refresh:20;url=add_form.php");
}

/////////////////////////////////////////////// Conditions pour l'ARTISTE ///////////////////////////////////////////////

if(isset($_POST['artist'])) {
    $pdoStat->bindValue(':artist_id', $_POST['artist'], PDO::PARAM_INT);
}
else{
    echo "Erreur: Veuillez renseigner un artiste";
    echo "<br>";
    header("Refresh:20;url=add_form.php");
}

//////////////////////////////////Conditions de téléchargements de l'album du vinyle////////////////////////////////////

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Vérifie si le fichier a été uploadé sans erreur.
    if (isset($_FILES["userfile"]) && $_FILES["userfile"]["error"] == 0) {
        $allowed = array("jpg" => "image/jpg", "jpeg" => "image/jpeg", "gif" => "image/gif", "png" => "image/png");
        $filename = $_FILES["userfile"]["name"];
        $filetype = $_FILES["userfile"]["type"];
        $filesize = $_FILES["userfile"]["size"];

        // Vérifie l'extension du fichier
        $ext = pathinfo($filename, PATHINFO_EXTENSION);
        if (!array_key_exists($ext, $allowed)) die("Erreur : Veuillez sélectionner un format de fichier valide.");

        // Vérifie la taille du fichier - 5Mo maximum
        $maxsize = 5 * 1024 * 1024;
        if ($filesize > $maxsize) die("Error: La taille du fichier est supérieure à la limite autorisée.");

        // Vérifie le type MIME du fichier
        if (in_array($filetype, $allowed)) {
            // Vérifie si le fichier existe avant de le télécharger.
            if (file_exists("assets/pictures/" . $_FILES["userfile"]["name"])) {
                echo $_FILES["userfile"]["name"] . " existe déjà.";
            } else {
                move_uploaded_file($_FILES["userfile"]["tmp_name"], "assets/pictures/" . $_FILES["userfile"]["name"]);
                echo "Votre fichier a été téléchargé avec succès.";
            }
        } else {
            echo "Error: Il y a eu un problème de téléchargement de votre fichier. Veuillez réessayer.";
        }
    }
}

//Définition des valeurs à envoyer et sécurisation de l'envoi des données
if(isset($filename)){
$pdoStat->bindValue(':disc_picture', $filename, PDO::PARAM_STR);
}
else{
    echo "Erreur: Veuillez attribuer une image pour l'album";
    echo "<br>";
    header("Refresh:20;url=add_form.php");
    exit();
}

$pdoStat->execute();

header("Location:index.php");