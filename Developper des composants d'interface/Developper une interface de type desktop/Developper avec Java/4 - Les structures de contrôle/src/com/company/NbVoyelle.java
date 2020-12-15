package com.company;
import java.util.Scanner;

public class NbVoyelle {
    public static void main(String[] args) {
        System.out.println("****  Nombre de voyelles (15/12/2020) ****");

        Scanner scanner_voy = new Scanner(System.in);

        System.out.println("Veuillez saisir votre mot :");
        String mot = scanner_voy.nextLine();
        int voy = 0;

        for(int i = 0; i < mot.length(); i++){
            char c = mot.charAt(i);
            if(c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' || c == 'y'){
                voy++;
            }
        }
        System.out.println("Il y a " + voy + " voyelle(s) dans le mot " + mot);
    }
}
