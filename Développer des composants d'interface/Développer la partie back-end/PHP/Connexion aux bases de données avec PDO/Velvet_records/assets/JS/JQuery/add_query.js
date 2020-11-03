$(document).ready(function(){

    var resultat = true;
    var regYear = /^(?:(?:19|20)[0-9]{2})$/;
    var regPrice = /^[0-9]{1,3}(,[0-9]{3})*(([\\.,]{1}[0-9]*)|())$/;

   $('#form').submit(function(){
   resultat=true;
       if($('#inputTitle').val() === ""){
           $('#inputTitle').attr('placeholder', 'Titre manquant').addClass('is-invalid');
            $('#alerttitle').text('Ce champ est requis').css("color", "#FF0000");
           resultat = false;
       }
        if($('#inputArtist').val() === null){
            $('#inputArtist').addClass('is-invalid');
            $('#alertartist').text('Ce champ est requis').css("color", "#FF0000");

            resultat = false;
        }
        if($('#inputYear').val() === ""){
            $('#inputYear').attr('placeholder', 'Année manquante').addClass('is-invalid');
            $('#alertyear').text('Ce champ est requis').css("color", "#FF0000");

            resultat = false;
        }
        else if(regYear.test($('#inputYear').val()) === false){
            $('#inputYear').attr('placeholder', 'Année invalide').addClass('is-invalid');
            $('#alertyear').text('Le format est invalide').css("color", "#FF702D");

            resultat = false;
        }
        if($('#inputGenre').val() === ""){
            $('#inputGenre').attr('placeholder', 'Genre manquant').addClass('is-invalid');
            $('#alertgenre').text('Ce champ est requis').css("color", "#FF0000");

            resultat = false;
        }
        if($('#inputLabel').val() === ""){
            $('#inputLabel').attr('placeholder', 'Label manquant').addClass('is-invalid');
            $('#alertlabel').text('Ce champ est requis').css("color", "#FF0000");

            resultat = false;
        }
        if($('#inputPrice').val() === ""){
            $('#inputPrice').attr('placeholder', 'Prix manquant').addClass('is-invalid');
            $('#alertprice').text('Ce champ est requis').css("color", "#FF0000");

            resultat = false;
        }
        else if(regPrice.test($('#inputPrice').val()) === false){
            $('#inputPrice').attr('placeholder', 'Prix invalide').addClass('is-invalid');
            $('#alertprice').text('Le format est invalide').css("color", "#FF702D");

            resultat = false;
        }
       if(document.getElementById("inputFile").value === ""){
           $('#inputPicture').addClass('is-invalid');
           $('#alertpicture').text('Ce champ est requis').css("color", "#FF0000");
           resultat = false;
       }
       else if(document.getElementById("inputFile").size > 5 * 1024 * 1024){
           $('#inputPicture').addClass('is-invalid');
           $('#alertpicture').text('Taille trop grande').css("color", "#FF0000");

           resultat = false;
       }
       return resultat;
    });

    $('#inputTitle').keyup(function(){
        if($('#inputTitle').val()===""){
            $('#inputTitle').attr('placeholder', 'Titre manquant').addClass('is-invalid');
            $('#alerttitle').text('Ce champ est requis').css("color", "#FF0000");
        }else{
            $('#inputTitle').removeClass('is-invalid');
            $('#alerttitle').text('');
        }
    });
    $('#inputArtist').change(function(){
        if($('#inputArtist').val() === null){
            $('#inputArtist').addClass('is-invalid');
            $('#alertartist').text('Ce champ est requis').css("color", "#FF0000");
        }else{
            $('#inputArtist').removeClass('is-invalid');
            $('#alertartist').text('');
        }

    });
    $('#inputYear').keyup(function(){
        if($('#inputYear').val()===""){
            $('#inputYear').attr('placeholder', 'Année manquante').addClass('is-invalid');
            $('#alertyear').text('Ce champ est requis').css("color", "#FF0000");
        }else{
            $('#inputYear').removeClass('is-invalid');
            $('#alertyear').text('');
        }

    });
    $('#inputGenre').keyup(function(){
        if($('#inputGenre').val()===""){
            $('#inputGenre').attr('placeholder', 'Genre manquant').addClass('is-invalid');
            $('#alertgenre').text('Ce champ est requis').css("color", "#FF0000");
        }else{
            $('#inputGenre').removeClass('is-invalid');
            $('#alertgenre').text('');
        }

    });
    $('#inputLabel').keyup(function(){
        if($('#inputLabel').val()===""){
            $('#inputLabel').attr('placeholder', 'Label manquant').addClass('is-invalid');
            $('#alertlabel').text('Ce champ est requis').css("color", "#FF0000");
        }else{
            $('#inputLabel').removeClass('is-invalid');
            $('#alertlabel').text('');
        }

    });
    $('#inputPrice').keyup(function(){
        if($('#inputPrice').val()===""){
            $('#inputPrice').attr('placeholder', 'Prix manquant').addClass('is-invalid');
            $('#alertprice').text('Ce champ est requis').css("color", "#FF0000");
        }else{
            $('#inputPrice').removeClass('is-invalid');
            $('#alertprice').text('');
        }
    });
    $('#inputPicture').change(function(){
        if(document.getElementById("inputFile").value === ""){
            $('#alertpicture').text('Ce champ est requis').css("color", "#FF0000");
        }else{
            $('#alertpicture').text('');
        }
    });
});