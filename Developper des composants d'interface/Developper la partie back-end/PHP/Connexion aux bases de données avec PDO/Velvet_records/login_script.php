<?php
include("process.php");

session_start();

if (isset($_POST['valid_login'])) {

/////////////////////////////////////////////DECLARATION REGEX//////////////////////////////////////////////////////////

    $passwordPattern = "/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[-+!?$@%_])([-+!?$@%_\w]{8,15})$/";

///////////////////////////////////////////DECLARATION DE VARIABLES/////////////////////////////////////////////////////

//On récupère l'email de l'utilisateur qui se connecte
    $email = $_POST['email'];
    $password = $_POST['password'];

////////////////////////////////////////////////////TABLEAU D'ERREURS///////////////////////////////////////////////////

    $formError = [];

/////////////////////////////////////////////////REQUETES PREPAREES ////////////////////////////////////////////////////

//Requête préparée pour rechercher l'utilisateur correspondant à l'email renseigné
    $pdoStat = $db->prepare("SELECT * FROM users WHERE user_email = :user_email");
    $pdoStat->bindValue(':user_email', $email, PDO::PARAM_STR);
    $pdoStat->execute();
    $user = $pdoStat->fetch(PDO::FETCH_OBJ);

//Requête préparée pour éventuellement bloquer l'utilisateur
    $user_block = $db->prepare("UPDATE users
                                    SET user_block= :user_block
                                    WHERE user_email=:user_email");

/////////////////////////////////////////////////CONDITIONS DE VALIDATION///////////////////////////////////////////////

// Si les champs sont vides
    if (empty($email) || empty($password)) {
        $formError['inputEmpty'] = "empty=true";
    }
    //Si l'utilisateur n'a pas de compte, donc si le fetch ne retourne rien
        elseif (empty($user)) {
            $formError['inputExists'] = "exist=true";
        } //Si l'utilisateur a le booléen fixé à 1(true)
            elseif ($user->user_block === "1") {
                $formError['inputBlock'] = "block=true";
            }
                //Si l'utilisateur a un mot de passe trop faible
                elseif (!preg_match($passwordPattern,$password)) {
                    $formError['PassWrong'] = "pwrong=true";
                }
                    //Si le mot de passe est identique à la confirmation de mot de passe
                    elseif (password_verify($password, $user->user_password)) {
                        $_SESSION["auth"] = "ok";
                        $_SESSION["id"] = $email;
                        header("Location:index.php");
                    }
    //Alors : Message d'alerte
    else {
        //echo "Erreur : l'identifiant et/ou le mot de passe sont incorrects !";
        $formError['PassOrEmail'] = "wrong=true";

        //Si aucune session nommée "essai" n'existe
        if (!isset($_SESSION['essai'])) {
            $_SESSION['essai'] = 1;
        } //Si la session "essai" existe déjà
        else {
            $_SESSION['essai']++;

            //Si la valeur de la session est supérieure à 3
            if ($_SESSION['essai'] > 3) {
                $formError['Tries'] = "tries=true";

                //On bloque définitivement l'utilisateur avec l'exécution de la requête préparée
                $user_block->bindValue(':user_email', $email, PDO::PARAM_STR);
                $user_block->bindValue(':user_block', true, PDO::PARAM_BOOL);
                $user_block->execute();

                //Réinitialisation de la session essai
                unset($_SESSION["essai"]);
                if (ini_get("session.use_cookies")) {
                    setcookie(session_name(), '', time() - 42000);
                }
                session_destroy();
                header("Location:index.php");
            }
        }
    }
    if (count($formError) !== 0) {
        $sUrl = implode("&", $formError);//On regroupe toutes les erreurs
        header("Location:login_form.php?" . $sUrl);//On affiche les erreurs dans le formulaire add_form.php
        exit;
    }
}