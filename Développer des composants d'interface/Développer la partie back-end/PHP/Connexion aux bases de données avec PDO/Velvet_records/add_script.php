
<?php

include("header.php");
include("process.php");

$pdoStat = $db->prepare("INSERT INTO disc(disc_title, disc_year, disc_picture, disc_label,disc_genre, disc_price, artist_id)
                                VALUES(:disc_title,:disc_year, :disc_picture, :disc_label,:disc_genre,:disc_price,:artist_id)");

//les ":" devant les noms de colonne sont la nomenclature officielle de la fonction, cela sert à déterminer les coloones concernées plus tard dans le script
//bindValue associe une valeur à un paramètre

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

            } else {
                move_uploaded_file($_FILES["userfile"]["tmp_name"], "assets/pictures/" . $_FILES["userfile"]["name"]);
            }
        } else {
            echo "Error: Il y a eu un problème de téléchargement de votre fichier. Veuillez réessayer.";
        }
    } else {
        echo "Error: " . $_FILES["userfile"]["error"];
    }
}
$pdoStat->bindValue(':disc_title', $_POST['title'], PDO::PARAM_STR);
$pdoStat->bindValue(':disc_year', $_POST['year'], PDO::PARAM_INT);
$pdoStat->bindValue(':disc_picture', $filename, PDO::PARAM_STR);
$pdoStat->bindValue(':disc_label', $_POST['label'], PDO::PARAM_STR);
$pdoStat->bindValue(':disc_genre', $_POST['genre'], PDO::PARAM_STR);
$pdoStat->bindValue(':disc_price', $_POST['price'], PDO::PARAM_STR);
$pdoStat->bindValue(':artist_id', $_POST['artist'], PDO::PARAM_INT);

$insertOk = $pdoStat->execute();

if($insertOk){

    header("Location:index.php");
}

include("footer.php");
