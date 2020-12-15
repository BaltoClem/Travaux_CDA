package com.company;
import java.util.Scanner;

public class SomInter {
    public static void main(String[] args) {
        System.out.println("****  Somme d'un intervalle (15/12/2020) ****");

        Scanner scanner_inter = new Scanner(System.in);

        System.out.println("Veuillez saisir un premier nombre :");
        int int_1 = scanner_inter.nextInt();
        System.out.println("Veuillez saisir un deuxième nombre :");
        int int_2 = scanner_inter.nextInt();
        int result = 0;

        while(int_1 <= int_2){
            result = result + int_1;
            int_1 ++;
        }
        System.out.println("La somme de l'intervalle des deux entiers est de : " + result);
    }
}
