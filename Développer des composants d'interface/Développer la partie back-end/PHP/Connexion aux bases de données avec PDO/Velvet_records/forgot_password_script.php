<?php
include("process.php");

$email = $_POST['email'];

$pdoStat= $db->prepare("SELECT * FROM users WHERE user_email = :user_email");
$pdoStat->bindValue(':user_email', $email, PDO::PARAM_STR);
$pdoStat -> execute();

$user = $pdoStat ->fetch(PDO::FETCH_OBJ);

if(empty($user)){
    echo "Compte non existant";
    header("Refresh:5;url=login_form.php");
    exit();
}
else{

    $to = $user->user_email;
    $subject = 'Réinitialisation de mot de passe';
    $message = 'Voici le lien pour réinitialiser votre mot de passe';
    $headers = array(
        'From' => 'webmaster@example.com',
        'Reply-To' => 'webmaster@example.com',
        'X-Mailer' => 'PHP/' . phpversion()
    );

    mail($to, $subject, $message, $headers);

}
