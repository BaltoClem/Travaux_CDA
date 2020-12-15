package com.company;
import java.util.Scanner;

public class Moyenne {
    public static void main (String[] args)
    {
        System.out.println("****  Calcul de la moyenne (15/12/2020) ****");

        Scanner scanner_moy = new Scanner(System.in) ;

        System.out.println("Indiquez la note du devoir surveillé");
        int ds = scanner_moy.nextInt() * 3;

        System.out.println("Indiquez la note de l'interrogation écrite");
        int ie = scanner_moy.nextInt() * 2;

        System.out.println("Indiquez la note des travaux pratiques");
        int tp = scanner_moy.nextInt();

        int moyenne = (ds + ie + tp) / 6;

        System.out.println("La moyenne des trois notes est de : " + moyenne);
    }
}
