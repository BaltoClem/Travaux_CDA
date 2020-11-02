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

    }
    else {
        $("#genre_missed").empty();
        $("#inputGenre").css("border-color", "#008000");
        var html = "<div class='alert alert-success'role='alert'>Ok !</div>";
        $("#alertgenre").append(html);
    }
    ///////////////////////////////////////////////////////////LABEL////////////////////////////////////////////////////

    var label = $("#inputLabel").val();

    if (label === "") {
        $("#label_missed").empty();
        $("#inputLabel").css("border-color", "#FF0000");
        var html = "<div class='alert alert-danger'role='alert'>Vous n'avez pas renseigné le label de l'album !</div>";
        $("#label_missed").append(html);

    }
    else {
        $("#label_missed").empty();
        $("#inputLabel").css("border-color", "#008000");
        var html = "<div class='alert alert-success' role='alert'>Ok !</div>";
        $("#alertlabel").append(html);
    }
    ///////////////////////////////////////////////////////////PRIX////////////////////////////////////////////////////

    var prix = $("#inputPrice").val();
    var reg2 = /^[0-9]{1,3}(,[0-9]{3})*(([\\.,]{1}[0-9]*)|())$/;

    if (prix === "") {
        $("#price_missed").empty();
        $("#inputPrice").css("border-color", "#FF0000");
        var html = "<div class='alert alert-danger' role='alert'>Vous n'avez pas renseigné le prix de l'album !</div>";
        $("#price_missed").append(html);


    }
    else if (reg2.test(prix) === false) {
        $("#price_missed").empty();
        $("#inputPrice").css("border-color", "#FFA500");
        var html ="<div class='alert alert-warning' role='alert'>"+"Veuillez renseigner un prix valide !"+"</div>";
        $("#alertprice").append(html);

    }
    else {
        $("#price_missed").empty();
        $("#inputPrice").css("border-color", "#008000");
        var html = "<div class='alert alert-success' role='alert'>Ok !</div>";
        $("#alertprice").append(html);
    }
    ///////////////////////////////////////////////////////////PRIX////////////////////////////////////////////////////

    var image = $("#inputFile").val();

    if (image === "") {
        $("#file_missed").empty();
        $("#inputFile").css("border-color", "#FF0000");
        var html = "<div class='alert alert-danger' role='alert'>Vous n'avez pas renseigné l'image de l'album !</div>";
        $("#file_missed").append(html);
        return false;
    }
    else {
        $("#file_missed").empty();
        $("#inputFile").css("border-color", "#008000");
        var html = "<div class='alert alert-success' role='alert'>Ok !</div>";
        $("#alertfile").append(html);

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
    // Appel de la fonction verif()
    verif();
    event.preventDefault();
});