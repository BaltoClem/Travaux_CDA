package com.company;
import java.util.Scanner;

public class SomEntierInf {
    public static void main(String[] args) {
        System.out.println("****  Somme des Entiers Inférieurs à N (15/12/2020) ****");

        Scanner scanner_entInf = new Scanner(System.in);

        System.out.println("Veuillez saisir un entier :");
        int nb = scanner_entInf.nextInt();
        int somme = 0;

        for(int i = 1; i <= nb ; i++){
            somme = somme + i;
        }
        System.out.println("La somme des entiers inférieurs à N est de : " + somme);
    }
}