package afpa.clement.org;

public class Client {
    private String col_nom;
    private String col_prenom;
    private String col_ville;

    /**
     *Constructeur par défaut
     */
    public Client() {}

    /**
     * Constructeur avec paramètres
     * @param n : nom du client
     * @param p :prénom du client
     * @param v :ville du client
     */
    public Client(String p, String n, String v) {
        this.col_prenom = p;
        this.col_nom = n;
        this.col_ville = v;
    }

    public String getCol_ville() {
        return col_ville;
    }

    public void setCol_ville(String col_ville) {
        this.col_ville = col_ville;
    }

    public String getCol_prenom() {
        return col_prenom;
    }

    public void setCol_prenom(String col_prenom) {
        this.col_prenom = col_prenom;
    }

    public String getCol_nom() {
        return col_nom;
    }

    public void setCol_nom(String col_nom) {
        this.col_nom = col_nom;
    }
}
