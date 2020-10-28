<?php
include("process.php");

session_start();

$email = $_POST['email'];

$pdoStat= $db->prepare("SELECT * FROM users WHERE user_email = :user_email");
$pdoStat->bindValue(':user_email', $email, PDO::PARAM_STR);
$pdoStat -> execute();

$user = $pdoStat ->fetch(PDO::FETCH_OBJ);

if(password_verify($_POST['password'], $user->user_password)){
    $_SESSION["auth"] = "ok";
    echo "Utilisateur trouvé !";
    echo"- session ID : ".session_id();
    $_SESSION["id"] = $email;
    var_dump($_SESSION["id"]);
//    $_SESSION["nom"] = $nom;
//    $_SESSION["prenom"] = $prenom;
    header("Refresh:5;url=index.php");
}
elseif(empty($user)){
    echo "Compte non existant";
    header("Refresh:5;url=login_form.php");
    exit();
}
else{
    echo "Erreur : l'identifiant et/ou le mot de passe sont incorrects !";

        if(!isset($_SESSION['essai'])){
            $_SESSION['essai'] = 1;
        }
        else{
            $_SESSION['essai'] ++;
            var_dump($_SESSION['essai']);
                if($_SESSION['essai'] > 3){
                    echo "Nombre d'essais trop important";
                    $user_block = $db->prepare("UPDATE users
                                                        SET user_block= :user_block
                                                        WHERE user_email=:user_email");
                    $user_block->bindValue(':user_email', $email, PDO::PARAM_STR);
                    $user_block->bindValue(':user_block', true, PDO::PARAM_BOOL);
                    $user_block->execute();

                    echo "Compte bloqué";
                }
        }
//    unset($_SESSION["auth"]);
//    if (ini_get("session.use_cookies"))
//    {
//        setcookie(session_name(), '', time()-42000);
//    }
//    session_destroy();

}
