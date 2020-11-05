<?php

include('process.php');

if (isset ($_POST['new_password_valid'])){

/////////////////////////////////////////////DECLARATION REGEX//////////////////////////////////////////////////////////

    $passwordPattern = "/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[-+!?$@%_])([-+!?$@%_\w]{8,15})$/";

///////////////////////////////////////////DECLARATION DE VARIABLES/////////////////////////////////////////////////////

    $userMail = $_POST['email'];
    $password_hash = password_hash($_POST['password'], PASSWORD_DEFAULT);

////////////////////////////////////////////TABLEAU ERREUR /////////////////////////////////////////////////////////////
    $formError = [];

///////////////////////////////////////////REQUETE PREPAREE/////////////////////////////////////////////////////////////

    $new_password = $db->prepare("UPDATE users SET user_password=:user_password WHERE user_email=:user_email");

/////////////////////////////////////////////////CONDITIONS DE VALIDATION///////////////////////////////////////////////

    //Si un input n'est pas rempli
    if(empty($_POST['password'])){
        $formError['input_missed'] = "input_m=true";
    }

    if(empty($_POST['confPassword'])) {
        $formError['input_missed_c'] = "input_mc=true";
    }

    //Si les mots de passe sont différents
    if($_POST['password'] != $_POST['confPassword']){
        $formError['pass_diff'] = "password_d=true";
    }

    //Si le mot de passe ne respecte pas la regex
    if(!preg_match("/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/", ($_POST["password"]))){
        $formError['pass_inv'] = "password_i=true";
    }
    else{
        $password_v = $password_hash;
    }

    if(count($formError) === 0) {
        $new_password->bindValue(':user_password', $password_v, PDO::PARAM_STR);
        $new_password->bindValue(':user_email', $userMail, PDO::PARAM_STR);
        $new_password->execute();
        header('Location:index.php');
    }
    else{
        $sUrl = implode("&", $formError);//On regroupe toutes les erreurs
        header("Location:new_password_form.php?".$sUrl);//On affiche les erreurs dans le formulaire add_form.php
        exit;
    }
}


