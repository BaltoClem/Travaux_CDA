package org.afpa.gui;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TextArea;
import org.afpa.DAL.Client;
import org.afpa.DAL.ClientDAO;

import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class ClientController implements Initializable {
    public TableColumn tab_client;
    public Button btn_ajout;
    public Button btn_modif;
    public Button btn_suppr;
    public TextArea txtarea_details;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
    }
}
