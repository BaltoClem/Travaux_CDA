package afpa.clement.org.gui;

import javafx.fxml.FXML;
import javafx.scene.control.*;

public class TabController<Client> {
    @FXML
    private TableView<Client> lst_clients;
    @FXML
    private TableColumn<Client, String> col_prenom;
    @FXML
    private TableColumn<Client, String> col_nom;
    @FXML
    private TableColumn<Client, String> col_ville;
    public Label label_prenom;
    public Label title_tab;
    public TextField textfield_prenom;
    public Label label_nom;
    public TextField textfield_nom;
    public Label label_ville;
    public TextField textfield_ville;
    public Button btn_sauver;
    public Button btn_supprimer;
    public Button btn_annuler;
}
