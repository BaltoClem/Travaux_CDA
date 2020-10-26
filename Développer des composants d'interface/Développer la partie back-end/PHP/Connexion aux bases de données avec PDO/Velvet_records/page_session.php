<?php
session_start();
include('header.php');

if($_SESSION["auth"]==="ok"){
    echo "Autorisation";
}
