<?php

namespace App\Form;

use App\Entity\Products;
use App\Entity\Suppliers;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Regex;

class ProductsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('ProductName', TextType::class, [
                'label' => 'Nom du produit',
                'help' => 'Indiquez ici le nom complet du produit',
                'attr' => [
                    'placeholder' => 'Produit'
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[A-Za-zéèàçâêûîôäëüïö\_\-\s]+$/',
                        'message' => 'Caratère(s) non valide(s)'
                    ]),
                ]
            ])
            ->add('CategoryID', IntegerType::class, [
                'label' => 'N° de Catégorie',
                'help' => 'Indiquez ici le numéro de la catégorie',
                'attr' => [
                    'placeholder' => 'N° Catégorie'
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[1-9]+$/',
                        'message' => 'Caratère(s) non valide(s)'
                    ]),
                ]
            ])
            ->add('QuantityPerUnit', TextType::class, [
                'label' => 'Quantité en unité',
                'help' => 'Indiquez ici la quantité en unité',
                'attr' => [
                    'placeholder' => 'Quantité en unité'
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-9A-Za-zéèàçâêûîôäëüïö\_\-\s]+$/',
                        'message' => 'Caratère(s) non valide(s)'
                    ]),
                ]
            ])
            ->add('UnitPrice', NumberType::class , [
                'label' => 'Prix Unitaire',
                'help' => 'Indiquez ici le prix unitaire',
                'attr' => [
                    'placeholder' => 'Prix unitaire'
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-9.]+$/',
                        'message' => 'Caratère(s) non valide(s)'
                    ]),
                ]
            ])
            ->add('UnitsInStock', IntegerType::class , [
                'label' => 'Unités en stock',
                'help' => 'Indiquez ici le nombre d\'unités stock',
                'attr' => [
                    'placeholder' => 'Stock'
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-9]+$/',
                        'message' => 'Caratère(s) non valide(s)'
                    ]),
                ]
            ])
            ->add('UnitsOnOrder', IntegerType::class , [
                'label' => 'Unités en commande',
                'help' => 'Indiquez ici les unités en commande',
                'attr' => [
                    'placeholder' => 'Unités en commande'
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-9]+$/',
                        'message' => 'Caratère(s) non valide(s)'
                    ]),
                ]
            ])
            ->add('ReorderLevel', IntegerType::class , [
                'label' => 'Niveau d\'alerte de commande',
                'help' => 'Indiquez ici le niveau d\'alerte de commande',
                'attr' => [
                    'placeholder' => 'Alerte de commande'
                ],
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[0-9]+$/',
                        'message' => 'Caratère(s) non valide(s)'
                    ]),
                ]
            ])
            ->add('Discontinued', CheckboxType::class, [
                'label' => 'Produit actif',
                'help' => 'Indiquez ici si le produit est actif ou non',
                'attr' => [
                    'placeholder' => 'Produit actif'
                ],
                ])
            ->add('SupplierID', EntityType::class, [
                'class' => Suppliers::class,
                'label' => 'Nom du fournisseur',
                'help' => 'Sélectionnez le nom du fournisseur',
                'placeholder' => 'Nom du fournisseur',
            ]);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Products::class,
        ]);
    }
}
