<?php

include("process.php");

if (isset ($_POST['valid_add'])){

/////////////////////////////////////////////DECLARATION REGEX//////////////////////////////////////////////////////////

$yearPattern = "/^(?:(?:19|20)[0-9]{2})$/";
$pricePattern = "/^[0-9]{1,3}(,[0-9]{3})*(([\\.,]{1}[0-9]*)|())$/";

////////////////////////////////////////////TABLEAU ERREUR /////////////////////////////////////////////////////////////
$formError = [];
///////////////////////////////////////////REQUETE PREPAREE/////////////////////////////////////////////////////////////

$pdoStat = $db->prepare("INSERT INTO disc(disc_title, disc_year, disc_picture, disc_label,disc_genre, disc_price, artist_id)
                                VALUES(:disc_title,:disc_year, :disc_picture, :disc_label,:disc_genre,:disc_price,:artist_id)");

/////////////////////////////////////////////// CONDITIONS D'INSERTION /////////////////////////////////////////////////

    /* Titre */
if(!empty($_POST['title'])) {
    $title = $_POST['title'];
    }
else {
    $formError['title'] = 'title=true';
}

    /*Artiste*/
if(isset($_POST['artist'])) {
    $artist = $_POST['artist'];
    }
else {
    $formError['artist'] = 'artist=true';

}

    /* Année */
if(isset($_POST['year'])) {
    if(preg_match($yearPattern, $_POST['year'])){
        $year = $_POST['year'];
    }
    else{
        $formError['year'] = "year=true";

    }
}
else {
    $formError['year'] = 'year=true';

}

    /* Genre */
if(!empty($_POST['genre'])) {
        $genre = $_POST['genre'];
    }
else {
    $formError['genre'] = 'genre=true';

}

    /* Label */
if(!empty($_POST['label'])) {
   $label = $_POST['label'];
    }
else {
    $formError['label'] = 'label=true';

}

    /* Prix */
if(isset($_POST['price'])) {
    if(preg_match($pricePattern, $_POST['price'])){
        $prix = $_POST['price'];
    }
    else{
        $formError['price'] = 'price=true';

    }
}
else {
    $formError['price'] = 'price=true';

}

    /* Image */

// Vérifie si le fichier a été uploadé sans erreur.
if (!empty($_FILES["userfile"]) && $_FILES["userfile"]["error"] == 0) {
        $allowed = array("jpg" => "image/jpg", "jpeg" => "image/jpeg", "gif" => "image/gif", "png" => "image/png");
        $filename = $_FILES["userfile"]["name"];
        $filetype = $_FILES["userfile"]["type"];
        $filesize = $_FILES["userfile"]["size"];

        // Vérifie l'extension du fichier
        $ext = pathinfo($filename, PATHINFO_EXTENSION);
   if (!array_key_exists($ext, $allowed)) {
       $formError['image'] = "image=true";};

        // Vérifie la taille du fichier - 5Mo maximum
        $maxsize = 5 * 1024 * 1024;
   if ($filesize > $maxsize) {
       $formError['image'] = "image=true";};

        // Vérifie le type MIME du fichier
   if (in_array($filetype, $allowed)) {
            // Vérifie si le fichier existe avant de le télécharger.
      if (file_exists("assets/pictures/" . $_FILES["userfile"]["name"])) {
                $image = $filename;
      } else {
                move_uploaded_file($_FILES["userfile"]["tmp_name"], "assets/pictures/" . $_FILES["userfile"]["name"]);
                $image = $filename;
       }
   }
}
else{
    $formError['image'] = "image=true";
}

if(count($formError) === 0) {

    $pdoStat->bindValue(':disc_title', $title, PDO::PARAM_STR);
    $pdoStat->bindValue(':artist_id', $artist, PDO::PARAM_INT);
    $pdoStat->bindValue(':disc_year', $year, PDO::PARAM_INT);
    $pdoStat->bindValue(':disc_genre', $genre, PDO::PARAM_STR);
    $pdoStat->bindValue(':disc_label', $label, PDO::PARAM_STR);
    $pdoStat->bindValue(':disc_price', $prix, PDO::PARAM_STR);
    $pdoStat->bindValue(':disc_picture', $image, PDO::PARAM_STR);

    $pdoStat->execute();
    header("Location:index.php");
    }
else{
    $sUrl = implode("&", $formError);//On regroupe toutes les erreurs
    header("Location:add_form.php?".$sUrl);//On affiche les erreurs dans le formulaire add_form.php
    exit;
}
}