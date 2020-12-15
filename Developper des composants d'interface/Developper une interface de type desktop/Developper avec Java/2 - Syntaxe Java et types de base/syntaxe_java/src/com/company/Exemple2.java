package com.company;
import java.util.Scanner;

public class Exemple2
{
    final static double PI=3.1416;

    public static void main(String[] args)
    {

        System.out.println("**** Périmètre d'un cercle (14/12/2020) ****");

        Scanner scanner = new Scanner(System.in) ;

        double rayon;
        double perimetre;

        System.out.println("Entrer le rayon: ");
        rayon = scanner.nextDouble();
        perimetre = 2 * PI * rayon;
        System.out.print("Le périmètre vaut: ");
        System.out.println(perimetre);
    }
}
