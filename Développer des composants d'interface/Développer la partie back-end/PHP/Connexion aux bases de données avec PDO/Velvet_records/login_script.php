<?php
include("process.php");

session_start();

//On récupère l'email de l'utilisateur qui se connecte
$email = $_POST['email'];
$password = $_POST['password'];

//Requête préparée pour rechercher l'utilisateur correspondant à l'email renseigné
$pdoStat= $db->prepare("SELECT * FROM users WHERE user_email = :user_email");
$pdoStat->bindValue(':user_email', $email, PDO::PARAM_STR);
$pdoStat -> execute();

$user = $pdoStat ->fetch(PDO::FETCH_OBJ);

// Si les champs sont vides
if($email === "" || $password ===""){
            echo "Veuillez renseigner votre email et/ou votre mot de passe";
            exit();
        }
    //Si l'utilisateur n'a pas de compte, donc si le fetch ne retourne rien
    elseif(empty($user)){
        echo "Compte non existant";
        header("Refresh:5;url=login_form.php");
        exit();
            }
        //Si l'utilisateur a le booléen fixé à 1(true)
        elseif($user->user_block === "1"){
            echo "Votre compte est bloqué, veuillez vous réinscrire";
            exit();
                }
            //Si le mot de passe est identique à la confirmation de mot de passe
            elseif(password_verify($password, $user->user_password)){
            $_SESSION["auth"] = "ok";
            echo "Utilisateur trouvé !";
            echo"- session ID : ".session_id();
            $_SESSION["id"] = $email;
            var_dump($_SESSION["id"]);
//            $_SESSION["nom"] = $nom;
//            $_SESSION["prenom"] = $prenom;
            header("Refresh:5;url=index.php");
                    }

//Alors : Message d'alerte
else{
    echo "Erreur : l'identifiant et/ou le mot de passe sont incorrects !";
        //Si aucune session nommée "essai" n'existe
        if(!isset($_SESSION['essai'])){
            $_SESSION['essai'] = 1;
        }
            //Si la session "essai" existe déjà
            else{
                $_SESSION['essai'] ++;
                var_dump($_SESSION['essai']);
                //Si la valeur de la session est supérieure à 3
                    if($_SESSION['essai'] > 3){
                        echo "Nombre d'essais trop important";
                        $user_block = $db->prepare("UPDATE users
                                                            SET user_block= :user_block
                                                            WHERE user_email=:user_email");
                        $user_block->bindValue(':user_email', $email, PDO::PARAM_STR);
                        $user_block->bindValue(':user_block', true, PDO::PARAM_BOOL);
                        $user_block->execute();
                        echo "Compte bloqué";
                        unset($_SESSION["essai"]);
                            if (ini_get("session.use_cookies"))
                            {
                                setcookie(session_name(), '', time()-42000);
                            }
                            session_destroy();

                    }
            }
}
