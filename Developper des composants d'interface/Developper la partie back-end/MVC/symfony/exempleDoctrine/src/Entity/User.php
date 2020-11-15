<?php

namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity(repositoryClass=UserRepository::class)
 */
class User implements UserInterface
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $email;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $password;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $role;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    public function getRole(): ?string
    {
        return $this->role;
    }

    public function setRole(string $role): self
    {
        $this->role = $role;

        return $this;
    }

    // Méthode qui retourne un tableau des roles des différents utilisateurs
    public function getRoles()
    {
        if ($this->role == "administrateur")
            return ["ROLE_ADMIN"];
        if ($this->role == "client")
            return ["ROLE_USER"];
        return [];
    }

    // Méthode utiliser pour certaines méthodes de chiffrement
    public function getSalt()
    {
        return "";
    }

    // Méthode qui retourne l'identifiant utiliser pour l'authentification
    public function getUsername()
    {
        return $this->getEmail();
    }

    // Méthode qui permet d'effacer des informations sensibles (mot de passe par exemple) qui aurait pu être stocké dans l'entité.
    public function eraseCredentials()
    {
        // TODO: Implement eraseCredentials() method.
    }
}
