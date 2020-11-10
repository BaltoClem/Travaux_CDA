$(document).ready(function(){
    var resultat = true;

/////////////////////////////////////////CONDITIONS DE VALIDATION///////////////////////////////////////////////////////

    $('#forgot_form').submit(function() {
        resultat = true;
        if($('#inputEmail').val() === ""){
            $('#inputEmail').attr('placeholder', 'Email manquant').addClass('is-invalid');
            $('#alertemail').text('Ce champ est requis').css("color", "#FF0000");
            resultat = false;
        }
        return resultat;
    });
    $('#inputEmail').keyup(function(){
        if($('#inputEmail').val()===""){
            $('#inputEmail').attr('placeholder', 'Email manquant').addClass('is-invalid');
            $('#alertemail').text('Ce champ est requis').css("color", "#FF0000");
        }else{
            $('#inputEmail').removeClass('is-invalid');
            $('#alertemail').text('');
        }
    });
});