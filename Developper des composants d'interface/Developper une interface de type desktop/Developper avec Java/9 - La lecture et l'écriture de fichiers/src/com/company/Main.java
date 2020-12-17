package com.company;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.List;

public class Main {

    public static void main(String[] args) {
        String home = System.getProperty("user.dir");

        Path path = Paths.get(home, "unfichier.txt");

        //on peut tester si le fichier existe
        if (Files.exists(path)) {
            System.out.println("le fichier existe déjà !!!");
        } else {
            System.out.println("le fichier n'existe pas");
        }

        //créons quelques lignes
        List<String> maListe = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            maListe.add(String.format("bonjour %d fois",i));
        }
        //écrivons les lignes dans le fichier
        for (String chaine : maListe) {
            try {
                Files.writeString(path,chaine + System.lineSeparator(), StandardOpenOption.CREATE, StandardOpenOption.APPEND);
            } catch (IOException e) {
                System.out.println(e.getMessage());
            }
        }

        //Maintenant lisons le contenu du fichier
        List<String> autreListe = new ArrayList<>();
        try {
            autreListe = Files.readAllLines(path);
        } catch (IOException e) {
            e.printStackTrace();
        }

        for (String ligne: autreListe) {
            System.out.println(ligne);
        }
    }
}