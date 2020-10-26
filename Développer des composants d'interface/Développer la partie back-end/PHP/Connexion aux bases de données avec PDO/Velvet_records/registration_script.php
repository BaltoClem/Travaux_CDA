<?php

include("process.php");

$pdoStat = $db->prepare("INSERT INTO users(user_email, user_password)
                                VALUES(:user_email, :user_password)");

$password_hash = password_hash($_POST['password'], PASSWORD_DEFAULT);

$pdoStat->bindValue(':user_email', $_POST['email'], PDO::PARAM_STR);
$pdoStat->bindValue(':user_password', $password_hash, PDO::PARAM_STR);

if($_POST['password'] != $_POST['confirmPassword']){
    exit();
}
$pdoStat->execute();

header("Location:index.php");