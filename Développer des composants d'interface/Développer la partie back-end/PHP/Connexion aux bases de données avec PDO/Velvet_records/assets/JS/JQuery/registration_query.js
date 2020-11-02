function verif() {

    ///////////////////////////////////////////////////////////EMAIL////////////////////////////////////////////////////

    var title = $("#inputTitle").val();

    if (title === "") {
        $("#title_missed").empty();
        $("#inputTitle").css("border-color", "#FF0000");
        var html = "<div class='alert alert-danger'role='alert'>Vous n'avez pas renseigné votre email !</div>";
        $("#title_missed").append(html);
    }

    else {
        $("#title_missed").empty();
        $("#inputTitle").css("border-color", "#008000");
        var html = "<div class='alert alert-success'role='alert'>Ok !</div>";
        $("#alerttitle").append(html);

    }
    ///////////////////////////////////////////////////////////PASSWORD////////////////////////////////////////////////////

    var artist = $("#inputArtist").val();
    //var reg1 = /^[0-9]+$/;

    if (artist === null) {
        $("#artist_missed").empty();
        $("#inputArtist").css("border-color", "#FF0000");
        var html = "<div class='alert alert-danger'role='alert'>Vous n'avez pas renseigné votre mot de passe !</div>";
        $("#artist_missed").append(html);
    }

    else {
        $("#artist_missed").empty();
        $("#inputArtist").css("border-color", "#008000");
        var html = "<div class='alert alert-success'role='alert'>Ok !</div>";
        $("#alertartist").append(html);
    }
    ///////////////////////////////////////////////////////////PASSWORD////////////////////////////////////////////////////

    var year = $("#inputYear").val();

    if (year === "") {
        $("#year_missed").empty();
        $("#inputYear").css("border-color", "#FF0000");
        var html = "<div class='alert alert-danger'role='alert'>Vous n'avez pas confirmé votre mot de passe !</div>";
        $("#year_missed").append(html);
    }
    else {
        $("#year_missed").empty();
        $("#inputYear").css("border-color", "#008000");
        var html = "<div class='alert alert-success'role='alert'>Ok !</div>";
        $("#alertyear").append(html);
    }

    document.forms[0].submit();
}

$("#registr_button").click(function(event)
{
    /* On doit bloquer l'èvènement par défaut - ici l'envoi du formulaire -
    * avec l'instruction preventDefault()
    * le paramètre 'event' est un objet (nommé
    * librement) représentant l'évènement
    */
    event.preventDefault();

    // Appel de la fonction verif()
    verif();
});