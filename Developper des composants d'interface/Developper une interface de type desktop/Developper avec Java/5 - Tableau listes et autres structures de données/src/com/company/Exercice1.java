package com.company;
import java.util.Arrays;
import java.util.Scanner;

public class Exercice1 {

    public static void main(String[] args) {
        System.out.println("****  Exercice 1 (15/12/2020) ****");

        Scanner scanner_1 = new Scanner(System.in);

        System.out.println("Veuillez saisir la taille du tableau :");
        int taille = scanner_1.nextInt();
        int[] tab = new int[taille];

        for(int i=0; i < taille; i++){
            System.out.println("Veuillez renseigner une valeur pour la ligne " + i);
            int val = scanner_1.nextInt();
            tab[i] = val;
        }
        System.out.println(Arrays.toString(tab));
    }
}
