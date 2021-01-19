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
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class ClientController implements Initializable {
    //Boutons du menu
    public Button btn_ajout;
    public Button btn_modif;
    public Button btn_suppr;

    //Liste des clients
    public TableView<Client> tab_clients;
    public TableColumn<Client, String> col_nom_client;
    public TableColumn<Client, String> col_prenom_client;

    //Fenêtre pour ajouter client
    public Group grp_details_ajout;
    public TextArea txtarea_details_ajout;
    public Label lbl_ajout_client;
    public TextField txt_nom_ajout;
    public TextField txt_prenom_ajout;
    public TextField txt_ville_ajout;
    public Button btn_ok_ajout;
    public Button bouton_annul_ajout;

    //Fenêtre pour modifier un client
    public Group grp_details_modif;
    public TextArea txtarea_details_modif;
    public Label lbl_modif_client;
    public TextField txt_nom_modif;
    public TextField txt_prenom_modif;
    public TextField txt_ville_modif;
    public Button btn_ok_modif;
    public Button bouton_annul_modif;


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
       grp_details_modif.setVisible(false);
    }

    public void afficheDetailsModif(MouseEvent mouseEvent) {
        grp_details_modif.setVisible(true);
        grp_details_ajout.setVisible(false);

    }

    public void afficheDetailsSuppr(MouseEvent mouseEvent) {
    }

    public void btn_ajout_client(MouseEvent mouseEvent) throws SQLException {

    /*if(txt_nom_ajout.getText().length()>0 && txt_prenom_ajout.getText().length()>0 && txt_ville_ajout.getText().length()>0){
        listClient.add(new Client(txt_nom_ajout.getText(), txt_prenom_ajout.getText(), "A définir", txt_ville_ajout.getText()));*/

        String dest = "jdbc:mysql://localhost:3306/hotel";
        Connection con = DriverManager.getConnection(dest, "root", "");
        PreparedStatement stm = con.prepareStatement("INSERT INTO client(cli_nom, cli_prenom, cli_adresse, cli_ville) VALUE (?, ?, 'A definir', ?)");

        stm.setString(1, txt_nom_ajout.getText());
        stm.setString(2, txt_prenom_ajout.getText());
        stm.setString(3, txt_ville_ajout.getText());
        stm.execute();
        stm.close();

        listClient.add(new Client(txt_nom_ajout.getText(),txt_prenom_ajout.getText()));
    }

    public void effaceRenseignement(MouseEvent mouseEvent) {
        txt_nom_ajout.setText("");
        txt_nom_modif.setText("");
        txt_prenom_ajout.setText("");
        txt_prenom_modif.setText("");
        txt_ville_ajout.setText("");
        txt_ville_modif.setText("");
    }

    public void afficheClient(MouseEvent mouseEvent) {
        Client client = tab_clients.getSelectionModel().getSelectedItem();
        txt_nom_modif.setText(client.getCli_nom());
        txt_prenom_modif.setText((client.getCli_prenom()));
        txt_ville_modif.setText(client.getCli_ville());
    }

    public void btn_modif_client(MouseEvent mouseEvent) throws SQLException {
        Client client = tab_clients.getSelectionModel().getSelectedItem();
        int client_id = client.getCli_id();
        String dest = "jdbc:mysql://localhost:3306/hotel";
        Connection con = DriverManager.getConnection(dest, "root", "");
        PreparedStatement stm2 = con.prepareStatement("UPDATE client SET cli_nom = ?, cli_prenom = ?, cli_ville = ? WHERE cli_id = ?");
        stm2.setString(1, txt_nom_modif.getText());
        stm2.setString(2, txt_prenom_modif.getText());
        stm2.setString(3, txt_ville_modif.getText());
        stm2.setInt(4, client_id);
        stm2.execute();
        stm2.close();

        listClient.remove(client);
        listClient.add(new Client(txt_nom_modif.getText(),txt_prenom_modif.getText()));
    }

}

