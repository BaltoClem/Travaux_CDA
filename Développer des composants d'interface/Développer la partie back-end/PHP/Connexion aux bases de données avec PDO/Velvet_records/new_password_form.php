<?php
include('header.php');

$userMail = $_GET['user_email'];
?>

<div class="container">
    <div class="row justify-content-center">
        <div class="h3">Nouveau mot de passe</div>
    </div>
    <form action="new_password_script.php" method="post" id="new_password_form">
        <div class="form-group">
            <label for="inputPassword">Nouveau mot de passe</label>
                <input type="password" class="form-control" id="inputPassword" aria-describedby="emailHelp" name="password">
                    <small class="form-text" id="alertpassword"></small>
                    <small id="emailHelp" class="form-text text-muted">Votre ancien mot de passe sera réinitialisé</small>
            <?php
            if(isset($_GET["input_m"]))
            {
                ?>
                <div class="alert alert-danger">Vous n'avez pas renseigné votre nouveau mot de passe</div>
                <?php
            }
            if(isset($_GET["password_d"]))
            {
                ?>
                <div class="alert alert-danger">Les mots de passe sont différents</div>
                <?php
            }
            elseif(isset($_GET["password_i"]))
            {
                ?>
                <div class="alert alert-danger">Mot de passe invalide</div>
                <?php
            }
            ?>
                        <input type="hidden" value="<?= $userMail ?>" name="email">
            <br>
            <label for="inputConfPassword">Confirmation du nouveau mot de passe</label>
                <input type="password" class="form-control" id="inputConfPassword" aria-describedby="emailHelp" name="confPassword">
                <small class="form-text" id="alertconfpassword"></small>
            <?php
            if(isset($_GET["input_mc"]))
            {
                ?>
                <div class="alert alert-danger">Vous n'avez pas confirmé votre nouveau mot de passe</div>
                <?php
            }
            if(isset($_GET["password_d"]))
            {
                ?>
                <div class="alert alert-danger">Les mots de passe sont différents</div>
                <?php
            }
            ?>
        </div>
        <div class="row justify-content-center">
        <button type="submit" class="btn btn-success" name="new_password_valid">Submit</button>
        </div>
    </form>
    <br>

<?php

include('footer.php');

?>

    <script src="assets/JS/JQuery/new_password.js"></script>
