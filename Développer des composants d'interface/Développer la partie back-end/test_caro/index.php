<html>
    <head>
        <title>Test technique - PHP</title>
    </head>

    <body>
        <section>
            Veuillez commenter votre code.
        </section>

        <section>
            <h2>Excercice 1 - Type de classe</h2>
            <p>Dans cet excercice, vous devrez vérifier le type de classe envoyé à la fonction que vous devez créer.</p>
            <p>Seul les types suivants doivent être acceptés : `Foo`, `User`, `Country`.</p>

            <form action="test.php">
                <input type="hidden" value="class" name="exo">
                <input type="submit" value="Tester !" />
            </form>
        </section>

        <section>
            <h2>Excercice 2 - Anagramme</h2>
            <p>Dans cet excercice, vous devrez vérifier si le mot envoyé est un anagramme de : ravie.</p>
            <p>Anagramme : Mot obtenu par transposition des lettres d'un autre mot (ex. Marie-aimer).</p>

            <form action="test.php">
                <input type="hidden" value="anagramme" name="exo">
                <input type="submit" value="Tester !" />
            </form>
        </section>

        <section>
            <h2>Excercice 3 - Injection SQL</h2>
            <p>Dans cet excercice, vous devrez sécuriser les champs envoyer à votre fonction afin de ne pas avoir d'erreur lors de la requete SQL.</p>
            <p>Les champs last_name, first_name, offer seront des `string` en base.</p>
            <p>Le champ active sera un `tinyint` en base.</p>

            <form action="test.php">
                <input type="hidden" value="injection_sql" name="exo">
                <input type="submit" value="Tester !" />
            </form>
        </section>

        <section>
            <h2>Excercice 4 - Palindrome</h2>
            <p>Dans cet excercice, vous devrez vérifier si le mot envoyé est un palindrome.</p>
            <p>Palindrome : Mot qui peut se lire indifféremment de gauche à droite ou de droite à gauche en gardant le même sens. (kayak)</p>

            <form action="test.php">
                <input type="hidden" value="palindrome" name="exo">
                <input type="submit" value="Tester !" />
            </form>
        </section>

        <section>
            <h2>Excercice 5 - Boite noire</h2>
            <p>Dans cet excercice, vous devez créer une fonction afin de retourner le résultat attendu.</p>
            <p>Si c'est un caractère spécial, celui-ci sera remplacé par la première lettre de l'alphabet</p>
            <ul>
                <li>azerty => bafsuz</li>
                <li>a36pqa => b2142qrb</li>
                <li>9a41or => 63b287ps</li>
                <li>28:as => 1456abt</li>
            </ul>

            <form action="test.php">
                <input type="hidden" value="black_box" name="exo">
                <input type="submit" value="Tester !" />
            </form>
        </section>

<?php

class A{

private $a;
private $b;
public $c;
public $d;
private function getA(){
}
}

?>

    </body>
</html>