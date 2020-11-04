<?php

include("process.php");

if (isset($_POST['valid_registr'])){

/////////////////////////////////////////////DECLARATION REGEX//////////////////////////////////////////////////////////

    $passwordPattern = "/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/";

/////////////////////////////////////////////DECLARATION VARIABLES//////////////////////////////////////////////////////////

    $email = $_POST['email'];
    $block = false;
    $role = "user";
    $password_hash = password_hash($_POST['password'], PASSWORD_DEFAULT);

////////////////////////////////////////////TABLEAU ERREUR /////////////////////////////////////////////////////////////

    $formError = [];

///////////////////////////////////////////REQUETES PREPAREES/////////////////////////////////////////////////////////////

    /*Requête d'insertion nouvel utilisateur*/
$new_user = $db->prepare("INSERT INTO users(user_email, user_password, user_role, user_block)
                                VALUES(:user_email, :user_password, :user_role, :user_block)");

    /* Requête de recherche d'un utilisateur déjà existant */
$stmt = $db->prepare("SELECT * FROM users WHERE user_email=?");
$stmt->execute([$email]);
$user = $stmt->fetch();

/////////////////////////////////////////////// CONDITIONS D'INSERTION /////////////////////////////////////////////////

//Vérification d'un email déjà existant

    if ($user) {
        $formError['emailExists'] = "Emaile=true";
    }
    elseif(empty($_POST['email'])){
        $formError['emailEmpty'] = "Emailm=true";
    }

//Comparaison de mots de passe et vérification de robustesse

    if($_POST['password'] != $_POST['confirmPassword']){
        $formError['password'] = "passwordD=true";
    }
    elseif(!preg_match($passwordPattern, ($_POST["password"])) || empty($_POST["password"])){
        $formError['password'] = "passwordW=true";
    }
    else{
        $password = $password_hash;
    }

if(count($formError) === 0) {
    $new_user->bindValue(':user_email', $email, PDO::PARAM_STR);
    $new_user->bindValue(':user_password', $password, PDO::PARAM_STR);
    $new_user->bindValue(':user_block', $block, PDO::PARAM_BOOL);
    $new_user->bindValue(':user_role', $role, PDO::PARAM_STR);

//Insertion du nouvel utilisateur
    $new_user->execute();
    header("Location:index.php");
}else{
$sUrl = implode("&", $formError);//On regroupe toutes les erreurs
header("Location:registration_form.php?".$sUrl);//On affiche les erreurs dans le formulaire add_form.php
exit;
}
}