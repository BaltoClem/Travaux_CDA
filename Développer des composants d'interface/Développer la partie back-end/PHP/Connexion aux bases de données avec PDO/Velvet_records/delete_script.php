<?php
include("process.php");

$discId = $_GET["disc_id"];

$pdoStat = $db->prepare("DELETE FROM disc WHERE disc.disc_id =:disc_id");
$pdoStat->bindValue(':disc_id', $_GET["disc_id"], PDO::PARAM_STR);
$pdoStat->execute();

header("Location:index.php");