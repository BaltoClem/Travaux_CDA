<?php

include("process.php");
include("header.php");

$requete_card = $db->query("SELECT * 
                                    FROM disc 
                                    JOIN artist 
                                    ON disc.artist_id = artist.artist_id");
$tableau_card = $requete_card->fetchAll(PDO::FETCH_OBJ);
$requete_card->closeCursor();

$requete_nb_disc = $db->query("SELECT COUNT(disc_id) AS nb_disc FROM disc");
$result_nb_disc = $requete_nb_disc->fetch(PDO::FETCH_OBJ);
$requete_nb_disc->closeCursor();
$nb_disc = $result_nb_disc->nb_disc;

$requete_last_disc = $db->query("SELECT disc_title AS nom_disc, disc_id, disc_picture AS img_album FROM disc ORDER BY disc_id DESC LIMIT 5");
$result_last_disc = $requete_last_disc->fetchAll(PDO::FETCH_OBJ);
$requete_last_disc->closeCursor();

?>
    <div id="list_disc">
    <div class="container">
        <?php include("navbar.php");?>

<header>
            <div class="video-section-list">
                <div class="row justify-content-left">
                <p class="h1">Liste des disques&nbsp(<?php echo $nb_disc ?>)</p>
                </div>
                    <video id="video-elem-list" preload autoplay loop muted>
                        <source src="./assets/video/Turntable.mp4" type="video/mp4">
                    </video>
            </div>
</header>

    <body>
            <br>
            <div class="row justify-content-center">
            <a href="add_form.php"><button type="button" class="btn btn-success">Ajouter un disque</button></a>
            </div>
            <br>
            <div class="row justify-content-center">
            <p>Récemment ajoutés&nbsp:&nbsp</p>
                <ul class="list-group striped-list">
                    <?php foreach($result_last_disc as $last_disc){?>
                        <li class="list-group-item">
                            <img src="assets/pictures/<?= $last_disc -> img_album?>" alt="album" class="thumbnail">&nbsp<?= $last_disc -> nom_disc?> &nbsp
                        </li>
                    <?php } ?>
                </ul>
            </div>

        <div class="row d-flex justify-content-center mt-5 col-lg-12">
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
                            <a href="details.php?disc_id=<?= $disc->disc_id ?>" class="btn btn-info">Détails</a>
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