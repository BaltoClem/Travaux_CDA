package afpa.clement.org.gui;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;


import java.net.URL;
import java.util.ResourceBundle;

public class TabController<Client>{
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

    ObservableList<afpa.clement.org.Client> model = FXCollections.observableArrayList();

    public void initialize(URL url, ResourceBundle rb) {
        //initialisation du modèle
        model.add(new afpa.clement.org.Client("Josh", "Homme", "Joshua Tree"));
        model.add(new afpa.clement.org.Client("Dave", "Grohl", "Warren"));
        model.add(new afpa.clement.org.Client("Krist", "Novoselic", "Compton"));
        model.add(new afpa.clement.org.Client("Robert", "Trujillo", "Santa Monica"));
        //On rend le tableau non-éditable
        lst_clients.setEditable(false);

        // Jonction du tableau avec les données
        col_prenom.setCellValueFactory(new PropertyValueFactory<>("prenom"));
        col_nom.setCellValueFactory(new PropertyValueFactory<>("nom"));
        col_ville.setCellValueFactory(new PropertyValueFactory<>("ville"));

        // On indique au TableView quel modèle observer pour trouver les données
        //lst_clients.setItems(model);
    }

}