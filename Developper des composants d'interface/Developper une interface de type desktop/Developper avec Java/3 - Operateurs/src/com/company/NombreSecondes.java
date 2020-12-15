package com.company;
import java.util.Scanner;

public class NombreSecondes {
    public static void main (String[] args)
    {
        System.out.println("****  Conversion d'un nombre de secondes en HH:MM:SS (15/12/2020) ****");

        Scanner scanner_sec = new Scanner(System.in) ;

        System.out.println("Indiquez le nombre de secondes:");

        int secondes = scanner_sec.nextInt();

        int sec = secondes % 60;
        int minute = secondes / 60 % 60;
        int heure = secondes / 60 / 60 % 24;

        System.out.println("Le nombre de secondes correspondant à " + heure + " heure(s), " + minute + " minute(s), " + sec + " seconde(s)" );

    }
}
