<?php

include('header.php');
include('select_artist.php');

?>

<header>

    <div class="header-video container">
        <div class="video-section-add">
            <video id="video-elem-add" preload autoplay loop muted>
                <source src="assets/video/Concert.mp4" type="video/mp4">
            </video>
        </div>
    </div>

</header>

<body>
    <div class="container">
        <div class="row justify-content-center">
            <p class="h1">Ajout d'un vinyle</p>
        </div>
        <form enctype="multipart/form-data" name="add_form" method="post" action="add_script.php" id="form">
            <div class="form-group">
                <label for="inputTitle">Title</label>
                    <input type="text" class="form-control" id="inputTitle" placeholder="Ajouter un titre" name="title">
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
            <div class="form-group">
                <label for="inputArtist">Artist</label>
                    <select class="form-control" id="inputArtist" name="artist">
                        <option selected disabled> -- Choisir un artiste --</option>
                        <?php foreach($tableau_add as $artist)
                        {
                        ?>
                            <option value="<?= $artist->artist_id ?>"><?= $artist->artist_name ?></option>
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
            <div class="form-group">
                <label for="inputYear">Year</label>
                    <input type="text" class="form-control" id="inputYear" placeholder="Ajouter l'année de parution" name="year">
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
            <div class="form-group">
                <label for="inputGenre">Genre</label>
                    <input type="text" class="form-control" id="inputGenre" placeholder="Ajouter le genre du disque" name="genre">
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
            <div class="form-group">
                <label for="inputLabel">Label</label>
                    <input type="text" class="form-control" id="inputLabel" placeholder="Ajouter le label" name="label">
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
            <div class="form-group">
                <label for="inputPrice">Price(&nbsp;&euro;&nbsp;)</label>
                    <input type="number" step="any" class="form-control" id="inputPrice" placeholder="Ajouter le prix" name="price" >
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
            <div class="form-group">
                <label for="inputFile">Picture</label>
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
            <div class="row justify-content-center">
                <input type="submit" class="btn btn-success" name="valid_add" id="add_button" value="Valider">
                <a href="index.php"><button type="button" class="btn btn-secondary ml-4">Retour</button></a>
            </div>
            <br>
        </form>
    </div>

    <div class="container">
<?php
include("footer.php");
?>
        <script src="assets/JS/JQuery/add_query.js"></script>
