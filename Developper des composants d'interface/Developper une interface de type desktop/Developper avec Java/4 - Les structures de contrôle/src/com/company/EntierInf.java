package com.company;
import java.util.Scanner;

public class EntierInf {
    public static void main(String[] args) {
        System.out.println("****  Entiers Inférieurs à N (15/12/2020) ****");

        Scanner scanner_entInf = new Scanner(System.in);

        System.out.println("Veuillez saisir un entier :");
        int nb = scanner_entInf.nextInt();

        do{
            System.out.println(nb);
            nb--;
        }
        while(nb > 0);
    }
}
