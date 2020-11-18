<?php

namespace App\Controller;

use App\Entity\Products;
use App\Form\ProductsType;
use App\Repository\ProductsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;

/**
 * @Route("/products")
 */
class ProductsController extends AbstractController
{
    /**
     * @Route("/", name="products_index", methods={"GET"})
     * @param ProductsRepository $productsRepository
     * @return Response
     */
    public function index(ProductsRepository $productsRepository): Response
    {
        return $this->render('products/index.html.twig', [
            'products' => $productsRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="products_new", methods={"GET","POST"})
     * @param Request $request
     * @param SluggerInterface $slugger
     * @return Response
     */
    public function new(Request $request, SluggerInterface $slugger): Response
    {
        $product = new Products();
        $form = $this->createForm(ProductsType::class, $product);
        $form->handleRequest($request);
        // Si le formulaire est soumis et valide, alors nous allons utiliser l'objet EntityManager de Doctrine.
        // Il nous permet d'envoyer et d'aller chercher des objets dans la base de données
        if ($form->isSubmitted() && $form->isValid()) {

            $pictureFile = $form['picture']->getData();

            // Vérification s'il y a un upload photo
            if ($pictureFile) {
                    $originalFilename = pathinfo($pictureFile->getClientOriginalName(), PATHINFO_FILENAME);
                    $safeFilename = $slugger->slug($originalFilename);
                    $newFilename = $safeFilename.'-'.uniqid().'.'.$pictureFile->guessExtension();

                // Assignation de la valeur à la propriété picture à l'aide du setter
                $product->setPicture($newFilename);
                try {
                    // Déplacement du fichier vers le répertoire de destination sur le serveur
                    $pictureFile->move(
                        $this->getParameter('photo_directory'),
                        $newFilename
                    );
                } catch (FileException $e) {
                    // Gestion de l'erreur si le déplacement ne s'est pas effectué
                }
            }
            $entityManager = $this->getDoctrine()->getManager();
            //Préparation à la sauvegarde des données saisies
            $entityManager->persist($product);
            //Pour envoyer les données dans la base, nous utilisons la méthode flush()
            $entityManager->flush();

            $this->addFlash(
                'success',
                'Produit ajouté avec succès !!'
            );
            return $this->redirectToRoute('products_index');
        }

        return $this->render('products/new.html.twig', [
            'product' => $product,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="products_show", methods={"GET"})
     */
    public function show(Products $product): Response
    {
        return $this->render('products/show.html.twig', [
            'product' => $product,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="products_edit", methods={"GET","POST"})
     * @param Request $request
     * @param Products $product
     * @return Response
     */
    public function edit(Request $request, Products $product): Response
    {
        // Récupération de l'id du produit
        $idProduct = $product->getId();
        $form = $this->createForm(ProductsType::class, $product);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // Récupération de la saisie sur l'upload
            $pictureFile = $form['picture']->getData();

            // Vérification s'il y a un upload photo
            if ($pictureFile) {
                // Renommage du fichier
                // Nom du fichier + extension
                $newPicture = $idProduct . '.' . $pictureFile->guessExtension();

                // Assignation de la valeur à la propriété picture à l'aide du setter
                $product->setPicture($newPicture);
                try {
                    // Déplacement du fichier vers le répertoire de destination sur le serveur
                    $pictureFile->move(
                        $this->getParameter('photo_directory'),
                        $newPicture
                    );
                } catch (FileException $e) {
                    // Gestion de l'erreur si le déplacement ne s'est pas effectué
                }
            }

            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('products_index');
        }

        return $this->render('products/edit.html.twig', [
            'product' => $product,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="products_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Products $product): Response
    {
        if ($this->isCsrfTokenValid('delete'.$product->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($product);
            $entityManager->flush();
        }

        return $this->redirectToRoute('products_index');
    }
}
