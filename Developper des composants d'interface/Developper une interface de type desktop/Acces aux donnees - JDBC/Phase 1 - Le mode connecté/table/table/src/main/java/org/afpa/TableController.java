package org.afpa;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import java.util.Stack;

public class TableController implements Initializable {
    public TableView<Stagiaire> tableStag;
    public TableColumn<Stagiaire,String> colNom;
    public TableColumn<Stagiaire,String> colPrenom;
    public TableColumn<Stagiaire,String> colOffre;
    public static ObservableList<Stagiaire> listStag = FXCollections.observableArrayList();
    public Label lblNom;
    public Label lblPrenom;
    public Label lblOffre;
    public Label lblAge;
    public Button btnAjout;


    @Override
    public void initialize(URL location, ResourceBundle resources) {
        refresh();

    }

    public void refresh(){
        listStag.clear();
        listStag.addAll(
                new Stagiaire("Duck","Donald","13",102),
                new Stagiaire("Mouse","Mickey","14",300)
        );
        listStag.add(new Stagiaire("Sipiere","Germain","0",42));

        tableStag.setItems(listStag);

        colNom.setCellValueFactory(new PropertyValueFactory<Stagiaire,String>("nom"));
        colPrenom.setCellValueFactory(new PropertyValueFactory<Stagiaire,String>("prenom"));
        colOffre.setCellValueFactory(new PropertyValueFactory<Stagiaire,String>("offre"));
    }

    public void afficheDetail(MouseEvent mouseEvent) {
        Stagiaire stg = tableStag.getSelectionModel().getSelectedItem();
        lblNom.setText(stg.getNom());
        lblPrenom.setText(stg.getPrenom());
        lblOffre.setText(stg.getOffre());
        lblAge.setText( "" + stg.getAge());

    }

    public void ouvreAjout(ActionEvent actionEvent) throws IOException {
        Parent ajout = FXMLLoader.load(getClass().getResource("ajout.fxml"));
        Scene scene = new Scene(ajout);
        Stage stage = new Stage();
        stage.setScene(scene);
        stage.show();
    }
}
