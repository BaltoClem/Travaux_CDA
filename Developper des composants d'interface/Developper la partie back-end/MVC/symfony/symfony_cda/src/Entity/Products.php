<?php
namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use phpDocumentor\Reflection\Types\Boolean;
use phpDocumentor\Reflection\Types\Integer;

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
     * @ORM\Column(name="ProductName", type="string", nullable=false)
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
     * @ORM\Column(name="SupplierID", type="integer", length=40)
     */
    private $supplierid;

    public function getSupplierId(): ?int
    {
        return $this->supplierid;
    }

    public function setSupplierId(int $supplierid): self
    {
        $this->supplierid = $supplierid;

        return $this;
    }
    /**
     * @ORM\Column(name="CategoryID", type="string", length=40, nullable=false)
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
    /**
     * @ORM\Column(name="QuantityPerUnit", type="string", length=40)
     */
    private $quantityUnit;

    public function getQuantityPerUnit(): ?string
    {
        return $this->quantityUnit;
    }

    public function setQuantityPerUnit(string $quantityUnit): self
    {
        $this->quantityUnit = $quantityUnit;

        return $this;
    }
    /**
     * @ORM\Column(name="UnitPrice", type="string", length=40)
     */
    private $unitPrice;

    public function getUnitPrice(): ?string
    {
        return $this->unitPrice;
    }

    public function setUnitPrice(string $unitPrice): self
    {
        $this->unitPrice = $unitPrice;

        return $this;
    }
    /**
     * @ORM\Column(name="UnitsInStock", type="integer", length=40)
     */
    private $unitsInStock;

    public function getUnitsInStock(): ?int
    {
        return $this->unitsInStock;
    }

    public function setUnitsInStock(int $unitsInStock): self
    {
        $this->unitsInStock = $unitsInStock;

        return $this;
    }
    /**
     * @ORM\Column(name="UnitsOnOrder", type="integer", length=40)
     */
    private $unitsOnOrder;

    public function getUnitsOnOrder(): ?string
    {
        return $this->unitsOnOrder;
    }

    public function setUnitsOnOrder(string $unitsOnOrder): self
    {
        $this->unitsOnOrder = $unitsOnOrder;

        return $this;
    }
    /**
     * @ORM\Column(name="ReorderLevel", type="integer", length=40)
     */
    private $reorderLevel;

    public function getReorderLevel(): ?string
    {
        return $this->reorderLevel;
    }

    public function setReorderLevel(string $reorderLevel): self
    {
        $this->reorderLevel = $reorderLevel;

        return $this;
    }
    /**
     * @ORM\Column(name="Discontinued", type="boolean", length=40, nullable=false)
     */
    private $discontinued;

    public function getDiscontinued(): ?bool
    {
        return $this->discontinued;
    }

    public function setDiscontinued(boolean $discontinued): self
    {
        $this->discontinued = $discontinued;

        return $this;
    }
    /**
     * @var \Suppliers
     *
     * @ORM\ManyToOne(targetEntity="Suppliers", inversedBy="products")
     * @ORM\JoinColumn(name="SupplierId", referencedColumnName="SupplierId")
     *
     */
    private $suppliers;

    public function getSuppliers(): ?Suppliers
    {
        return $this->suppliers;
    }

    public function setSuppliers(?Suppliers $suppliers): self
    {
        $this->suppliers = $suppliers;

        return $this;
    }

}