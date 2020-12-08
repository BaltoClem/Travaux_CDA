<?php
//déclaration des variables

$host = 'localhost';
$dbName = 'ajax_regions';
$login = 'root';
$password = '';



try {
    $pdo = new PDO('mysql:host=' . $host . ';dbname=' . $dbName . ';charset=UTF8;', $login, $password);
} catch (Exception $ex) {
    $message = 'Erreur P.D.O dans ' . $ex->getFile() . ' ligne ' . $ex->getLine() . ' : ' . $ex->getMessage();
    die($message);
}
