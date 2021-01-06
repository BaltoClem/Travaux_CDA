package afpa.clement.org.gui;

import javafx.scene.Group;
import javafx.scene.control.*;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.MouseEvent;

public class CaseController {
    public TextField textfield1;
    public TitledPane choix_pane;
    public CheckBox couleur_fond_choice;
    public CheckBox couleur_texte_choice;
    public CheckBox casse_choice;
    public Label label1;
    public TitledPane fond_pane;
    public RadioButton fond_rouge_button;
    public RadioButton fond_bleu_button;
    public RadioButton fond_vert_button;
    public TitledPane texte_pane;
    public RadioButton texte_rouge_button;
    public RadioButton texte_noir_button;
    public RadioButton texte_blanc_button;
    public TitledPane casse_pane;
    public RadioButton casse_min_button;
    public RadioButton casse_maj_button;

    public void key_released1(KeyEvent keyEvent) {
        label1.setText(textfield1.getText());
    }
// if() pour si la case couleur de fond est cochée
    public void mouse_clicked_red(MouseEvent mouseEvent) {
        fond_rouge_button.setSelected(true);
        fond_bleu_button.setSelected(false);
        fond_vert_button.setSelected(false);
        label1.setStyle("-fx-background-color: red;");
    }

    public void mouse_clicked_blue(MouseEvent mouseEvent) {
        fond_rouge_button.setSelected(false);
        fond_bleu_button.setSelected(true);
        fond_vert_button.setSelected(false);
        label1.setStyle("-fx-background-color: blue;");
    }

    public void mouse_clicked_green(MouseEvent mouseEvent) {
        fond_rouge_button.setSelected(false);
        fond_bleu_button.setSelected(false);
        fond_vert_button.setSelected(true);
        label1.setStyle("-fx-background-color: green;");
    }
}
