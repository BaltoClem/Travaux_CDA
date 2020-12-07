$(document).ready(function() {

    $("#select1").load("listeoptions1.php");

    $("#select1").change(function() {

        $("#select2").load("listeoptions2.php");
    });
});