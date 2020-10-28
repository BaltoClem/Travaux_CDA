<?php

include("process.php");
include("header.php");

$discId = $_GET["disc_id"];

$requete_detail = $db->query("SELECT * 
                                        FROM disc 
                                        JOIN artist 
                                        WHERE disc.artist_id = artist.artist_id 
                                        AND disc.disc_id =" . $discId);
$tableau_detail = $requete_detail->fetch(PDO::FETCH_OBJ);
$requete_detail->closeCursor();

?>

<body>
<div class="container">
    <h1 class="text-center">Détail du disque</h1>
    <br>
    <div class="row justify-content-center">
        <img src="assets/pictures/<?= $tableau_detail->disc_picture ?>" class="img-fluid" alt="album">
    </div>
    <br>
    <form>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputTitle">Title</label>
                <input type="text" class="form-control" id="inputTitle" value="<?= $tableau_detail->disc_title ?>" readonly>
            </div>
            <div class="form-group col-md-6">
                <label for="inputArtist">Artist</label>
                <input type="text" class="form-control" id="inputArtist"  value="<?= $tableau_detail->artist_name ?>" readonly>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputYear">Year</label>
                <input type="text" class="form-control" id="inputYear" value="<?= $tableau_detail->disc_year ?>" readonly>
            </div>
            <div class="form-group col-md-6">
                <label for="inputGenre">Genre</label>
                <input type="text" class="form-control" id="inputGenre" value="<?= $tableau_detail->disc_genre ?>" readonly>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputLabel">Label</label>
                <input type="text" class="form-control" id="inputLabel" value="<?= $tableau_detail->disc_label ?>" readonly>
            </div>
            <div class="form-group col-md-6">
                <label for="inputPrice">Price&nbsp;(&euro;)</label>
                <input type="number" class="form-control" id="inputPrice" value="<?= $tableau_detail->disc_price ?>" readonly>
            </div>
        </div>
    </form>

    <div class="row justify-content-center m-3">

        <a href="update_form.php?disc_id=<?= $tableau_detail->disc_id ?>"><button type="button" class="btn btn-info m-2">Modifier</button></a>
        <a href="delete_script.php?disc_id=<?= $tableau_detail->disc_id ?>"><button type="button" class="btn btn-danger m-2">Supprimer</button></a>
        <a href="index.php"><button type="button" class="btn btn-secondary m-2">Retour</button></a>

    </div>
<?php
include("footer.php");
?>