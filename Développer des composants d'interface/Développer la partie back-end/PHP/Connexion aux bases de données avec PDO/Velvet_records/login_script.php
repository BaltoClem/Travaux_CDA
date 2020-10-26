<?php

include("process.php");

$email = $_POST['email'];
$password = $_POST['password'];

$user = $db->query("SELECT * FROM users WHERE user_email =".$email);
$user_detail = $user->fetch(PDO::FETCH_OBJ);
$user ->closeCursor();

$password_verify = password_verify($password, $user_detail->user_password);

if($password === $password_verify){
    $_SESSION["auth"] = "ok";
    echo "Utilisateur trouvé";
}