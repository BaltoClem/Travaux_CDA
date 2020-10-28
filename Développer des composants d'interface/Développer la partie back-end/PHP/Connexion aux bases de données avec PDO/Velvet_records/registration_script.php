<?php

include("process.php");

$block = false;
$role = "user";

$new_user = $db->prepare("INSERT INTO users(user_email, user_password, user_role, user_block)
                                VALUES(:user_email, :user_password, :user_role, :user_block)");

$password_hash = password_hash($_POST['password'], PASSWORD_DEFAULT);

//Vérification d'un email déjà existant

$email = $_POST['email'];
$stmt = $db->prepare("SELECT * FROM users WHERE user_email=?");
$stmt->execute([$email]);
$user = $stmt->fetch();
    if ($user) {
        echo "L'adresse email existe déjà";
    }
    elseif($_POST['email'] ===""){
        echo "Adresse email manquante";
    }
    else{
    $new_user->bindValue(':user_email', $_POST['email'], PDO::PARAM_STR);
    }

//Comparaison de mots de passe et vérification de robustesse

    if($_POST['password'] != $_POST['confirmPassword']){
        echo "Mots de passe différents";

    }
    elseif(preg_match("/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/", ($_POST["password"])) && $_POST["password"] != ""){

        $new_user->bindValue(':user_password', $password_hash, PDO::PARAM_STR);
    }
    else{
        echo "Mot de passe manquant ou trop faible";
        exit();
    }

$new_user->bindValue(':user_block', $block, PDO::PARAM_BOOL);
$new_user->bindValue(':user_role', $role, PDO::PARAM_STR);

//Insertion du nouvel utilisateur
$new_user->execute();

header("Location:index.php");