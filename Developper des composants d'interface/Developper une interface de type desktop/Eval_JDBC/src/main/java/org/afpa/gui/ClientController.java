package org.afpa.gui;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.Initializable;
import javafx.scene.Group;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import org.afpa.DAL.Client;
import org.afpa.DAL.ClientDAO;

import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class ClientController implements Initializable {
    public Button btn_ajout;
    public Button btn_modif;
    public Button btn_suppr;
    public TableView<Client> tab_clients;
    public TableColumn<Client, String> col_nom_client;
    public TableColumn<Client, String> col_prenom_client;
    public Group grp_details_ajout;
    public TextArea txtarea_details_ajout;
    public Label lbl_details;
    public TextField txt_nom_ajout;
    public TextField txt_prenom_ajout;
    public TextField txt_ville_ajout;

    ObservableList<Client> listClient = FXCollections.observableArrayList(new Client());

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        try{
            ClientDAO clientDAO = new ClientDAO();
            listClient.addAll(clientDAO.listAll());
        } catch (SQLException throwables){
            throwables.printStackTrace();
            Alert alert = new Alert(Alert.AlertType.WARNING);
            alert.setContentText("La base de données est injoignable...");
        }
            tab_clients.setItems(listClient);

        col_nom_client.setCellValueFactory(new PropertyValueFactory<Client, String>("cli_nom"));
        col_prenom_client.setCellValueFactory(new PropertyValueFactory<Client, String>("cli_prenom"));
    }

    public void afficheDetailsAjout(MouseEvent mouseEvent) {
       grp_details_ajout.setVisible(true);
       
    }

    public void afficheDetailsModif(MouseEvent mouseEvent) {
    }

    public void afficheDetailsSuppr(MouseEvent mouseEvent) {
    }
}
