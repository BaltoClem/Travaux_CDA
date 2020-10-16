<?php

include("process.php");
include("index.php");

?>

<div id="list_disc">
    <div class="container">

    <video id="video-elem" preload autoplay loop muted>
               <source src="./assets/video/Turntable.mp4" type="video/mp4">
            </video>

        <h1>Liste des disques (15)</h1>

            <a href="./ajout_disc.php"><button type="button" class="btn btn-success">Ajouter</button></a>

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
                            <a href="" class="btn btn-primary">Détails</a>
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