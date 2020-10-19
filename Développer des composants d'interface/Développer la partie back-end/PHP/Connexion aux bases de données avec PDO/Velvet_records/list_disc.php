<?php

include("process.php");
include("index.php");

$requete_card = $db->query("SELECT * FROM disc JOIN artist WHERE disc.artist_id = artist.artist_id");
$tableau_card = $requete_card->fetchAll(PDO::FETCH_OBJ);
$requete_card->closeCursor();

?>
<header>
        <div class="header-video container">
            <div class="video-section-list">
                <p class="h1">Liste des disques</p>
                    <video id="video-elem-list" preload autoplay loop muted>
                        <source src="./assets/video/Turntable.mp4" type="video/mp4">
                    </video>
            </div>
        </div>
</header>

    <body>
    <div id="list_disc">
        <div class="container">
            <br>
            <div class="row justify-content-center">
            <a href="add_disc.php"><button type="button" class="btn btn-success">Ajouter un disque</button></a>
            </div>
        <div class="row d-flex justify-content-center mt-5">
            <?php
                foreach($tableau_card as $disc)
                {
            ?>
            <div class="card text-center mb-2 ml-2">
                <div class="card-header">
                    <img src="./assets/pictures/<?= $disc->disc_picture?>" class="card-img-top" alt="Photo album">
                </div>
                <div class="card-body">
                    <h5 class="card-title"><?= $disc->disc_title ?></h5>
                        <h6 class="card-title"><?= $disc->artist_name ?></h6>
                            <p class="card-text text-truncate">Label&nbsp:&nbsp<?= $disc->disc_label ?></p>
                            <p class="card-text text-truncate">Year&nbsp:&nbsp<?= $disc->disc_year ?></p>
                            <p class="card-text text-truncate">Genre&nbsp:&nbsp<?= $disc->disc_genre ?></p>
                            <a href="details_disc.php?disc_id=<?= $disc->disc_id ?>" class="btn btn-info">Détails</a>
                </div>
            </div>
            <?php
            } 
            ?>
        </div>
    </div>
</div>
<?php
include("footer.php");
?>