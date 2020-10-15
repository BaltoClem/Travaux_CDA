<?php

include("connexion.php");
include("index.php");
?>

<body>
<div class="container">
    <div class="row">
    <div class="card-columns">

            <?php foreach($tableau as $disc){?>

            <div class="card text-center mb-2 ml-2 mr-2">
                <img src="./assets/pictures/<?= $disc->disc_picture?>" class="card-img-top" alt="..." style="width:350px;">
                    <div class="card-body">
                        <h5 class="card-title"><?= $disc->disc_title ?></h5>
                        <h6 class="card-text"><?= $disc->artist_name ?></h6>
                        <p class="card-text">Label&nbsp:&nbsp<?= $disc->disc_label ?></p>
                        <p class="card-text">Year&nbsp:&nbsp<?= $disc->disc_year ?></p>
                        <p class="card-text">Genre&nbsp:&nbsp<?= $disc->disc_genre ?></p>
                    </div>
            </div>

            <?php } ?>
            </div>
    </div> 
</div>

<?php include("footer.php") ?>

</body>
</html>