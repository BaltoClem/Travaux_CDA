package com.company;
import java.util.Scanner;

public class ConversionTemperature {
    public static void main (String[] args)
    {
        System.out.println("****  Conversion de température Fahrenheit en Celsius (15/12/2020) ****");

        Scanner scanner_conv = new Scanner(System.in) ;

        System.out.println("Renseignez la température en degrés Fahrenheit :");
        double F = scanner_conv.nextInt();

        double C = 5 / 9.0 * F - 32;

        System.out.println("Vous avez renseigné la température suivante en degrés Fahrenheit : " + F);
        System.out.println("Sa valeur en degrés Celsius est : " + C);

    }
}
