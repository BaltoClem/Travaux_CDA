package com.company;
import java.util.Scanner;

public class Diviseur {
    public static void main (String[] args)
    {
        System.out.println("****  Diviseur (15/12/2020) ****");

        Scanner scanner_div = new Scanner(System.in) ;

        System.out.println("Première valeur :");
        int nX = scanner_div.nextInt();
        System.out.println("Seconde valeur :");
        int nY = scanner_div.nextInt();

        int result = nX / nY;

        System.out.println("Le résultat de la dvision est " + result);
    }
}
