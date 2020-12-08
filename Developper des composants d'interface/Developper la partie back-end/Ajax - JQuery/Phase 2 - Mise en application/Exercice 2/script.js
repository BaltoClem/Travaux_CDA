$(document).ready(function() {

    $("#select1").load("listeoptions1.php");

    $("#select1").change(function() {
        $.post('controller/option2controller.php', {
            reg_id: $(this).val()
        }, function (data) {
            if (data) {
                $('#select2').html(data);
            } else {
                alert('Erreur');
            }
    
        },
                'HTML');
    });    
});