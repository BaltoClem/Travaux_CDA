<?php

include("process.php");

$email = $_POST['email'];
$password = $_POST['password'];

$pdoStat= $db->prepare("SELECT * FROM users WHERE user_email =".$email);

$password_verify = password_verify($password, $user_detail->user_password);

if($password === $password_verify){
    $_SESSION["auth"] = "ok";
    echo "Utilisateur trouvé";
}