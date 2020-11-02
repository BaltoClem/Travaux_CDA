<?php

include('header.php');

?>

<div class="container">
    <div class="row justify-content-center">
        <div class="h3">Registration</div>
    </div>
    <form action="registration_script.php" method="post">
        <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input type="password" class="form-control" id="exampleInputPassword1" name="password">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword2">Confirm Password</label>
            <input type="password" class="form-control" id="exampleInputPassword2" name="confirmPassword">
        </div>
        <button type="submit" class="btn btn-success" id="registr_button">Submit</button>
    </form>
    <br>

    <?php

    include('footer.php');

    ?>

    <script src="assets/JS/JQuery/registration_query.js"></script>
