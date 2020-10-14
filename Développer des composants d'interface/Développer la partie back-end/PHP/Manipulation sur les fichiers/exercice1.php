<!-- Lecture d'un fichier -->
<?php

$lines = file("https://ncode.amorce.org/ressources/Pool/CDA/WEB_PHP_frc/liens.txt");
                            
foreach($lines as $line) {
    echo "<p><a href=$line>$line</a></p>";
}

?>
