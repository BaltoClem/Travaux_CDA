//Alerte pour suppression

function validateDelete() {
    event.preventDefault(); //prevent form submit
    var form = document.forms["myForm"]; //storing the form
    swal({
        title: "Etes-vous sûr ?",
        text: "En cas d'annulation, votre vinyle ne sera pas supprimé!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
        .then((willDelete) => {
            if (willDelete) {
                swal({
                    text:"Le vinyle a été supprimé!",
                    icon: "success"
                });
                form.submit();
            } else {
                swal({
                    text:"Le vinyle n'a pas été supprimé!",
                    icon: "error"
                });
            }
        });
}

//Alerte pour confirmation d'ajout de vinyle

function validateAdd() {
    var formadd = document.forms["add_form"]; //storing the form
    swal({
        icon: "success",
        text: "Votre vinyle a bien été ajouté !",
        buttons: false,
        timer: 3000
    }).then((willAdd) => {
        if (willAdd) {
            formadd.submit();
        }
    });
}