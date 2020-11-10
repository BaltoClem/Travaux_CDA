<?php

//Indication de l'endroit dans l'application Symfony où nous nous trouvons. Ici -> dans le namespace "Controller"

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;

//Déclaration de la première classe
// La classe doit hériter de "AbstractController" pour obtenir les services du FrameWorkBundle

//Indication du chemin vers la classe
//@method render() indique que la classe va générer des vues
/**
 * @Route("/")
 * @method render(string $string, array $array)
 */

class HomeController extends AbstractController{
    //name="home" est le nom que l'on donne à la route, cela permet de cibler la méthode
    /**
     * @Route("/", name="home")
     */
    public function index() : Response{
        //On donne comme action à la fonction d'afficher la page d'accueil avec un return
        return $this->render('home/index.html.twig');
    }
}
