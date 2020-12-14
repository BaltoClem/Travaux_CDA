package com.company;
import java.util.Scanner;

public class Exercice2 {

    public static void main(String[] args)
    {
        System.out.println("**** Echange de valeurs entre nX et nY (14/12/2020) ****");

        Scanner scanner = new Scanner(System.in) ;

        int nX;
        int nY;

        System.out.println("Entrer la valeur de 'nX' : ");
        nX = scanner.nextInt();
        System.out.println("Entrer la valeur de 'nY' : ");
        nY = scanner.nextInt();

        System.out.println("'nX' vaut: " + nX);
        System.out.println("'nY' vaut: " + nY);

        nX = nX + nY;
        nY = nX - nY;
        nX = nX - nY;

        System.out.println("Inversement, 'nX' vaut désormais: " + nX);
        System.out.print("Inversement, 'nY' vaut désormais: " + nY);


    }

}
