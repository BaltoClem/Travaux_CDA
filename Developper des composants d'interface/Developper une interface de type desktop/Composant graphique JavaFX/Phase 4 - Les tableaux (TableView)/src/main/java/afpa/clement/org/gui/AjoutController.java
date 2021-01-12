package afpa.clement.org.gui;

import afpa.clement.org.Client;
import javafx.event.ActionEvent;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;

import static afpa.clement.org.gui.TabController.listClients;

public class AjoutController {
    public TextField nomField;
    public TextField prenomField;
    public TextField villeField;
    public Button btnAjout;

    public void ajout(ActionEvent actionEvent) {
        if (nomField.getText().length()>0 && prenomField.getText().length()>0){
            listClients.add(new Client(nomField.getText(),prenomField.getText(), villeField.getText()));
        }
    }
}
