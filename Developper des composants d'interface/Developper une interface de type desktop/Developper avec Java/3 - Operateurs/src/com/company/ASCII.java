package com.company;
import java.util.Scanner;

public class ASCII {
    public static void main (String[] args)
    {
        System.out.println("****  ASCII (15/12/2020) ****");

        Scanner scanner_code = new Scanner(System.in) ;

        System.out.println("Veuillez saisir un code Unicode : ");
        int unicode = scanner_code.nextInt();

        System.out.println("Le caractère correspondant est : " + (char) unicode);

    }
}
