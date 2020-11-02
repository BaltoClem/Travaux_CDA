<?php

include("process.php");

if (isset ($_POST['valid_add'])){

/////////////////////////////////////////////DECLARATION REGEX//////////////////////////////////////////////////////////

$yearPattern = "/^(19|[2-9][0-9])\d{2}$/";
$pricePattern = "/^[0-9]{1,3}(,[0-9]{3})*(([\\.,]{1}[0-9]*)|())$/";

////////////////////////////////////////////TABLEAU ERREUR /////////////////////////////////////////////////////////////
$formError = [];
///////////////////////////////////////////REQUETE PREPAREE/////////////////////////////////////////////////////////////

$pdoStat = $db->prepare("INSERT INTO disc(disc_title, disc_year, disc_picture, disc_label,disc_genre, disc_price, artist_id)
                                VALUES(:disc_title,:disc_year, :disc_picture, :disc_label,:disc_genre,:disc_price,:artist_id)");

/////////////////////////////////////////////// CONDITIONS D'INSERTION /////////////////////////////////////////////////

    /* Titre */
if(isset($_POST['title'])) {
    $title = $_POST['title'];
    }
else {
    $formError['title'] = 'Titre manquant';
}

    /*Artiste*/
if(isset($_POST['artist'])) {
    $artist = $_POST['artist'];
    }
else {
    $formError['artist'] = 'Artiste manquant';
}

    /* Année */
if(isset($_POST['year'])) {
    if(preg_match($yearPattern, $_POST['year'])){
        $year = $_POST['year'];
    }
    else{
        $formError['year'] = "Année invalide, format incorrect";
    }
}
else {
    $formError['year'] = 'Année manquante';
}

    /* Genre */
if(isset($_POST['genre'])) {
    $genre = $_POST['genre'];
}
else {
    $formError['genre'] = 'Genre manquant';
}

if(count($formError) === 0) {

    $pdoStat->bindValue(':disc_title', $title, PDO::PARAM_STR);
    $pdoStat->bindValue(':artist_id', $artist, PDO::PARAM_INT);
    $pdoStat->bindValue(':disc_year', $year, PDO::PARAM_INT);
    $pdoStat->bindValue(':disc_genre', $genre, PDO::PARAM_STR);

}

/////////////////////////////////////////////// Conditions pour le LABEL ///////////////////////////////////////////////

if($_POST['label'] != ""){
$pdoStat->bindValue(':disc_label', $_POST['label'], PDO::PARAM_STR);
}
else{
    echo "Erreur: Veuillez renseigner un label";
    echo "<br>";
    header("Refresh:3;url=add_form.php");
}

/////////////////////////////////////////////// Conditions pour le PRIX ////////////////////////////////////////////////
if($_POST['price'] != "" && preg_match("/^[0-9]{1,3}(,[0-9]{3})*(([\\.,]{1}[0-9]*)|())$/", $_POST['price'])){
$pdoStat->bindValue(':disc_price', $_POST['price'], PDO::PARAM_STR);
}
else{
    echo "Erreur: Prix manquant ou incorrect";
    echo "<br>";
    header("Refresh:3;url=add_form.php");
}

/////////////////////////////////////////////// Conditions pour l'ARTISTE ///////////////////////////////////////////////

if(isset($_POST['artist'])) {
    $pdoStat->bindValue(':artist_id', $_POST['artist'], PDO::PARAM_INT);
}
else{
    echo "Erreur: Veuillez renseigner un artiste";
    echo "<br>";
    header("Refresh:3;url=add_form.php");
}

//////////////////////////////////Conditions de téléchargements de l'album du vinyle////////////////////////////////////


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


//Définition des valeurs à envoyer et sécurisation de l'envoi des données
if(isset($filename)){
$pdoStat->bindValue(':disc_picture', $filename, PDO::PARAM_STR);
}
else{
    echo "Erreur: Veuillez attribuer une image pour l'album";
    echo "<br>";
    header("Refresh:3;url=add_form.php");
    exit();
}

$pdoStat->execute();

}