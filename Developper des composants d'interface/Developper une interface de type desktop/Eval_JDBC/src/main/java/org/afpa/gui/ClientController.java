package org.afpa.gui;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
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
    public TextArea txtarea_details;
    public TableView<Client> tab_clients;
    public TableColumn<Client, String> col_nom_client;
    public TableColumn<Client, String> col_prenom_client;

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
    }

    public void afficheDetails(MouseEvent mouseEvent) {
    }
}
