package afpa.clement.org.gui;

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

    public void mouse_clicked_red(MouseEvent mouseEvent) {
        fond_rouge_button.setSelected(true);
        fond_bleu_button.setSelected(false);
        fond_vert_button.setSelected(false);
        if(couleur_fond_choice.isSelected()) {
            label1.setStyle("-fx-background-color: red;");
        }
    }

    public void mouse_clicked_blue(MouseEvent mouseEvent) {
        fond_rouge_button.setSelected(false);
        fond_bleu_button.setSelected(true);
        fond_vert_button.setSelected(false);
        if(couleur_fond_choice.isSelected()) {
            label1.setStyle("-fx-background-color: blue;");
        }
    }

    public void mouse_clicked_green(MouseEvent mouseEvent) {
        fond_rouge_button.setSelected(false);
        fond_bleu_button.setSelected(false);
        fond_vert_button.setSelected(true);
        if(couleur_fond_choice.isSelected()) {
            label1.setStyle("-fx-background-color: green;");
        }
    }

    public void mouse_clicked2(MouseEvent mouseEvent) {
        fond_pane.setDisable(!couleur_fond_choice.isSelected());
         /*if(!couleur_fond_choice.isSelected()){
           label1.setStyle("-fx-background-color: none;");
            fond_rouge_button.setSelected(false);
            fond_bleu_button.setSelected(false);
            fond_vert_button.setSelected(false);
        }*/
    }

    public void mouse_clicked2_red(MouseEvent mouseEvent) {
        texte_rouge_button.setSelected(true);
        texte_blanc_button.setSelected(false);
        texte_noir_button.setSelected(false);
        if(couleur_texte_choice.isSelected()){
            label1.setStyle("-fx-text-fill: red;");
        }
    }

    public void mouse_clicked2_black(MouseEvent mouseEvent) {
        texte_rouge_button.setSelected(false);
        texte_blanc_button.setSelected(false);
        texte_noir_button.setSelected(true);
        if(couleur_texte_choice.isSelected()){
            label1.setStyle("-fx-text-fill: black;");
        }
    }

    public void mouse_clicked2_white(MouseEvent mouseEvent) {
        texte_rouge_button.setSelected(false);
        texte_blanc_button.setSelected(true);
        texte_noir_button.setSelected(false);
        if(couleur_texte_choice.isSelected()){
            label1.setStyle("-fx-text-fill: white;");
        }
    }

    public void mouse_clicked3(MouseEvent mouseEvent) {
        texte_pane.setDisable(!couleur_texte_choice.isSelected());
        /*if(!couleur_texte_choice.isSelected()){
            label1.setStyle("-fx-text-fill: black;");
            texte_rouge_button.setSelected(false);
            texte_blanc_button.setSelected(false);
            texte_noir_button.setSelected(false);
        }*/
    }

    public void mouse_clicked_min(MouseEvent mouseEvent) {
        casse_maj_button.setSelected(false);
        if(casse_min_button.isSelected()){
            String text = label1.getText();
            label1.setText(text.toLowerCase());
        }
    }

    public void mouse_clicked_maj(MouseEvent mouseEvent) {
        casse_min_button.setSelected(false);
        if(casse_maj_button.isSelected()){
            String text = label1.getText();
            label1.setText(text.toUpperCase());
        }
    }

    public void mouse_clicked4(MouseEvent mouseEvent) {
        casse_pane.setDisable(!casse_choice.isSelected());
        /*if(!casse_choice.isSelected()){
            label1.setText(textfield1.getText());
        }*/
    }
}