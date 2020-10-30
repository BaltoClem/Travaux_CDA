function verif() {

    ///////////////////////////////////////////////////////////TITRE////////////////////////////////////////////////////

    var title = $("#inputTitle").val();

    if (title === "") {
        $("#title_missed").empty();
        $("#inputTitle").css("border-color", "#FF0000");
        var html = "<div class='alert alert-danger'role='alert'>Vous n'avez pas renseigné le titre !</div>";
        $("#title_missed").append(html);
    }

    else {
        $("#title_missed").empty();
        $("#inputTitle").css("border-color", "#008000");
        var html = "<div class='alert alert-success'role='alert'>Ok !</div>";
        $("#alerttitle").append(html);

    }
    ///////////////////////////////////////////////////////////ARTISTE////////////////////////////////////////////////////

    var artist = $("#inputArtist").val();
    //var reg1 = /^[0-9]+$/;

    if (artist === null) {
        $("#artist_missed").empty();
        $("#inputArtist").css("border-color", "#FF0000");
        var html = "<div class='alert alert-danger'role='alert'>Vous n'avez pas renseigné l'artiste !</div>";
        $("#artist_missed").append(html);
    }

    else {
        $("#artist_missed").empty();
        $("#inputArtist").css("border-color", "#008000");
        var html = "<div class='alert alert-success'role='alert'>Ok !</div>";
        $("#alertartist").append(html);
    }
    ///////////////////////////////////////////////////////////YEAR////////////////////////////////////////////////////

    var year = $("#inputYear").val();
    var reg1 = /^(?:(?:19|20)[0-9]{2})$/;

    if (year === "") {
        $("#year_missed").empty();
        $("#inputYear").css("border-color", "#FF0000");
        var html = "<div class='alert alert-danger'role='alert'>Vous n'avez pas renseigné l'année de parution !</div>";
        $("#year_missed").append(html);
    }
    else if (reg1.test(year) === false) {
        $("#year_missed").empty();
        $("#inputYear").css("border-color", "#FFA500");
        var html ="<div class='alert alert-warning'role='alert'>"+"Veuillez renseigner une année valide !"+"</div>";
        $("#alertyear").append(html);
    }
    else {
        $("#year_missed").empty();
        $("#inputYear").css("border-color", "#008000");
        var html = "<div class='alert alert-success'role='alert'>Ok !</div>";
        $("#alertyear").append(html);
    }
    ///////////////////////////////////////////////////////////GENRE////////////////////////////////////////////////////

    var genre = $("#inputGenre").val();

    if (year === "") {
        $("#genre_missed").empty();
        $("#inputGenre").css("border-color", "#FF0000");
        var html = "<div class='alert alert-danger'role='alert'>Vous n'avez pas renseigné le genre de l'album !</div>";
        $("#genre_missed").append(html);
        return false;
    }
    else {
        $("#genre_missed").empty();
        $("#inputGenre").css("border-color", "#008000");
        var html = "<div class='alert alert-success'role='alert'>Ok !</div>";
        $("#alertgenre").append(html);
    }
    document.forms[0].submit();
}

$("#add_button").click(function(event)
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