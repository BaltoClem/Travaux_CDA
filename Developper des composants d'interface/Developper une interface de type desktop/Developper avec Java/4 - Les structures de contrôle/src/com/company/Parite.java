package com.company;
import java.util.Scanner;

public class Parite {

    public static void main(String[] args) {
        System.out.println("****  Parité (15/12/2020) ****");

        Scanner scanner_par = new Scanner(System.in) ;

        System.out.println("Veuillez rentrer un nombre :");
        int nb = scanner_par.nextInt();

        if(nb%2 == 0){
            System.out.println("Ce nombre est pair");
        }
        else{
            System.out.println("Ce nombre est impair");
        }
    }
}
