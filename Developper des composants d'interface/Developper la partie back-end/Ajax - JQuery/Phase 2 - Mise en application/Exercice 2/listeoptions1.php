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

$str_requete = "SELECT * FROM regions";
$result = $db->query($str_requete);

foreach($result as $region){
    ?>
    <option value="<?= $region['reg_id'] ?>"><?= $region['reg_v_nom']; ?></option>
    <?php
}
?>