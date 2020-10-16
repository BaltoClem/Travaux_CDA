<?php

include("index.php");

?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajout d'un disque</title>
</head>
<body>
    <div class="container">
    <h1>Ajouter un vinyle</h1>
    <form action="process.php" method="post">
        <span>Title</span>
        <input type="text" name="firstname" placeholder="Enter title">
        <p><input type="text" name="lastname" ></p>
        <p><input type="submit" name="insert" value="Insérer"></p>
    </form>
    </div>
</body>
</html>