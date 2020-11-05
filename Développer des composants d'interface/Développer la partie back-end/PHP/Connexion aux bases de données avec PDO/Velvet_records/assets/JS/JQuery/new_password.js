$(document).ready(function() {
//////////////////////////////////////////////////REGEX/////////////////////////////////////////////////////////////////

    var resultat = true;
    var regPassword = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[-+!?$@%_])([-+!?$@%_\w]{8,15})$/;

/////////////////////////////////////////CONDITIONS DE VALIDATION///////////////////////////////////////////////////////

    $('#new_password_form').submit(function() {

        resultat = true;

        if ($('#inputPassword').val() === "") {
            $('#inputPassword').attr('placeholder', 'Mot de passe manquant').addClass('is-invalid');
            $('#alertpassword').text('Ce champ est requis').css("color", "#FF0000");
            resultat = false;
        }
        else if(regPassword.test($('#inputPassword').val()) === false){
                $('#inputPassword').attr('placeholder', 'Mot de passe invalide').addClass('is-invalid');
                $('#alertpassword').text('Le format est invalide').css("color", "#FF702D");

                resultat = false;
            }
        if ($('#inputConfPassword').val() === "") {
            $('#inputConfPassword').attr('placeholder', 'Confirmation de mot de passe manquante').addClass('is-invalid');
            $('#alertconfpassword').text('Ce champ est requis').css("color", "#FF0000");
            resultat = false;
        }
        return resultat;
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
    $('#inputConfPassword').keyup(function(){
        if($('#inputConfPassword').val()===""){
            $('#inputConfPassword').attr('placeholder', 'Confirmation de mot de passe manquante').addClass('is-invalid');
            $('#alertconfpassword').text('Ce champ est requis').css("color", "#FF0000");
        }else{
            $('#inputConfPassword').removeClass('is-invalid');
            $('#alertconfpassword').text('');
        }
    });
});
