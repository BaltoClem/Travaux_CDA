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

    <form action="process.php" method="post">
        <span>Title</span>
        <input type="text" name="firstname" placeholder="Enter title">
        <p><input type="text" name="lastname" ></p>
        <p><input type="submit" name="insert" value="Insérer"></p>
    </form>
    </div>
</body>
</html>