package org.afpa;

public class Stagiaire {
    private String nom;
    private String prenom;
    private String offre;
    private int age;


    public Stagiaire(String nom, String prenom, String offre, int age) {
        this.nom = nom;
        this.prenom = prenom;
        this.offre = offre;
        this.age = age;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getOffre() {
        return offre;
    }

    public void setOffre(String offre) {
        this.offre = offre;
    }
}
