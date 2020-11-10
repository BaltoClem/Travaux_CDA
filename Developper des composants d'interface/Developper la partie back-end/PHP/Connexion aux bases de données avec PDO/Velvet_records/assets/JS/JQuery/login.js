$(document).ready(function(){

//////////////////////////////////////////////////REGEX & VARIABLES/////////////////////////////////////////////////////

    var resultat = true;
    var regPassword = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[-+!?$@%_])([-+!?$@%_\w]{8,15})$/;

/////////////////////////////////////////CONDITIONS DE VALIDATION///////////////////////////////////////////////////////

    $('#login_form').submit(function(){
        resultat=true;
        if($('#inputEmail').val() === ""){
            $('#inputEmail').attr('placeholder', 'Email manquant').addClass('is-invalid');
            $('#alertemail').text('Ce champ est requis').css("color", "#FF0000");
            resultat = false;
        }
        if($('#inputPassword').val() === ""){
            $('#inputPassword').attr('placeholder', 'Mot de passe manquant').addClass('is-invalid');
            $('#alertpassword').text('Ce champ est requis').css("color", "#FF0000");
            resultat = false;
        }
        else if(regPassword.test($('#inputPassword').val()) === false){
            $('#inputPassword').attr('placeholder', 'Mot de passe invalide').addClass('is-invalid');
            $('#alertpassword').text('Le format est invalide').css("color", "#FF702D");

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
    $('#inputPassword').keyup(function(){
        if($('#inputPassword').val()===""){
            $('#inputPassword').attr('placeholder', 'Mot de passe manquant').addClass('is-invalid');
            $('#alertpassword').text('Ce champ est requis').css("color", "#FF0000");
        }else{
            $('#inputPassword').removeClass('is-invalid');
            $('#alertpassword').text('');
        }
    });
});