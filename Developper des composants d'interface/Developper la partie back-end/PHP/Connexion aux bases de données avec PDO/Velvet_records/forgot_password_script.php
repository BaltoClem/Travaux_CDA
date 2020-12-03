<?php
include("process.php");

if (isset($_POST['forgot_valid'])) {

///////////////////////////////////////////DECLARATION DE VARIABLES/////////////////////////////////////////////////////

    $email = $_POST['email'];

////////////////////////////////////////////////////TABLEAU D'ERREURS///////////////////////////////////////////////////

    $formError = [];

/////////////////////////////////////////////////REQUETES PREPAREES ////////////////////////////////////////////////////

    $pdoStat = $db->prepare("SELECT * FROM utilisateur WHERE user_email = :user_email");
    $pdoStat->bindValue(':user_email', $email, PDO::PARAM_STR);
    $pdoStat->execute();

    $user = $pdoStat->fetch(PDO::FETCH_OBJ);

    $userMail = $user->user_email;

/////////////////////////////////////////////////CONDITIONS DE VALIDATION///////////////////////////////////////////////
    if (empty($email)) {
        $formError['Email_missed'] = "email_m=true";
        }
    elseif (empty($user)) {
        $formError['user_missed'] = "user_m=true";
        }
    else
        {

        $to = $userMail;
        $subject = 'Réinitialisation de mot de passe';
        $message = '<!DOCTYPE html>
            <html lang="fr">
            <head>
            <meta charset="utf-8">
            <title>Réinitialisation du mot de passe</title>   
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
            <style>
                html 
                    {
                    font-size: 100%;
                    }

                body 
                    {
                    font-size: 1rem; /* Si html fixé à 100%, 1rem = 16px = taille par défaut de police de Firefox ou Chrome */
                    }
            </style>  
            </head>
            <body>
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <h1>Réinitialisation du mot de passe</h1>
                        </div>    
                    </div>   
                    <div class="row">
                        <div class="col-12">
                            <p>Voici le lien pour réinitialiser votre mot de passe :</p>
                            <a href="http://localhost:81/PHP/Connexion%20aux%20bases%20de%20donn%c3%a9es%20avec%20PDO/Velvet_records/new_password_form.php?user_email=' . $userMail . '">Cliquez&nbsp;ici</a>
                            
                        </div>    
                    </div>   
                    <div class="row">
                        <div class="col-12">
                            <img src="http://localhost:81/PHP/Connexion%20aux%20bases%20de%20donn%c3%a9es%20avec%20PDO/Velvet_records/assets/pictures/aladdin-sane-10large.jpg" title="Logo" alt="Logo" class="img-fluid">
                        </div>    
                    </div>   
                </div> 
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
                </body>
                </html>';
        $headers = array(
            'MIME-Version' => '1.0',
            'Content-Type' => 'text/html; image/jpg; charset=utf-8',
            'From' => 'webmaster@example.com',
            'Reply-To' => 'webmaster@example.com',
            'X-Mailer' => 'PHP/' . phpversion()
        );

        mail($to, $subject, $message, $headers);

        header('Location:index.php');
    }

    if($formError !== 0){
        $sUrl = implode("&", $formError);//On regroupe toutes les erreurs
        header("Location:forgot_password_form.php?" . $sUrl);//On affiche les erreurs dans le formulaire add_form.php
        exit;
    }
}
