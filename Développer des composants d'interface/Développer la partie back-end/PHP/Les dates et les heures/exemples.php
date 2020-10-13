<?php

date_default_timezone_set("Europe/Paris");

echo time()."<br>";

echo "Nous sommes le " . date("d/m/Y")."<br>";

echo date("H:i:s")."<br>";

$oDate = new DateTime();

var_dump($oDate);

$date = "10/13/2020";

$dateTime = DateTime::createFromFormat('m/d/Y', $date);

$errors = DateTime::getLastErrors();

if (!empty($errors['warning_count'])) 
{
   return FALSE;
}

$datePattern = "/^[0-9]{4}-[0-1][0-9]-[0-3][0-9]$/";
$date = "2015-12-32";

if (preg_match($datePattern, $date))
{
    echo "Date ".$date." valide.<br>";
}
else
{
    echo "Date ".$date." erronée.<br>";
}
$oDate =  DateTime::createFromFormat("d/m/Y H:i:s", "2015-12-28 03:42:11");

$errors = DateTime::getLastErrors();

if ($errors["error_count"]>0 || $errors["warning_count"]>0) {
    echo "ARGHHHH !";
}

?>