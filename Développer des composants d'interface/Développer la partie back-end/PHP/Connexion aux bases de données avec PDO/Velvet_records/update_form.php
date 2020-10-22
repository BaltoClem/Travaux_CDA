<?php
include("process.php");
include("header.php");

$discId = $_GET["disc_id"];

$requete_edit = $db->query("SELECT * 
                                    FROM disc 
                                    JOIN artist 
                                    ON disc.artist_id = artist.artist_id 
                                    WHERE disc.disc_id =".$discId);
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
    <form enctype="multipart/form-data" method="post" action="update_script.php">
        <input type="hidden" value="<?= $tableau_edit->disc_id ?>" name="discId">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputTitle">Title</label>
                <input type="text" class="form-control" id="inputTitle" value="<?= $tableau_edit->disc_title ?>" name="title">
            </div>
            <div class="form-group col-md-6">
                <label for="inputArtist">Artist</label>
                <select class="form-control" id="inputArtist" name="artist">
                    <?php
                    foreach($tableau_art as $artist)
                    {
                        ?>
                            <option value="<?= $artist->artist_id ?>"
                        <?php

                            if($artist->artist_id == $tableau_edit->artist_id){
                                echo "selected";
                            }

                            ?>
                            >
                        <?= $artist->artist_name ?></option>
                        <?php
                    }
                    ?>
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputYear">Year</label>
                <input type="text" class="form-control" id="inputYear" name="year" value="<?= $tableau_edit->disc_year ?>">
            </div>
            <div class="form-group col-md-6">
                <label for="inputGenre">Genre</label>
                <input type="text" class="form-control" id="inputGenre" name="genre" value="<?= $tableau_edit->disc_genre ?>">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputLabel">Label</label>
                <input type="text" class="form-control" id="inputLabel" name="label" value="<?= $tableau_edit->disc_label ?>">
            </div>
            <div class="form-group col-md-6">
                <label for="inputPrice">Price(&nbsp;&euro;&nbsp;)</label>
                <input type="number" step="any" class="form-control" id="inputPrice" name="price" value="<?= $tableau_edit->disc_price ?>" €>
            </div>
        </div>
        <div class="form-group">
            <label for="inputFile">Picture</label>
            <input type="hidden" value="<?= $tableau_edit->disc_picture ?>" name="picture">
            <input type="file" class="form-control-file" id="inputFile" name="userfile">
        </div>
        <div class="row justify-content-center m-3">
            <a href="delete_script.php?disc_id=<?= $tableau_edit->disc_id ?>"><button id="delete_button" type="button" class="btn btn-danger m-2">Supprimer</button></a>
            <a href=""><button type="submit" class="btn btn-success mt-2" name="valid_edit">Valider les modifications</button></a>
            <a href="index.php"><button type="button" class="btn btn-secondary m-2">Retour</button></a>
        </div>
    </form>
</div>
<?php
include("footer.php");
?>