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
    <p class="text-center h1">Modification des informations</p>
    <br>
    <div class="row justify-content-center">
        <img src="assets/pictures/<?= $tableau_edit->disc_picture ?>" class="img-fluid" alt="album">
    </div>
    <br>
    <form enctype="multipart/form-data" method="post" action="update_script.php" id="form_up">
        <input type="hidden" value="<?= $tableau_edit->disc_id ?>" name="discId">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputTitle">Title</label>
                <input type="text" class="form-control" id="inputTitle" value="<?= $tableau_edit->disc_title ?>" name="title">
                <small class="form-text" id="alerttitle"></small>
                <?php
                if (isset($_GET["title"]))
                {
                    ?>
                    <div class="alert alert-danger">Vous n'avez pas renseigné le titre</div>
                    <?php
                }
                ?>
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
                <small class="form-text" id="alertartist"></small>
                <?php
                if (isset($_GET["artist"]))
                {
                    ?>
                    <div class="alert alert-danger">Vous n'avez pas renseigné l'artiste</div>
                    <?php
                }
                ?>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputYear">Year</label>
                <input type="text" class="form-control" id="inputYear" name="year" value="<?= $tableau_edit->disc_year ?>">
                <small class="form-text" id="alertyear"></small>
                <?php
                if (isset($_GET["year"]))
                {
                    ?>
                    <div class="alert alert-danger">Année de parution invalide ou manquante</div>
                    <?php
                }
                ?>
            </div>
            <div class="form-group col-md-6">
                <label for="inputGenre">Genre</label>
                <input type="text" class="form-control" id="inputGenre" name="genre" value="<?= $tableau_edit->disc_genre ?>">
                <small class="form-text" id="alertgenre"></small>
                <?php
                if (isset($_GET["genre"]))
                {
                    ?>
                    <div class="alert alert-danger">Vous n'avez pas renseigné le genre</div>
                    <?php
                }
                ?>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputLabel">Label</label>
                <input type="text" class="form-control" id="inputLabel" name="label" value="<?= $tableau_edit->disc_label ?>">
                <small class="form-text" id="alertlabel"></small>
                <?php
                if (isset($_GET["label"]))
                {
                    ?>
                    <div class="alert alert-danger">Vous n'avez pas renseigné le label</div>
                    <?php
                }
                ?>
            </div>
            <div class="form-group col-md-6">
                <label for="inputPrice">Price(&nbsp;&euro;&nbsp;)</label>
                <input type="number" step="any" class="form-control" id="inputPrice" name="price" value="<?= $tableau_edit->disc_price ?>" €>
                <small class="form-text" id="alertprice"></small>
                <?php
                if (isset($_GET["price"]))
                {
                    ?>
                    <div class="alert alert-danger">Prix invalide ou manquant</div>
                    <?php
                }
                ?>
            </div>
        </div>
        <div class="form-group">
            <label for="inputFile">Picture</label>
            <input type="hidden" value="<?= $tableau_edit->disc_picture ?>" name="picture">
            <input type="file" class="form-control-file" id="inputFile" name="userfile">
            <small class="form-text" id="alertpicture"></small>
            <?php
            if (isset($_GET["image"]))
            {
                ?>
                <div class="alert alert-danger">Vous n'avez pas télécharger d'image / Le format est incorrect / Taille de l'image trop importante</div>
                <?php
            }
            ?>
        </div>
        <div class="row justify-content-center mb-3">
            <input type="submit" class="btn btn-success mr-2" name="valid_edit" id="edit_button" value="Modifier">
            <a href="delete_script.php?disc_id=<?= $tableau_edit->disc_id ?>"><button id="delete_button" type="button" class="btn btn-danger mr-2">Supprimer</button></a>
            <a href="index.php"><button type="button" class="btn btn-secondary mr-2">Retour</button></a>
        </div>
    </form>
<?php
include("footer.php");
?>
</div>

            <script src="assets/JS/JQuery/update_query.js"></script>
