<?php
try 
{        
    $db = new PDO('mysql:host=localhost;charset=utf8;dbname=record', 'root', '');
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (Exception $e) {
    echo "Erreur : " . $e->getMessage() . "<br>";
    echo "N° : " . $e->getCode();
    die("Fin du script");
}
?>

<!-- Requête d'affichage des détails dans la liste des cards des disques -->

<?php
$requete_card = $db->query("SELECT * FROM disc JOIN artist WHERE disc.artist_id = artist.artist_id");
$tableau_card = $requete_card->fetchAll(PDO::FETCH_OBJ);
$requete_card->closeCursor();
?>

<!-- Requête d'insertion de nouveaux vinyles' -->

