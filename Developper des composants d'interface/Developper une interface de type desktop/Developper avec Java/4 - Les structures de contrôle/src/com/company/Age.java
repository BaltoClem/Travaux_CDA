package com.company;
import java.util.Calendar;
import java.util.Scanner;

public class Age {
    public static void main(String[] args) {
        System.out.println("****  Age (15/12/2020) ****");

        Scanner scanner_age = new Scanner(System.in);

        System.out.println("Renseignez votre année de naissance :");
        int year = scanner_age.nextInt();
        Calendar c = Calendar.getInstance();
        int year_t = c.get(Calendar.YEAR);
        int age = year_t - year;

        System.out.println("Votre âge : " + age + " an(s)");

        if(age<18){
            System.out.println("Vous êtes mineur");
        }
        else{
            System.out.println("Vous êtes majeur");
        }
    }
}
