<!-- Ecrivez une fonction qui permette de générer un lien -->

<?php

function generateLink($lien, $titre){
    echo "<a href = $lien>$titre</a>";
}

generateLink("https://www.reddit.com/", "Reddit Hug");

?>

<br>

<!-- Ecrivez une fonction qui calcule la somme des valeurs d'un tableau -->

<?php

$tab = array(4, 3, 8, 2);

echo array_sum($tab);

?>

<!-- Créer une fonction qui vérifie le niveau de complexité d'un mot de passe -->

<?php

function testpassword($mdp) {

    $majuscule = preg_match('@[A-Z]@', $mdp);
    $minuscule = preg_match('@[a-z]@', $mdp);
    $chiffre = preg_match('@[0-9]@', $mdp);

    if(!$majuscule || !$minuscule || !$chiffre || strlen($mdp) < 8)
    {
        return false;
    }
    else 
        return true;

}

if (testpassword("TopSecret42") != true)
{
    echo "false";
}
else 
    echo "true";

?>