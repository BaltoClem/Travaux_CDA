package com.company;
import java.util.Scanner;

public class Triangle {
    public static void main(String[] args) {
        System.out.println("****  Dessin d'un triangle (15/12/2020) ****");

        Scanner scanner_tri = new Scanner(System.in);

        System.out.println("Veuillez sélectionner le nombre de lignes souhaitées :");
        int nbligne = scanner_tri.nextInt();

        for (int k = 0; k <= nbligne; k++)
        {
            for (int j = 0; j < nbligne-k; j++)
                System.out.print(" ");
            for (int i = 0; i < (k*2+1); i++)
                System.out.print("*");
            System.out.println("");
        }
    }
}
