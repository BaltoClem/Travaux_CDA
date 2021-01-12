package afpa.clement.org;

public class Client {
    private String nom;
    private String prenom;
    private String ville;

    /**
     *Constructeur par défaut
     */
    public Client() {}

    /**
     * Constructeur avec paramètres
     * @param nom : nom du client
     * @param prenom :prénom du client
     * @param ville :ville du client
     */
    public Client(String prenom, String nom, String ville) {
        this.prenom = prenom;
        this.nom = nom;
        this.ville = ville;
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

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }
}
