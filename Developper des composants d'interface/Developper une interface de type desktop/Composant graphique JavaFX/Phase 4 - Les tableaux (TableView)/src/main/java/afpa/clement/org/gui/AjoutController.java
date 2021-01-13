package afpa.clement.org.gui;

import afpa.clement.org.Client;
import javafx.event.ActionEvent;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

import static afpa.clement.org.gui.TabController.listClients;

public class AjoutController {
    public TextField nomField;
    public TextField prenomField;
    public TextField villeField;
    public Button btnAjout;
    public Button btnAnnul;
    public Button btnRetour;
    public VBox ajout_pane;

    public void ajout(ActionEvent actionEvent) {
        if (nomField.getText().length()>0 && prenomField.getText().length()>0){
            listClients.add(new Client(nomField.getText(),prenomField.getText(), villeField.getText()));
        }
    }

    public void annule(ActionEvent actionEvent) {
        nomField.setText("");
        prenomField.setText("");
        villeField.setText("");
    }

    public void retour(ActionEvent actionEvent) {
        Stage stage = (Stage) btnRetour.getScene().getWindow();
        stage.close();
    }
}
