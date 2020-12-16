package com.company;
import java.util.ArrayList;
import java.util.Scanner;

public class Exercice2 {
    public static void main(String[] args) {
        System.out.println("****  Exercice 2 (16/12/2020) ****");

        Scanner scanner_2 = new Scanner(System.in);

        ArrayList<String> tab = new ArrayList<>();

        tab.add("Audrey");
        tab.add("Aurélien");
        tab.add("Flavien");
        tab.add("Jérémy");
        tab.add("Laurent");
        tab.add("Melik");
        tab.add("Nouara");
        tab.add("Salem");
        tab.add("Samuel");
        tab.add("Stéphane");
        tab.add("Hervé");
        tab.add("Fodé");
        tab.add("Marion");
        tab.add("Manu");
        tab.add("Germain");
        tab.add("François");
        tab.add("Pauline");
        tab.add("Margot");
        tab.add("Clément");
        tab.add("Caroline");

        System.out.println("Saisissez un prénom :");
        String prenom = scanner_2.next();

        for (String s : tab) {
            if(prenom.equals(s)){
                tab.set(tab.indexOf(prenom), " ");
                System.out.println(tab);
            }
            }
        }
    }
