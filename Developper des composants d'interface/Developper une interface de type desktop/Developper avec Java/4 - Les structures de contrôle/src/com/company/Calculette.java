package com.company;
import java.util.Scanner;

public class Calculette {
    public static void main(String[] args) {
        System.out.println("****  Calculette (15/12/2020) ****");

        Scanner scanner_calc = new Scanner(System.in);

        System.out.println("Saisissez votre premier entier :");
        int nb_1= scanner_calc.nextInt();
        System.out.println("Indiquez un opérateur:");
        String oper = scanner_calc.next();
        System.out.println("Saisissez votre deuxième entier :");
        int nb_2= scanner_calc.nextInt();

        int add = nb_1 + nb_2;
        int soustr = nb_1 - nb_2;
        int multi = nb_1 * nb_2;
        int div = nb_1/nb_2;

        switch (oper) {
            case "+":
                System.out.println("Résultat de l'addition : " + add);
                break;
            case "-":
                System.out.println("Résultat de la soustraction : " + soustr);
                break;
            case "*":
                System.out.println("Résultat de la multiplication : " + multi);
                break;
            case "/":
                System.out.println("Résultat de la division :" + div);
                break;
            default:
                System.out.println("Vous n'avez pas sélectionner un opérateur valide");
        }

    }
}
