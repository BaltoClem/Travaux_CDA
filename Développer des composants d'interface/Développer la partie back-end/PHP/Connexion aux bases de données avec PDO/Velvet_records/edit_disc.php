<?php
include("process.php");
include("index.php");

$discId = $_GET["disc_id"];

$requete_edit = $db->query("SELECT * FROM disc JOIN artist WHERE disc.artist_id = artist.artist_id AND disc.disc_id =" . $discId);
$tableau_edit = $requete_edit->fetch(PDO::FETCH_OBJ);
$requete_edit->closeCursor();

$requete_art = $db->query("SELECT * FROM artist");
$tableau_art = $requete_art->fetchAll(PDO::FETCH_OBJ);
$requete_art->closeCursor();
?>

<body>
<div class="container">
    <h1 class="text-center">Modification des informations</h1>
    <br>
    <div class="row justify-content-center">
        <img src="assets/pictures/<?= $tableau_edit->disc_picture ?>" class="img-fluid" alt="album">
    </div>
    <br>
    <form enctype="multipart/form-data" method="post" action="edit_process.php">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputTitle">Title</label>
                <input type="text" class="form-control" id="inputTitle" value="<?= $tableau_edit->disc_title ?>">
            </div>
            <div class="form-group col-md-6">
                <label for="inputArtist">Artist</label>
                <select class="form-control" id="inputArtist" name="artist">
                    <option selected disabled> <?= $tableau_edit->artist_name ?></option>
                    <?php foreach($tableau_art as $artist)
                    {
                        ?>
                        <option value="<?= $artist->artist_id ?>"><?= $artist->artist_name ?></option>
                        <?php
                    }
                    ?>
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputYear">Year</label>
                <input type="text" class="form-control" id="inputYear" value="<?= $tableau_edit->disc_year ?>">
            </div>
            <div class="form-group col-md-6">
                <label for="inputGenre">Genre</label>
                <input type="text" class="form-control" id="inputGenre" value="<?= $tableau_edit->disc_genre ?>">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputLabel">Label</label>
                <input type="text" class="form-control" id="inputLabel" value="<?= $tableau_edit->disc_label ?>">
            </div>
            <div class="form-group col-md-6">
                <label for="inputPrice">Price</label>
                <input type="text" class="form-control" id="inputPrice" value="<?= $tableau_edit->disc_price ?>&nbsp&euro;">
            </div>
        </div>
    </form>


    <div class="row justify-content-center m-3">


        <a href=""><button type="button" class="btn btn-danger m-2">Supprimer</button></a>
        <a href=""><button type="submit" class="btn btn-success mt-2" name="valid_edit">Valider les modifications</button></a>
        <a href="list_disc.php"><button type="button" class="btn btn-secondary m-2">Retour</button></a>

    </div>

</div>
</body>
</html>