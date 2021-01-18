package org.afpa.DAL;

public class Client {

    private int cli_id;
    private String cli_nom;
    private String cli_prenom;
    private String cli_adresse;
    private String cli_ville;

    public Client(){
    }

    public Client(int cli_id, String cli_nom, String cli_prenom, String cli_adresse, String cli_ville){
        this.cli_id = cli_id;
        this.cli_nom = cli_nom;
        this.cli_prenom = cli_prenom;
        this.cli_adresse = cli_adresse;
        this.cli_ville = cli_ville;
    }
}
