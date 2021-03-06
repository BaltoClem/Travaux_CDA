package org.afpa.DAL;

public class Client {


    private int cli_id;
    private String cli_nom;
    private String cli_prenom;
    private String cli_adresse;
    private String cli_ville;

    public Client(){
    }

    public Client(String cli_nom, String cli_prenom, String cli_adresse, String cli_ville){

        this.cli_nom = cli_nom;
        this.cli_prenom = cli_prenom;
        this.cli_adresse = cli_adresse;
        this.cli_ville = cli_ville;
    }

    public Client(String cli_nom, String cli_prenom) {
        this.cli_nom = cli_nom;
        this.cli_prenom = cli_prenom;
    }

    public Client(int cli_id, String cli_nom, String cli_prenom, String cli_adresse, String cli_ville) {
        this.cli_id = cli_id;
        this.cli_nom = cli_nom;
        this.cli_prenom = cli_prenom;
        this.cli_adresse = cli_adresse;
        this.cli_ville = cli_ville;
    }

    public int getCli_id() {
        return cli_id;
    }

    public void setCli_id(int cli_id) {
        this.cli_id = cli_id;
    }

    public String getCli_nom() {
        return cli_nom;
    }

    public void setCli_nom(String cli_nom) {
        this.cli_nom = cli_nom;
    }

    public String getCli_prenom() {
        return cli_prenom;
    }

    public void setCli_prenom(String cli_prenom) {
        this.cli_prenom = cli_prenom;
    }

    public String getCli_adresse() {
        return cli_adresse;
    }

    public void setCli_adresse(String cli_adresse) {
        this.cli_adresse = cli_adresse;
    }

    public String getCli_ville() {
        return cli_ville;
    }

    public void setCli_ville(String cli_ville) {
        this.cli_ville = cli_ville;
    }
}
