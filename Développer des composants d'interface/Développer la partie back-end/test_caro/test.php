<?php
    include_once "functions.php";
    include_once "class.php";
    require_once "database.php";

    $exo = $_GET["exo"] ?? "";

    $bool = true;

    switch ($exo) {
        case "class":
            if(function_exists("checkClass")) {
                $array_class = [
                    "Foo" => true,
                    "User" => true,
                    "Test" => false,
                    "Country" => true,
                    "Fob" => false,
                    "Offer" => false
                ];

                foreach ($array_class as $key => $item) {
                    $object = new $key;

                    $bool &= (checkClass($object) === $item);
                }
            } else {
                $bool = false;
            }
        break;

        case "anagramme":
            if(function_exists("checkAnagramme")) {
                $array_word = [
                    "avire" => true,
                    "ravie" => true,
                    "revai" => true,
                    "vaire" => true,
                    "varie" => true,
                    "vraie" => true,
                    "AViRE" => true,
                    "vraiE" => true,
                    "test" => false,
                    "AtROCe" => false,
                    "echec" => false,
                    "php" => false,
                    "anagramme" => false
                ];

                foreach ($array_word as $key => $item) {
                    $bool &= (checkAnagramme($key) === $item);
                }
            } else {
                $bool = false;
            }
        break;

        case "injection_sql":
            if(function_exists("checkInjectionSQL")) {
                $array_query = [
                    [
                        "last_name" => "Doe",
                        "first_name" => "John",
                        "active" => "active",
                        "offer" => "Talan",
                    ],
                    [
                        "last_name" => "' AND 1 = 1 //",
                        "first_name" => '" AND 1 = 1 //',
                        "active" => "unknow",
                        "offer" => "Microsoft",
                    ],
                    [
                        "last_name" => null,
                        "first_name" => null,
                        "active" => null,
                        "offer" => null,
                    ],
                ];

                foreach ($array_query as $item) {
                    checkInjectionSQL($item["last_name"], $item["first_name"], $item["active"], $item["offer"]);

                    try {
                        /** PDO $db */
                        $bool &= $db->query("INSERT INTO users (last_name, first_name, offer, active) VALUES ('". $item["last_name"] ."', '". $item["first_name"] ."', '". $item["offer"] ."', ". $item["active"] .")");
                        $bool &= $db->query("SELECT * FROM users WHERE last_name = '". $item["last_name"] ."' AND first_name = '". $item["first_name"] ."' AND offer = '". $item["offer"] ."' AND active = ". $item["active"]);
                    } catch (Exception $e) {
                        var_dump($e);
                        $bool &= false;
                    }
                }
            } else {
                $bool = false;
            }
        break;

        case "palindrome":
            if(function_exists("checkPalindrome")) {
                $array_word = [
                    "bob" => true,
                    "bOb" => true,
                    "coloc" => true,
                    "gag" => true,
                    "kayak" => true,
                    "KaYak" => true,
                    "remy" => false,
                    "test" => false,
                    "pour" => false,
                    "pool" => false,
                    "passe" => false,
                ];

                foreach ($array_word as $key => $item) {
                    $bool &= (checkPalindrome($key) === $item);
                }
            } else {
                $bool = false;
            }
        break;

        case "black_box":
            if(function_exists("checkBlackBox")) {
                $array_word = [
                    "azerty" => [
                        "check" => true,
                        "return" => "bafsuz",
                    ],
                    "a36pqa" => [
                        "check" => true,
                        "return" => "b2142qrb",
                    ],
                    "9a41or" => [
                        "check" => true,
                        "return" => "63b287ps",
                    ],
                    "941adsv" => [
                        "check" => true,
                        "return" => "63287betw",
                    ],
                    "fakgvhebv" => [
                        "check" => false,
                        "return" => "gblhwifdw",
                    ],
                    "azfegvnke" => [
                        "check" => false,
                        "return" => "vszvjrhsbv",
                    ],
                    "ezfger4ef45" => [
                        "check" => false,
                        "return" => "ezf45ezf",
                    ],
                    "ge:rgezkgj" => [
                        "check" => true,
                        "return" => "hfashfalhk",
                    ],
                ];

                foreach ($array_word as $key => $item) {
                    $bool &= ((checkBlackBox($key) === $item["return"]) === $item["check"]);
                }
            } else {
                $bool = false;
            }
        break;


        default:
            $bool = false;
    }

    echo (($bool) ? "Test réussi" : "Test échoué") ." ! Retour à l'index dans 5 secondes.";
?>

<script>
    window.setTimeout(function() {
        window.location = '/';
    }, 5000);
</script>
