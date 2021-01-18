package org.afpa;

import javafx.event.ActionEvent;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;

import static org.afpa.TableController.listStag;

public class AjoutController {
    public TextField nomField;
    public TextField prenomField;
    public TextField offreField;
    public TextField ageField;
    public Button btnAjout;

    public void ajout(ActionEvent actionEvent) {
            if (nomField.getText().length()>0 && prenomField.getText().length()>0 ){
                listStag.add(new Stagiaire(nomField.getText(),prenomField.getText(),offreField.getText(),Integer.parseInt(ageField.getText())));
            }
    }
}
