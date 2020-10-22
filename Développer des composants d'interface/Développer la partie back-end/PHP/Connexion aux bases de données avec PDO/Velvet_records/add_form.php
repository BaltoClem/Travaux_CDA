<?php

include("header.php");
include("process.php");

$requete_add = $db->query("SELECT * 
                                    FROM artist");
$tableau_add = $requete_add->fetchAll(PDO::FETCH_OBJ);
$requete_add->closeCursor();

?>

<header>

    <div class="header-video container">
        <div class="video-section-add">
            <video id="video-elem-add" preload autoplay loop muted>
                <source src="./assets/video/Concert.mp4" type="video/mp4">
            </video>
        </div>
    </div>

</header>

<body>
    <div class="container">
        <div class="row justify-content-center">
            <h1>Ajout d'un vinyle</h1>
        </div>
        <form enctype="multipart/form-data" name="add_form" method="post" action="add_script.php">
            <div class="form-group">
                <label for="inputTitle">Title</label>
                    <input type="text" class="form-control" id="inputTitle" placeholder="Ajouter un titre" name="title">
            </div>
            <div class="form-group">
                <label for="inputArtist">Artist</label>
                    <select class="form-control" id="inputArtist" name="artist" required>
                        <option selected disabled> -- Choisir un artiste --</option>
                        <?php foreach($tableau_add as $artist)
                        {
                        ?>
                            <option value="<?= $artist->artist_id ?>"><?= $artist->artist_name ?></option>
                            <?php
                        }
                        ?>
                    </select>
            </div>
            <div class="form-group">
                <label for="inputYear">Year</label>
                    <input type="text" class="form-control" id="inputYear" placeholder="Ajouter l'année de parution" name="year">
            </div>
            <div class="form-group">
                <label for="inputGenre">Genre</label>
                    <input type="text" class="form-control" id="inputGenre" placeholder="Ajouter le genre du disque" name="genre" required>
            </div>
            <div class="form-group">
                <label for="inputLabel">Label</label>
                    <input type="text" class="form-control" id="inputLabel" placeholder="Ajouter le label" name="label">
            </div>
            <div class="form-group">
                <label for="inputPrice">Price</label>
                    <input type="number" step="any" class="form-control" id="inputPrice" placeholder="Ajouter le prix" name="price" required>
            </div>
            <div class="form-group">
                <label for="inputFile">Picture</label>
                    <input type="file" class="form-control-file" id="inputFile" name="userfile" required>
            </div>
            <div class="row justify-content-center">
                <button type="submit" class="btn btn-success" name="valid_add">Valider l'ajout</button>
                <a href="index.php"><button type="button" class="btn btn-secondary ml-4">Retour</button></a>
            </div>
            <br>
        </form>
    </div>
<?php
include("footer.php");
?>