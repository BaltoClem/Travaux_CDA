<?php

include("process.php");

//Vérification d'un email déjà existant

$email = $_POST['email'];
$stmt = $db->prepare("SELECT * FROM users WHERE user_email=?");
$stmt->execute([$email]);
$user = $stmt->fetch();
if ($user) {
    echo "L'adresse email existe déjà";
    exit();
}

//Comparaison de mots de passe et vérification de robustesse

if($_POST['password'] != $_POST['confirmPassword']){
    echo "Mots de passe différents";
    exit();
}
elseif(!preg_match("/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/", ($_POST["password"]))){
    echo "Mot de passe trop faible";
    exit();
}

//Insertion du nouvel utilisateur

$new_user = $db->prepare("INSERT INTO users(user_email, user_password)
                                VALUES(:user_email, :user_password)");

$password_hash = password_hash($_POST['password'], PASSWORD_DEFAULT);

$new_user->bindValue(':user_email', $_POST['email'], PDO::PARAM_STR);
$new_user->bindValue(':user_password', $password_hash, PDO::PARAM_STR);

$new_user->execute();

header("Location:index.php");