package afpa.clement.org.gui;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;

public class Form1Controller {
    @FXML
    private TextField nom;
    @FXML
    private Button button;
    @FXML
    private Label label;

    public void button_click1(MouseEvent actionEvent) {
       label.setText("Bonjour " + nom.getText());
    }
}
