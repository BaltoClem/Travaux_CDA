<!-- Trouvez le numéro de semaine de la date suivante : 14/07/2019. -->

<?php

date_default_timezone_set("Europe/Paris");

$date = "2019-07-14";
$semaine = date('W',strtotime($date));
echo "nous sommes en semaine $semaine"."<br>";
?>
<br>

<!-- Combien reste-t-il de jours avant la fin de votre formation. -->
<?php
$origin = date_create('2020-10-13');
$target = date_create('2021-04-16');
$interval = date_diff($origin, $target);
echo "Il reste&nbsp".$interval->format('%a&nbspjours&nbsp')."avant la fin de la formation";
?>
<br>
<!-- Comment déterminer si une année est bissextile ? -->
<?php
function est_bissextile($annee)
    {
        return date("m-d", strtotime("$annee-02-29")) == "02-29";
    }

    echo est_bissextile('2016');
?>
<br>
<!-- Montrez que la date du 32/17/2019 est erronée -->

<?php
    var_dump(checkdate(17,32,2019))
?>

<br>
<!-- Affichez l'heure courante sous cette forme : 11h25. -->

<?php
echo date("H \h\ i");
?>

<br>

<!-- Ajoutez 1 mois à la date courante. -->

<?php

echo date("d-m-Y", strtotime('+1 month'));

?>

<br>

<!-- Que s'est-il passé le 1000200000 -->

<?php
echo date("d-m-Y", 1000200000);
?>