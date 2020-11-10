<?php
$texte = ucfirst("bonjour le monde");
echo "$texte <br>";

function bonjour() 
{
    echo "Bonjour<br>";
}
bonjour();

function bonjour2($prenom) 
{
    echo "Bonjour&nbsp$prenom&nbsp<br>";
}
bonjour2("Caroline");
?>