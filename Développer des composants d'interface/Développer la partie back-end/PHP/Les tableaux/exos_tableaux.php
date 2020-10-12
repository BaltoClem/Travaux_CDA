<!-- 1. Mois de l'année non bissextile -->
<?php

$annee = array(
    "Janvier" => 31,
    "Février" => 28,
    "Mars" => 31,
    "Avril" => 30,
    "Mai" => 31,
    "Juin" => 30,
    "Juillet" => 31,
    "Août" => 31,
    "Septembre" => 30,
    "Octobre" => 31,
    "Novembre" => 30,
    "Décembre" => 31
);
asort($annee);
?>
<table border=4>
        <tr>
            <th>Mois</th>
            <th>Jours</th>
        </tr>
        <?php foreach($annee as $mois => $jours){?>
        <tr>
            <td><?php echo "$mois";?></td>
            <td><?php echo "$jours"; }?></td>
        </tr>
</table>

<!-- 2. Capitales -->

<!-- Affichez la liste des capitales (par ordre alphabétique) suivie du nom du pays. -->
<?php

$capitales = array(
    "Bucarest" => "Roumanie",
    "Bruxelles" => "Belgique",
    "Oslo" => "Norvège",
    "Ottawa" => "Canada",
    "Paris" => "France",
    "Port-au-Prince" => "Haïti",
    "Port-d'Espagne" => "Trinité-et-Tobago",
    "Prague" => "République tchèque",
    "Rabat" => "Maroc",
    "Riga" => "Lettonie",
    "Rome" => "Italie",
    "San José" => "Costa Rica",
    "Santiago" => "Chili",
    "Sofia" => "Bulgarie",
    "Alger" => "Algérie",
    "Amsterdam" => "Pays-Bas",
    "Andorre-la-Vieille" => "Andorre",
    "Asuncion" => "Paraguay",
    "Athènes" => "Grèce",
    "Bagdad" => "Irak",
    "Bamako" => "Mali",
    "Berlin" => "Allemagne",
    "Bogota" => "Colombie",
    "Brasilia" => "Brésil",
    "Bratislava" => "Slovaquie",
    "Varsovie" => "Pologne",
    "Budapest" => "Hongrie",
    "Le Caire" => "Egypte",
    "Canberra" => "Australie",
    "Caracas" => "Venezuela",
    "Jakarta" => "Indonésie",
    "Kiev" => "Ukraine",
    "Kigali" => "Rwanda",
    "Kingston" => "Jamaïque",
    "Lima" => "Pérou",
    "Londres" => "Royaume-Uni",
    "Madrid" => "Espagne",
    "Malé" => "Maldives",
    "Mexico" => "Mexique",
    "Minsk" => "Biélorussie",
    "Moscou" => "Russie",
    "Nairobi" => "Kenya",
    "New Delhi" => "Inde",
    "Stockholm" => "Suède",
    "Téhéran" => "Iran",
    "Tokyo" => "Japon",
    "Tunis" => "Tunisie",
    "Copenhague" => "Danemark",
    "Dakar" => "Sénégal",
    "Damas" => "Syrie",
    "Dublin" => "Irlande",
    "Erevan" => "Arménie",
    "La Havane" => "Cuba",
    "Helsinki" => "Finlande",
    "Islamabad" => "Pakistan",
    "Vienne" => "Autriche",
    "Vilnius" => "Lituanie",
    "Zagreb" => "Croatie"
);
ksort($capitales);
?>

<table border=4>
        <tr>
            <th>Capitales</th>
            <th>Pays</th>
        </tr>
        <?php foreach($capitales as $capitale => $pays){?>
        <tr>
            <td><?php echo "$capitale";?></td>
            <td><?php echo "$pays"; }?></td>
        </tr>
</table>

<!-- Affichez la liste des pays (par ordre alphabétique) suivie du nom de la capitale. -->
<?php
asort($capitales);
?>
<table border=4>
        <tr>
            <th>Pays</th>
            <th>Capitale</th>
        </tr>
        <?php foreach($capitales as $capitale => $pays){?>
        <tr>
            <td><?php echo "$pays";?></td>
            <td><?php echo "$capitale";}?></td>
        </tr>
</table>

<!-- Affichez le nombre de pays dans le tableau. -->

<?php $nb = count(array_values($capitales));
 echo "Le tableau contient ".$nb." pays <br>"
?>

<!-- Supprimer du tableau toutes les capitales ne commençant pas par la lettre 'B', puis affichez le contenu du tableau. -->

<table border=4>
        <tr>
            <th>Capitales</th>
            <th>Pays</th>
        </tr>
        <?php foreach($capitales as $capitale => $pays){
                    if(substr($capitale,0,1) ==="B"){
                        array_pop($capitales);
        ?>
        <tr>
            <td><?php echo "$capitale";?></td>
            <td><?php echo "$pays";}}?></td>
        </tr>
</table>

<!-- 3. Départements -->

<?php
$departements = array(
    "Hauts-de-france" => array("Aisne", "Nord", "Oise", "Pas-de-Calais", "Somme"),
    "Bretagne" => array("Côtes d'Armor", "Finistère", "Ille-et-Vilaine", "Morbihan"),
    "Grand-Est" => array("Ardennes", "Aube", "Marne", "Haute-Marne", "Meurthe-et-Moselle", "Meuse", "Moselle", "Bas-Rhin", "Haut-Rhin", "Vosges"),
    "Normandie" => array("Calvados", "Eure", "Manche", "Orne", "Seine-Maritime")
);
ksort($departements);
?>
<table border=4>
        <tr>
            <th>Région</th>
            <th>Départements</th>
        </tr>
        <?php foreach($departements as $region){?>
            <?php foreach($region as $dep=>$nomdep){?>
        <tr>
            <td><?php echo "$dep";?></td>
            <td><?php echo "$nomdep"; }}?></td>
        </tr>
</table>