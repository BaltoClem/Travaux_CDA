$(document).ready(function() {

    $("#select1").load("listeoptions1.php");

    $("#select1").change(function() {
        $.ajax({
            type: 'GET',
            url: 'listeoptions2.php',
            data: { 
                'reg_id' : $("#select1").val()
            },
            success: function(data){
                alert('wow' + data);
            }
        });
        $("#select2").load("listeoptions2.php?reg_id=".$("#select1").val());
    });
});