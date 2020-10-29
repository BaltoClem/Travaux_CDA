<?php

include('process.php');

$userMail = $_POST['email'];

//Tentative de vérification d'un mot de passe déjà
//$userSearch = $db->prepare("SELECT * FROM users WHERE user_email=:user_email");
//$userSearch->bindValue(":user_email", $userMail,PDO::PARAM_STR);
//$userSearch->fetch(PDO::FETCH_OBJ);
//
//if(password_verify($_POST['password'], $userSearch->user_password)){};

$new_password = $db->prepare("UPDATE users SET user_password=:user_password WHERE user_email=:user_email");

$new_password->bindValue(':user_email', $userMail,PDO::PARAM_STR);

$password_hash = password_hash($_POST['password'], PASSWORD_DEFAULT);

if($_POST['password'] != $_POST['confPassword']){
    echo "Mots de passe différents";
    exit();
}
elseif(preg_match("/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/", ($_POST["password"])) && $_POST["password"] != ""){

    $new_password->bindValue(':user_password', $password_hash, PDO::PARAM_STR);
}
else{
    echo "Mot de passe manquant ou trop faible";
    exit();
}

$new_password->execute();
header('Refresh:2;url=index.php');