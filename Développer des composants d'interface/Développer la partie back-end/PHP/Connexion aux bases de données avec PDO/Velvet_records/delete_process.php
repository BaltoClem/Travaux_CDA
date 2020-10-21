<?php
include("process.php");

$discId = $_GET["disc_id"];

$pdoStat = $db->prepare("DELETE FROM disc 
                    WHERE disc.disc_id =".$discId);
$pdoStat->execute();