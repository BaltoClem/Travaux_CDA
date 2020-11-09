<?php
namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

//@ORM\Table(name="products") : permet de spécifier que la classe Products est associée à la table products
/**
 * @ORM\Entity
 * @ORM\Table(name="products")
 */
class Products
{
    //@ORM\Column(name="ProductId", type="integer", nullable=false) : permet de mapper l'attribut $id avec la colonne ProductId
    //@ORM\Id : spécifie que cet attribut représente l'Id (la clé primaire de la table).

    /**
     * @ORM\Column(name="ProductId", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @ORM\Column(name="ProductName", type="string", length=40)
     */
    private $name;

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }
    /**
     * @ORM\Column(name="SupplierID", type="string", length=40)
     */
    private $supplierid;

    public function getSupplierId(): ?string
    {
        return $this->supplierid;
    }

    public function setSupplierId(string $supplierid): self
    {
        $this->supplierid = $supplierid;

        return $this;
    }
    /**
     * @ORM\Column(name="CategoryID", type="string", length=40)
     */
    private $categoryid;

    public function getCategoryId(): ?string
    {
        return $this->categoryid;
    }

    public function setCategoryId(string $categoryid): self
    {
        $this->supplierid = $categoryid;

        return $this;
    }

}