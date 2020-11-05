<?php
include('header.php');
?>

<div class="container">
    <div class="row justify-content-center">
        <div class="h3">Mot de passe oublié</div>
    </div>
    <form action="forgot_password_script.php" method="post" id="forgot_form">
        <div class="form-group">
            <label for="inputEmail">Email address</label>
            <input type="email" class="form-control" id="inputEmail" aria-describedby="emailHelp" name="email">
            <small class="form-text" id="alertemail"></small>
            <small id="emailHelp" class="form-text text-muted">Nous vous enverrons un email avec un lien de récupération
                du mot de passe</small>
            <?php
            if (isset($_GET["email_m"]))
            {
                ?>
                <div class="alert alert-danger">Vous n'avez pas renseigné votre adresse email</div>
                <?php
            }
            if (isset($_GET["user_m"]))
            {
                ?>
                <div class="alert alert-danger">Ce compte n'existe pas</div>
                <?php
            }
            ?>
        </div>
        <div class="row justify-content-center">
        <button type="submit" class="btn btn-success" name="forgot_valid">Submit</button>
        </div>
    </form>
    <br>

<?php

include('footer.php');

?>
    <script src="assets/JS/JQuery/forgot.js"></script>
