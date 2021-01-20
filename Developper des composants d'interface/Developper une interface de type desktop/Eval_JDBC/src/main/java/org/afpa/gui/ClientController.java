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
import org.afpa.DAL.HotelDB;

import java.net.URL;
import java.sql.*;
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

    //Fenêtre pour supprimer un client
    public Group grp_details_suppr;
    public TextArea txtarea_details_suppr;
    public Label lbl_suppr_client;
    public TextField txt_nom_suppr;
    public TextField txt_prenom_suppr;
    public TextField txt_ville_suppr;
    public Button btn_ok_suppr;
    public Button bouton_annul_suppr;


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

    //Sélection des fenêtres désirées
    public void afficheDetailsAjout(MouseEvent mouseEvent) {
       grp_details_ajout.setVisible(true);
       grp_details_modif.setVisible(false);
       grp_details_suppr.setVisible(false);
    }

    public void afficheDetailsModif(MouseEvent mouseEvent) {
        grp_details_modif.setVisible(true);
        grp_details_ajout.setVisible(false);
        grp_details_suppr.setVisible(false);
    }

    public void afficheDetailsSuppr(MouseEvent mouseEvent) {
        grp_details_suppr.setVisible(true);
        grp_details_ajout.setVisible(false);
        grp_details_modif.setVisible(false);

    }

    //Lorsque l'utilisateur appuie sur ok pour ajouter un client
    public void btn_ajout_client(MouseEvent mouseEvent) throws SQLException {

       /* String dest = "jdbc:mysql://localhost:3306/hotel";
        Connection con = DriverManager.getConnection(dest, "root", "");*/

        if(txt_nom_ajout.getText().length()>0 && txt_prenom_ajout.getText().length()>0 && txt_ville_ajout.getText().length()>0) {
            try (Connection con = HotelDB.getCon()) {
                PreparedStatement stm = con.prepareStatement("INSERT INTO client(cli_nom, cli_prenom, cli_adresse, cli_ville) VALUE (?, ?, 'A definir', ?)");

                stm.setString(1, txt_nom_ajout.getText());
                stm.setString(2, txt_prenom_ajout.getText());
                stm.setString(3, txt_ville_ajout.getText());

                stm.execute();
                stm.close();

                //Refresh de la TableView
                //tab_clients.refresh();
                listClient.add(new Client(txt_nom_ajout.getText(), txt_prenom_ajout.getText()));

                //affiche une alerte pour valider l'action
                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Validation");
                alert.setHeaderText("Création du nouveau client");
                alert.setContentText("Le client a bien été ajouté.");
                alert.showAndWait();

            }
            catch (SQLException throwables) {
                throwables.printStackTrace();
                Alert alert = new Alert(Alert.AlertType.WARNING);
                alert.setContentText("La base de données est injoignable...");
            }
        }
        else{
            Alert alert = new Alert(Alert.AlertType.WARNING);
            alert.setTitle("Erreur");
            alert.setHeaderText("Création du nouveau client");
            alert.setContentText("Certaines informations ne sont pas renseignées");

            alert.showAndWait();
        }
    }

    //Lorsque l'utilisateur appuie sur "ok" pour modifier un client
    public void btn_modif_client(MouseEvent mouseEvent) throws SQLException {

        if(txt_nom_modif.getText().length()>0 && txt_prenom_modif.getText().length()>0 && txt_ville_modif.getText().length()>0) {

            Client client = tab_clients.getSelectionModel().getSelectedItem();
            int client_id = client.getCli_id();

        /*String dest = "jdbc:mysql://localhost:3306/hotel";
        Connection con = DriverManager.getConnection(dest, "root", "");*/
            try (Connection con = HotelDB.getCon()) {
                PreparedStatement stm2 = con.prepareStatement("UPDATE client SET cli_nom = ?, cli_prenom = ?, cli_ville = ? WHERE cli_id = ?");
                stm2.setString(1, txt_nom_modif.getText());
                stm2.setString(2, txt_prenom_modif.getText());
                stm2.setString(3, txt_ville_modif.getText());
                stm2.setInt(4, client_id);
                stm2.execute();
                stm2.close();

                //Refresh de la TableView
                //tab_clients.refresh();
                listClient.remove(client);
                listClient.add(new Client(txt_nom_modif.getText(), txt_prenom_modif.getText()));

                //affiche une alerte pour valider l'action
                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Validation");
                alert.setHeaderText("Modification du client");
                alert.setContentText("Le client a bien été modifié.");
                alert.showAndWait();

            }
            catch (SQLException throwables) {
                throwables.printStackTrace();
                Alert alert = new Alert(Alert.AlertType.WARNING);
                alert.setContentText("La base de données est injoignable...");
            }
        }
    }

    //Lorsque l'utilisateur appuie sur "ok" pour supprimer un client
    public void btn_suppr_client(MouseEvent mouseEvent) throws SQLException {

        Client client = tab_clients.getSelectionModel().getSelectedItem();
        int client_id = client.getCli_id();

        /*String dest = "jdbc:mysql://localhost:3306/hotel";
        Connection con = DriverManager.getConnection(dest, "root", "");*/

        try (Connection con = HotelDB.getCon()) {
            PreparedStatement stm3 = con.prepareStatement("DELETE FROM client WHERE cli_id = ?");
            stm3.setInt(1, client_id);
            stm3.execute();
            stm3.close();

            //Refresh de la TableView
            //tab_clients.refresh();
            listClient.remove(client);

            txt_nom_suppr.setText("");
            txt_prenom_suppr.setText("");
            txt_ville_suppr.setText("");

            //affiche une alerte pour valider l'action
            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle("Validation");
            alert.setHeaderText("Suppression du client");
            alert.setContentText("Le client a bien été supprimé.");
            alert.showAndWait();
        }
        catch (SQLException throwables){
            throwables.printStackTrace();
            Alert alert = new Alert(Alert.AlertType.WARNING);
            alert.setContentText("La base de données est injoignable...");
        }
    }

    //Affichage des différents renseignements du client après avoir cliqué sur la ligne coorespondante du TableView
    public void afficheClient(MouseEvent mouseEvent) {

        Client client = tab_clients.getSelectionModel().getSelectedItem();
        txt_nom_modif.setText(client.getCli_nom());
        txt_nom_suppr.setText(client.getCli_nom());
        txt_prenom_modif.setText(client.getCli_prenom());
        txt_prenom_suppr.setText(client.getCli_prenom());
        txt_ville_modif.setText(client.getCli_ville());
        txt_ville_suppr.setText(client.getCli_ville());
    }

    //Efface les données rentrées par l'utilisateur avec un clic sur "Annuler"
    public void effaceRenseignement(MouseEvent mouseEvent) {

        txt_nom_ajout.setText("");
        txt_nom_modif.setText("");
        txt_nom_suppr.setText("");
        txt_prenom_ajout.setText("");
        txt_prenom_modif.setText("");
        txt_prenom_suppr.setText("");
        txt_ville_ajout.setText("");
        txt_ville_modif.setText("");
        txt_ville_suppr.setText("");
    }
}

