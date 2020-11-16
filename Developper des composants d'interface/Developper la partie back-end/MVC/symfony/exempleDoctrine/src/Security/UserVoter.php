<?php

namespace App\Security;

use App\Entity\User;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Authorization\Voter\Voter;

class UserVoter extends Voter {

    // Va déterminer selon quelles actions le voter sera appelé

    // Définition d'une constante contenant la/les action(s) à surveiller
    const EDIT = 'edit';

    // $attribut = action définie
    // $user, peut-être variable, on l'utilise ici car le contrôle se fait sur la modification d'un utilisateur.

    protected function supports($attribute, $subject)
    {
        // L'attribut n'est pas dans la liste
        if (!in_array($attribute, [self::EDIT])) {
            return false;
        }
        // Si $subject n'est pas une instance de User => pas dans la liste des utilisateurs
        if (!$subject instanceof User) {
            return false;
        }
        // Si retourne true, appel de voteOnAttribute()
        return true;
    }

    // Va définir quel utilisateur pourra effectuer cette action

    protected function voteOnAttribute($attribute, $subject, TokenInterface $token)
    {
        // Nous allons d'abord récupérer l'utilisateur courant
        $user = $token->getUser();

        // Nous vérifions si l'utilisateur passé en paramètre de la fonction est bien une instance de la classe User
        if (!$user instanceof User) {
            // L'utilisateur doit être connecté, sinon accès refusé
            return false;
        }

        switch ($attribute) {
            case self::EDIT:
                return $user->getId() == $subject->getId();
        }

        throw new \LogicException('This code should not be reached!');
    }
}