<?php
    $db = new PDO('mysql:host=localhost;charset=utf8;dbname=record', 'root', '');
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $requete = $db->prepare("select * from disc where disc_id=?");
    $requete->execute(array($_GET["disc_id"]));
    $disc = $requete->fetch(PDO::FETCH_OBJ);

        if(isset($disc->disc_id)){}
        else{
            echo "Disque inconnu";
            exit;
        };
?>

<html>
<head>
    <meta charset="UTF-8">
    <title>Test PDO</title>
</head>
<html>
<body>
    Disc N° <?= $disc->disc_id ?>
    <br>
    Disc name <?= $disc->disc_title ?>
    <br>
    Disc year <?= $disc->disc_year ?>
</body>
</html>