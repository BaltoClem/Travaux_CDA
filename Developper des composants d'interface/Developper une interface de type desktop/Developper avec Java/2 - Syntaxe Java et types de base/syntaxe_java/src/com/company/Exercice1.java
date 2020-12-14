package com.company;
import java.util.Scanner;

public class Exercice1 {
    final static double PI=3.1416;

    public static void main(String[] args)
    {

        System.out.println("**** Surface du cercle (14/12/2020) ****");

        Scanner scanner = new Scanner(System.in) ;

        double rayon;
        double aire;

        System.out.println("Entrer le rayon: ");
        rayon = scanner.nextDouble();
        aire = PI * (rayon*rayon);
        System.out.print("L'aire vaut: ");
        System.out.println(aire);
    }
}

