<?php

namespace App\Entity;

use Customers;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="orders")
 */

class Orders
{
    //@ORM\Column(name="ProductId", type="integer", nullable=false) : permet de mapper l'attribut $id avec la colonne ProductId
    //@ORM\Id : spécifie que cet attribut représente l'Id (la clé primaire de la table).

    /**
     * @ORM\Column(name="OrderId", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    public function getId(): ?int
    {
        return $this->id;
    }
    /**
     * @var Customers
     *
     * @ORM\ManyToOne(targetEntity="Customers", inversedBy="orders")
     * @ORM\JoinColumn(name="CustomerId", referencedColumnName="CustomerId")
     *
     */
    private $customers;

    public function getCustomers(): ?Customers
    {
        return $this->customers;
    }

    public function setCustomers(?Customers $customers): self
    {
        $this->customers = $customers;

        return $this;
    }
}
