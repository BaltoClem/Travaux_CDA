<?php
include('header.php');
?>

<div class="container">
    <div class="row justify-content-center">
        <div class="h3">Nouveau mot de passe</div>
    </div>
    <form action="new_password_script.php" method="post">
        <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <input type="password" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="password">
            <small id="emailHelp" class="form-text text-muted">Votre nouveau mot de passe sera initialisé</small>
        </div>
        <div class="row justify-content-center">
        <button type="submit" class="btn btn-success">Submit</button>
        </div>
    </form>
    <br>

<?php

include('footer.php');

?>
