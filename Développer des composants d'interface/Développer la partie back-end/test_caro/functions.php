<?php
    // -- Exo 1
    /**
     * @param $class
     * @return bool
     */
    function checkClass($class) {
        /* $class est en fait l'instantiation d'une classe,
        * il faut donc récupérer son nom avec la fonction get_class()
        */
        $sClassName = get_class($class);

        // Tableau des types (noms) de classes acceptées
        $aAllowed = ['Foo', 'User', 'Country'];

        // On cherche si la valeur de $class est dans le tableau des valeurs acceptées
        if (in_array($sClassName, $aAllowed)) 
        {
            return true;
        } 
        else 
        {
            return false;
        }
    }

    // -- Exo 2
    /**
     * @param $word
     * @return bool
     */
    function checkAnagramme($word) {

        $mWord = "ravie";
        $mwLen = strlen($mWord);
        $wLen = strlen($word);
        $wSplitn = str_split($mWord);

        for($i=0; $i<=$wLen; $i++){};
        
        if($mwLen != $wLen){
            return false;
        }
        else{
            return true;
        };

    }

    // -- Exo 3
    /**
     * @param $last_name
     * @param $first_name
     * @param $active
     * @param $offer
     * @return null
     */
    function checkInjectionSQL(&$last_name, &$first_name, &$active, &$offer) {

    }

    // -- Exo 4
    /**
     * @param $word
     * @return bool
     */
    function checkPalindrome($word) {

    }

    // -- Exo 5
    /**
     * @param $word
     * @return string
     */
    function checkBlackBox($word) {

    }