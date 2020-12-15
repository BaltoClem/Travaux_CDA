package com.company;
import java.util.Scanner;

public class Additionneur {
    public static void main (String[] args)
    {
        System.out.println("****  Additionneur (15/12/2020) ****");

        Scanner scanner_add = new Scanner(System.in) ;

        System.out.println("Première valeur :");
        int nX = scanner_add.nextInt();
        System.out.println("Seconde valeur :");
        int nY = scanner_add.nextInt();

        int result = nX + nY;

        System.out.println("Le résultat de l'addition est " + result);
    }
}
