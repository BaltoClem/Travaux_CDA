$(document).ready(function(){

    //////////////////////////////////////////////////REGEX/////////////////////////////////////////////////////////////////

    var resultat = true;
    var regPassword = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[-+!?$@%_])([-+!?$@%_\w]{8,15})$/;

    /////////////////////////////////////////CONDITIONS DE VALIDATION///////////////////////////////////////////////////////

    $('#form_registr').submit(function(){

        resultat=true;

        if($('#inputEmail').val() === ""){
            $('#inputEmail').attr('placeholder', 'Email manquant').addClass('is-invalid');
            $('#alertemail').text('Ce champ est requis').css("color", "#FF0000");
            resultat = false;
        }
        if($('#inputPassword').val() === "") {
            $('#inputPassword').attr('placeholder', 'Mot de passe manquant').addClass('is-invalid');
            $('#alertpassword').text('Ce champ est requis').css("color", "#FF0000");
            resultat = false;
        }
        else if(regPassword.test($('#inputPassword').val()) === false){
                $('#inputPassword').attr('placeholder', 'Mot de passe invalide').addClass('is-invalid');
                $('#alertpassword').text('Le mot de passe est trop faible').css("color", "#FF702D");
                resultat = false;
            }

        if($('#inputConfPassword').val() === ""){
            $('#inputConfPassword').attr('placeholder', 'Confirmation de mot de passe manquante').addClass('is-invalid');
            $('#alertconfpassword').text('Ce champ est requis').css("color", "#FF0000");
            resultat = false;
        }
        if($('#inputPassword').val() !== $('#inputConfPassword').val()){
            $('#inputPassword').addClass('is-invalid');
            $('#alertpassword').text('Mots de passe différents').css("color", "#FF0000");
            $('#inputConfPassword').addClass('is-invalid');
            $('#alertconfpassword').text('Mots de passe différents').css("color", "#FF0000");
        }

        return resultat;
    });

////////////////////////////////////////////////MAJ INPUT SI REECRITURE/////////////////////////////////////////////////

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