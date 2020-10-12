<!-------------------------- Exercice 1 --------------------------->

<?php

for($a= 0; $a <= 150; $a++){
    if($a % 2 === 1){
        echo "$a<br>";
    };
}

?>

<!-------------------------- Exercice 2 --------------------------->

<?php
for($b=0; $b < 500; $b++){
    echo "Je dois faire des sauvegardes régulières de mes fichiers<br>";
}
?>

<!-------------------------- Exercice 3 --------------------------->

<table>
    <thead>
        <tr>
            <th></th>
            <?php
            $x = 0;
            while ($x <= 12) {
            ?>
                <th><?= $x ?></th>
            <?php
                $x++;
            }
            ?>
        </tr>
    </thead>
    <tbody>
        <?php
        $y = 0;
        while ($y <= 12) {
        ?>
            <tr>
                <td>
                    <?= $y ?>
                </td>
                <?php
                $x = 0;
                while ($x <= 12) {
                ?>
                    <td>
                        <?= $x * $y ?>
                        <?php $x++; ?>
                    </td>
                <?php
                } 
                ?>
            </tr>
        <?php
        $y++;
        }
        ?>
    </tbody>
</table>