<?php

include('header.php');

?>

<div class="container">
<?php
if(isset($_GET["block"]))
{
    ?>
    <div class="alert alert-danger">Votre compte est bloqué</div>
    <?php
}
if(isset($_GET["wrong"]))
{
    ?>
    <div class="alert alert-danger">L'identifiant ou le mot de passe sont incorrects</div>
    <?php
}
if(isset($_GET["tries"]))
{
    ?>
    <div class="alert alert-danger">Nombres d'essais trop importants, votre compte a été bloqué</div>
    <?php
}
?>
    <div class="row justify-content-center">
        <div class="h3">Authentification</div>
    </div>
    <form action="login_script.php" method="post">
        <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
            <small class="form-text" id="alertemail"></small>
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            <?php
            if(isset($_GET["empty"]))
            {
                ?>
                <div class="alert alert-danger">Vous n'avez pas renseigné votre adresse email</div>
                <?php
            }
            elseif(isset($_GET["exist"]))
            {
                ?>
                <div class="alert alert-danger">Ce compte n'existe pas, veuillez vous créer un compte</div>
                <?php
            }
            ?>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input type="password" class="form-control" id="exampleInputPassword1" name="password">
            <small class="form-text" id="alertpassword"></small>
            <?php
            if(isset($_GET["empty"]))
            {
                ?>
                <div class="alert alert-danger">Vous n'avez pas renseigné votre mot de passe</div>
                <?php
            }
            ?>
        </div>
        <div class="form-group">
            <p>Pas encore inscrit ? <a href="registration_form.php">Inscrivez-vous</a></p>
            <p>Mot de passe oublié ? <a href="forgot_password_form.php">Cliquez&nbsp;ici</a></p>
        </div>
        <div class="row justify-content-center">
        <button type="submit" class="btn btn-success" name="valid_login">Submit</button>
        </div>
    </form>
    <br>
<?php

include('footer.php');

?>