<?php

namespace App\Entity;

use App\Repository\CommentsRepository;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;
use Symfony\Component\Serializer\Annotation\Groups;
use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;

/**
 * @ORM\Entity(repositoryClass=CommentsRepository::class)
 * @ApiResource(
 *     normalizationContext={
 *     "groups"={"read:comment"},
 *     "enable_max_depth"=true
 *     },
 *     attributes={
 *     "order"={"date":"DESC"}
 *     },
 *     itemOperations={
 *      "get"={
 *          "normalization_context"={"groups"={"read:comment", "read:comment:full"}}
 *     },},
 *     collectionOperations={
 *       "post"={
 *          "normalization_context"={"groups"={"read:comment", "read:comment:full"}},
 *     },
 *       "get"={
 *          "normalization_context"={"groups"={"read:comment", "read:comment:full"}},
 *     }
 *     }
 * )
 * @ApiFilter(SearchFilter::class, properties={"product": "exact"})
 */
class Comments
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Groups({"read:comment"})
     */
    private $content;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     * * @Groups({"read:comment"})
     */
    private $date;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $updateDate;

    /**
     * @ORM\ManyToOne(targetEntity=Products::class, inversedBy="comments")
     * @Groups({"read:comment"})
     */
    private $products;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="comments")
     * @Groups({"read:comment"})
     */
    private $user;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getContent(): ?string
    {
        return $this->content;
    }

    public function setContent(?string $content): self
    {
        $this->content = $content;

        return $this;
    }

    public function getDate(): ?\DateTimeInterface
    {
        return $this->date;
    }

    public function setDate(?\DateTimeInterface $date): self
    {
        $this->date = $date;

        return $this;
    }

    public function getUpdateDate(): ?\DateTimeInterface
    {
        return $this->updateDate;
    }

    public function setUpdateDate(?\DateTimeInterface $updateDate): self
    {
        $this->updateDate = $updateDate;

        return $this;
    }

    public function getProducts(): ?Products
    {
        return $this->products;
    }

    public function setProducts(?Products $products): self
    {
        $this->products = $products;

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): self
    {
        $this->user = $user;

        return $this;
    }
}
