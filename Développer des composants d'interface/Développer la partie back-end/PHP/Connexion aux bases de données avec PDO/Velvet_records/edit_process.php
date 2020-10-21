<?php

include("process.php");

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
    } else {
        echo "Error: " . $_FILES["userfile"]["error"];
    }
}

// METTRE LA REQUETE APRES LA CONDITION DE TELECHARGEMENT POUR EVITER LES ERREURS PHP !!!

$pdoStat = $db->prepare("UPDATE disc 
                                SET disc_id=:disc_id,disc_title=:disc_title, disc_year=:disc_year, disc_picture=:disc_picture, 
                                disc_label=:disc_label, disc_genre=:disc_genre, disc_price=:disc_price, artist_id=:artist_id
                                WHERE disc_id=:disc_id");
$pdoStat->bindValue(':disc_title', $_POST['title'], PDO::PARAM_STR);
$pdoStat->bindValue(':disc_year', $_POST['year'], PDO::PARAM_INT);
if(isset($filename)){
$pdoStat->bindValue(':disc_picture', $filename, PDO::PARAM_STR);
}
else{
    $pdoStat->bindValue(':disc_picture', $_POST['picture'], PDO::PARAM_STR);
}
$pdoStat->bindValue(':disc_label', $_POST['label'], PDO::PARAM_STR);
$pdoStat->bindValue(':disc_genre', $_POST['genre'], PDO::PARAM_STR);
$pdoStat->bindValue(':disc_price', $_POST['price'], PDO::PARAM_STR);
$pdoStat->bindValue(':artist_id', $_POST['artist'], PDO::PARAM_INT);
$pdoStat->bindValue(':disc_id', $_POST['discId'], PDO::PARAM_INT);

$pdoStat->execute();