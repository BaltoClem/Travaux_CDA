<?php
if (isset($_POST['reg_id'])) {
    include '../bdd/connexion_bdd.php';
    $reg_id = $_POST['reg_id'];

    $query = 'SELECT * FROM `departements` WHERE `dep_reg_id` = :reg_id';
    $result = $pdo->prepare($query);
    $result->bindValue(':reg_id', $reg_id, PDO::PARAM_INT);
    $result->execute();
    $depList = $result->fetchAll();
    echo json_encode($depList);
} else {
    include 'bdd/connexion_bdd.php';

// affichage de la liste des régions
    $query = 'SELECT * FROM `regions`';
    $result = $pdo->query($query);
    $regionsList = $result->fetchAll(PDO::FETCH_OBJ);
}