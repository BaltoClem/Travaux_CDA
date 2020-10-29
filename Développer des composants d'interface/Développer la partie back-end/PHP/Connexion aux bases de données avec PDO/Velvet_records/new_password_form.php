<?php
include('header.php');

$userMail = $_GET['user_email'];
?>

<div class="container">
    <div class="row justify-content-center">
        <div class="h3">Nouveau mot de passe</div>
    </div>
    <form action="new_password_script.php" method="post">
        <div class="form-group">
            <label for="exampleInputEmail1">Nouveau mot de passe</label>
                <input type="password" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="password">
                    <small id="emailHelp" class="form-text text-muted">Votre ancien mot de passe sera réinitialisé</small>
                        <input type="hidden" value="<?= $userMail ?>" name="email">
            <br>
            <label for="exampleInputEmail2">Confirmation du nouveau mot de passe</label>
                <input type="password" class="form-control" id="exampleInputEmail2" aria-describedby="emailHelp" name="confPassword">
        </div>
        <div class="row justify-content-center">
        <button type="submit" class="btn btn-success">Submit</button>
        </div>
    </form>
    <br>

<?php

include('footer.php');

?>
