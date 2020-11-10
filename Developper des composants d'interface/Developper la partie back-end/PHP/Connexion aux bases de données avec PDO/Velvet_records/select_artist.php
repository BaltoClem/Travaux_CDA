<?php
include("process.php");

$requete_add = $db->query("SELECT * 
                                    FROM artist");
$tableau_add = $requete_add->fetchAll(PDO::FETCH_OBJ);
$requete_add->closeCursor();
