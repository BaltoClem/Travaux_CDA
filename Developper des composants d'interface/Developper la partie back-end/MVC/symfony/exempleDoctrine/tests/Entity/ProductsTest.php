<?php

namespace App\Tests\Entity;

use App\Entity\Products;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use Symfony\Component\Validator\ConstraintViolation;

class ProductsTest extends KernelTestCase
{
    /*public function testValid()
    {
        // Définition du produit à insérer en bdd
        $product = (new Products())->setProductName('Produit')
            ->setCategoryId(1)
            ->setUnitPrice(183)
            ->setQuantityPerUnit(8)
            ->setUnitsInStock(56)
            ->setUnitsOnOrder(32)
            ->setReorderLevel(5)
            ->setDiscontinued(0);
            
        // validation
        self::bootKernel();
        // récupération depuis le container, le validator
        $error = self::$container->get('validator')->validate($product);
        // on s'attend à ne pas avoir d'erreur
        $this->assertCount(0, $error);
    }
    public function testInvalid() {
        $product = (new Products())->setProductName('Pro213duit')
            ->setCategoryId(1)
            ->setUnitPrice(183)
            ->setQuantityPerUnit(8)
            ->setUnitsInStock(56)
            ->setUnitsOnOrder(32)
            ->setReorderLevel(5)
            ->setDiscontinued(0);

        // validation
        self::bootKernel();
        // récupération depuis le container, le validator
        $error = self::$container->get('validator')->validate($product);
// on s'attend à avoir 1 erreur
        $this->assertCount(1, $error);
    }*/

    // Création d'une méthode pour récupérer l'entité
    public function getEntity(): Products {
        return (new Products())->setProductName('test Produit')
            ->setCategoryId(1)
            ->setUnitPrice(183)
            ->setQuantityPerUnit(8)
            ->setUnitsInStock(56)
            ->setUnitsOnOrder(32)
            ->setReorderLevel(5)
            ->setDiscontinued(0);
    }

    // Création d'une méthode pour la validation et récupération des erreurs

    public function assertHasError(Products $products, $number = 0)
    {
        // validation
        self::bootKernel();
        // récupération depuis le container, le validator
        $errors = self::$container->get('validator')->validate($products);
        $messages = [];
        /**
         * @var ConstraintViolation $error
         */
        foreach ($errors as $error) {
            $messages[] = $error->getPropertyPath() . ' => ' . $error->getMessage();
        }
        // on s'attend à ne pas avoir d'erreur
        $this->assertCount($number, $errors, implode(',', $messages));
    }
    public function testValid()
    {
        $this->assertHasError($this->getEntity(), 0);
    }

    public function testDigitInvalid()
    {
        $this->assertHasError($this->getEntity()->setProductName('t23est Produit'), 1);
    }

    public function testBlankInvalid()
    {
        $this->assertHasError($this->getEntity()->setProductName(''), 1);
    }
}
