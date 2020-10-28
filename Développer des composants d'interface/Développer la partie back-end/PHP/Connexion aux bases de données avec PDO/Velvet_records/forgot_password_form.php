<?php
include('process.php');
include('header.php');
?>

<div class="container">
    <div class="row justify-content-center">
        <div class="h3">Mot de passe oublié</div>
    </div>
    <form action="forgot_password_script.php" method="post">
        <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
            <small id="emailHelp" class="form-text text-muted">Nous vous enverrons un email avec un lien de récupération du mot de passe</small>
        </div>
        <div class="row justify-content-center">
        <button type="submit" class="btn btn-success">Submit</button>
        </div>
    </form>
    <br>

<?php

include('footer.php');

?>
