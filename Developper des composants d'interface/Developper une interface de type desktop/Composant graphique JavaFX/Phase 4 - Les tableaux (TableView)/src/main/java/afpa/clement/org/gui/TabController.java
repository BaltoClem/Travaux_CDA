package afpa.clement.org.gui;

import afpa.clement.org.Client;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;


import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class TabController implements Initializable {
    public Label lbl_prenom;
    public Label lbl_ville;
    public Label lbl_nom;
    public TableView<Client> lst_clients;
    public TableColumn<Client, String> col_prenom;
    public TableColumn<Client, String> col_nom;
    public TableColumn<Client, String> col_ville;
    public Label label_prenom;
    public Label title_tab;
    //public TextField textfield_prenom;
    public Label label_nom;
    //public TextField textfield_nom;
    public Label label_ville;
    //public TextField textfield_ville;
    public static ObservableList<Client> listClients = FXCollections.observableArrayList();
    public Button btn_ajout;


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

    public void afficheDetail(MouseEvent mouseEvent) {
        Client client = lst_clients.getSelectionModel().getSelectedItem();
        lbl_nom.setText(client.getNom());
        lbl_prenom.setText(client.getPrenom());
        lbl_ville.setText(client.getVille());
    }

    public void ouvreAjout(MouseEvent mouseEvent) throws IOException {
        Parent ajout = FXMLLoader.load(getClass().getResource("/afpa/clement/org/gui/ajout.fxml"));
        Scene scene = new Scene(ajout);
        Stage stage = new Stage();
        stage.setScene(scene);
        stage.show();
    }

    public void supprClient(MouseEvent mouseEvent) {
       int ind_client = lst_clients.getSelectionModel().getSelectedIndex();
       listClients.remove(ind_client);
    }
}