function verif() {

    ///////////////////////////////////////////////////////////TITRE////////////////////////////////////////////////////

    var title = $("#inputTitle").val();
    //var reg1 = /^[0-9]+$/;

    if (title === "") {
        $("#inputTitle").css("border-color", "#FF0000");
        var html = "<div class='alert alert-danger'role='alert'>Vous n'avez pas renseigné le titre !</div>";
        $("#title_missed").append(html);
    }
        // else if (reg1.test(prix.value) == false) {
        //
        //     $("#prix").css("border-color", "#FFA500");
        //     var html ="<div class='alert alert-warning'role='alert'>"+"C'est avec des chiffres !"+"</div>";
        //     $("#alerteprix").append(html);
    // }
    else {
        $("#inputTitle").css("border-color", "#008000");
        var html = "<div class='alert alert-success'role='alert'>Ok !</div>";
        $("#alerttitle").append(html);

    }
    ///////////////////////////////////////////////////////////ARTISTE////////////////////////////////////////////////////

    var artist = $("#inputArtist").val();
    //var reg1 = /^[0-9]+$/;

    if (artist === null) {
        $("#inputArtist").css("border-color", "#FF0000");
        var html = "<div class='alert alert-danger'role='alert'>Vous n'avez pas renseigné l'artiste !</div>";
        $("#artist_missed").append(html);
        return false;
    }
        // else if (reg1.test(prix.value) == false) {
        //
        //     $("#prix").css("border-color", "#FFA500");
        //     var html ="<div class='alert alert-warning'role='alert'>"+"C'est avec des chiffres !"+"</div>";
        //     $("#alerteprix").append(html);
    // }
    else {
        $("#inputArtist").css("border-color", "#008000");
        var html = "<div class='alert alert-success'role='alert'>Ok !</div>";
        $("#alertartist").append(html);
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