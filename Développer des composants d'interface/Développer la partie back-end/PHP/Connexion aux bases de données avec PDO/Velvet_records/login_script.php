<?php

session_start();
include("process.php");

$email = $_POST['email'];

$pdoStat= $db->prepare("SELECT * FROM users WHERE user_email = :user_email");
$pdoStat->bindValue(':user_email', $email, PDO::PARAM_STR);
$pdoStat -> execute();

$user = $pdoStat ->fetch(PDO::FETCH_OBJ);

if(password_verify($_POST['password'], $user->user_password)){
    $_SESSION["auth"] = "ok";
    echo "Utilisateur trouvé !";
    var_dump($_SESSION["auth"]);
    echo"- session ID : ".session_id();
    header("Refresh:5;url=index.php");
}
else{
    echo "Erreur : l'identifiant ou le mot de passe sont incorrects !";

        if(!isset($_SESSION['essai'])){
            $_SESSION['essai'] = 1;
        }
        else{
            $_SESSION['essai'] ++;
            var_dump($_SESSION['essai']);
                if($_SESSION['essai'] === 4){
                    echo "Nombre d'essais trop important";
                }
        }

}

//unset($_SESSION["auth"]);
//if (ini_get("session.use_cookies"))
//{
//    setcookie(session_name(), '', time()-42000);
//}
//session_destroy();
//echo "Erreur";