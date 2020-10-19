<?php

include("index.php");

?>

<header>

    <div class="header-video container">
        <div class="video-section-add">
            <video id="video-elem-add" preload autoplay loop muted>
                <source src="./assets/video/Concert.mp4" type="video/mp4">
            </video>
        </div>
    </div>

</header>

<body>
    <div class="container">
        <div class="row justify-content-center">
            <h1>Ajout d'un vinyle</h1>
        </div>
        <form>
            <div class="form-group">
                <label for="inputTitle">Title</label>
                <input type="text" class="form-control" id="inputTitle" placeholder="Ajouter un titre">
            </div>
            <div class="form-group">
                <label for="inputArtist">Artist</label>
                <input type="text" class="form-control" id="inputArtist" placeholder="Ajouter l'artiste">
            </div>
            <div class="form-group">
                <label for="inputTitle">Year</label>
                <input type="text" class="form-control" id="inputYear" placeholder="Ajouter l'année de parution">
            </div>
            <div class="form-group">
                <label for="inputGenre">Genre</label>
                <input type="text" class="form-control" id="inputGenre" placeholder="Ajouter le genre du disque">
            </div>
            <div class="form-group">
                <label for="inputLabel">Label</label>
                <input type="text" class="form-control" id="inputLabel" placeholder="Ajouter le label">
            </div>
            <div class="form-group">
                <label for="inputPrice">Price</label>
                <input type="text" class="form-control" id="inputPrice" placeholder="Ajouter le prix">
            </div>
            <div class="row justify-content-center">
            <button type="submit" class="btn btn-success">Valider l'ajout</button>
            </div>
            <br>
        </form>
    </div>
</body>
</html>