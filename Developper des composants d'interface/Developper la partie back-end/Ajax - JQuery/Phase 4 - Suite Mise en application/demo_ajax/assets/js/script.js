// récupération des select
let region = document.getElementById('regions')
let dep = document.getElementById('departements')
// déclaration de l'event
region.addEventListener('change', (event) => {
    dep.innerHTML = ''
    // console.log(region.value)
    let reg_id = region.value

    // fonction pour tester si xhr est accepté par le navigateur
    function getXMLHttpRequest() {
        let xhr = null;
        if (window.XMLHttpRequest || window.ActiveXObject) {
            if (window.ActiveXObject) {
                try {
                    xhr = new ActiveXObject("Msxml2.XMLHTTP")
                } catch (e) {
                    xhr = new ActiveXObject("Microsoft.XMLHTTP")
                }
            } else {
                xhr = new XMLHttpRequest()
            }
        } else {
            alert("Votre navigateur ne supporte pas l'objet XMLHTTPRequest...")
        }
        return xhr
    }

    // check la compatibilité du navigateur
    let xhr = getXMLHttpRequest()
    //ouverture de la requête
    xhr.open('post', 'controller/indexController.php')
    // définition du header
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
    // envoie de la requête
    xhr.send('reg_id=' + reg_id)
    // gestion de l'état de la requête
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && (xhr.status === 200 || xhr.status === 0)) {
            // console.log(xhr.responseText)
            const depList = JSON.parse(xhr.responseText)
            // parcours du tableau provenant du controller
            depList.map(item => {
                // création de l'élément <option>
                const option = document.createElement('option')
                // assignation d'une valeur à l'élément option
                option.value = item.dep_id
                // écriture dans le html du nom du département (item_nom)
                option.innerHTML = item.dep_nom
                // affichage de l'élément <option> dans le select
                dep.append(option)
            })
        }
    }
})

