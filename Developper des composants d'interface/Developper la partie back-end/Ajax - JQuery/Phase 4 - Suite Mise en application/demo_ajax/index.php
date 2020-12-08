<?php
include 'controller/indexController.php';
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Demo Ajax</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="row mt-5">
        <div class="col-sm-3 offset-sm-3">
            <label for="regions">Regions :</label>
            <select class="form-select" aria-label="Default select example" id="regions">
                <?php
                foreach ($regionsList as $regions) {
                    ?>
                    <option value="<?= $regions->reg_id ?>"><?= $regions->reg_v_nom ?></option>
                <?php
                }
                ?>
            </select>
        </div>
        <div class="col-sm-3">
            <label for="departements">Départements :</label>
            <select class="form-select" aria-label="Default select example" id="departements">

            </select>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
<script src="assets/js/script.js"></script>
</body>
</html>