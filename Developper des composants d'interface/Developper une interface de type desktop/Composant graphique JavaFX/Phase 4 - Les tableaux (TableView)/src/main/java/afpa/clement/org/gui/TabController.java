package afpa.clement.org.gui;

import afpa.clement.org.Client;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;


import java.net.URL;
import java.util.ResourceBundle;

public class TabController implements Initializable {
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
    public static ObservableList<Client> listClients = FXCollections.observableArrayList();



    @Override
    public void initialize(URL url, ResourceBundle rb) {
        refresh();
    }

    //initialisation du modèle
    public void refresh(){

        listClients.clear();
        listClients.addAll(
                new Client("Donald", "Duck", "Disney"),
                new Client("Mickey", "Mouse", "Disney")
        );

        //On rend le tableau non-éditable
        lst_clients.setEditable(false);

        lst_clients.setItems(listClients);

        // Jonction du tableau avec les données
        col_prenom.setCellValueFactory(new PropertyValueFactory<Client, String>("prenom"));
        col_nom.setCellValueFactory(new PropertyValueFactory<Client, String>("nom"));
        col_ville.setCellValueFactory(new PropertyValueFactory<Client, String>("ville"));

        // On indique au TableView quel modèle observer pour trouver les données
        lst_clients.setItems(listClients);
    }

}