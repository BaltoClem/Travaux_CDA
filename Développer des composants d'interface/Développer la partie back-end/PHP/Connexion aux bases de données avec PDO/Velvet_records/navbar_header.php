<nav class="navbar navbar-expand-lg navbar-light">
  <a class="navbar-brand" href="#">Velvet_Records</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="index.php">Accueil <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="add_form.php">Ajouter un disque</a>
      </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Espace Client</a>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="registration_form.php">S'inscrire</a>
                <a class="dropdown-item" href="login_form.php">Connexion</a>
            </div>
        </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
        <label>
            <input class="form-control mr-sm-2" type="search" placeholder="Recherche...">
        </label>
        <button class="btn btn-outline-dark my-sm-0" id="btn_search" type="submit">Rechercher</button>
    </form>
  </div>
</nav>
