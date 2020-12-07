<?php 
header('Access-Control-Allow-Origin: http://localhost/ajax_demo');  

try 
{      
   $db = new PDO('mysql:host=localhost;dbname=ajax_regions;charset=utf8', 'root', '', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING));   
} 
catch (Exception $e) 
{
   echo'Erreur : '.$e->getMessage().'<br>';
   echo'N° : '.$e->getCode(); 
   die('Fin du script');
}

$str_requete = "SELECT * FROM regions JOIN departements ON departements.dep_reg_id = regions.reg_id";
$result = $db->query($str_requete);

foreach($result as $dep){
    ?>
    <option value="<?= $dep['reg_id'] ?>"><?= $dep['dep_nom']; ?></option>
    <?php
}
?>