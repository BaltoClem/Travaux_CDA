<?php
    $user = 'root';
    $pass = '';

    try {
        $db = new PDO('mysql:host=localhost;dbname=mydb', $user, $pass);
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage() . "<br/>";
        die();
    }
