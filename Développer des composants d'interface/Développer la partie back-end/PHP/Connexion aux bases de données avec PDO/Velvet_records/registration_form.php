<?php

include('header.php');

?>

<div class="container">
    <div class="row justify-content-center">
        <div class="h3">Registration</div>
    </div>
    <form action="registration_script.php" method="post" id="form_registr">
        <div class="form-group">
            <label for="inputEmail">Email address</label>
            <input type="email" class="form-control" id="inputEmail" aria-describedby="emailHelp" name="email">
            <small class="form-text" id="alertemail"></small>
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            <?php
            if(isset($_GET["Emaile"]))
            {
                ?>
                <div class="alert alert-danger">L'adresse email existe déjà</div>
                <?php
            }
            elseif(isset($_GET["Emailm"]))
            {
                ?>
                <div class="alert alert-danger">Vous n'avez pas renseigné votre adresse email</div>
                <?php
            }
            ?>
        </div>
        <div class="form-group">
            <label for="inputPassword">Password</label>
            <input type="password" class="form-control" id="inputPassword" name="password">
            <small class="form-text" id="alertpassword"></small>
            <?php
            if(isset($_GET["passwordD"]))
            {
                ?>
                <div class="alert alert-danger">Mots de passe différents</div>
                <?php
            }
            elseif(isset($_GET["passwordW"]))
            {
                ?>
                <div class="alert alert-danger">Mot de passe manquant ou trop faible</div>
                <?php
            }
            ?>
        </div>
        <div class="form-group">
            <label for="inputConfPassword">Confirm Password</label>
            <input type="password" class="form-control" id="inputConfPassword" name="confirmPassword">
            <small class="form-text" id="alertconfpassword"></small>
            <?php
            if(isset($_GET["passwordD"]))
            {
            ?>
            <div class="alert alert-danger">Mots de passe différents</div>
            <?php
            }
            ?>
        </div>
        <div class="row justify-content-center">
        <button type="submit" class="btn btn-success" id="registr_button" name="valid_registr">S'inscrire</button>
        </div>
    </form>
    <br>

    <?php

    include('footer.php');

    ?>

    <script src="assets/JS/JQuery/registration_query.js"></script>
