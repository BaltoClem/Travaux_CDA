<?php

include("process.php");
include("index.php");

?>

<body>
<div class="container">
    <form>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputTitle">Title</label>
                <input type="text" class="form-control" id="inputTitle" readonly>
            </div>
            <div class="form-group col-md-6">
                <label for="inputArtist">Artist</label>
                <input type="text" class="form-control" id="inputArtist" readonly>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputYear">Year</label>
                <input type="text" class="form-control" id="inputYear" readonly>
            </div>
            <div class="form-group col-md-6">
                <label for="inputGenre">Genre</label>
                <input type="text" class="form-control" id="inputGenre" readonly>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputLabel">Label</label>
                <input type="text" class="form-control" id="inputLabel" readonly>
            </div>
            <div class="form-group col-md-6">
                <label for="inputPrice">Price</label>
                <input type="text" class="form-control" id="inputPrice" readonly>
            </div>
        </div>
    </form>
</div>
</body>