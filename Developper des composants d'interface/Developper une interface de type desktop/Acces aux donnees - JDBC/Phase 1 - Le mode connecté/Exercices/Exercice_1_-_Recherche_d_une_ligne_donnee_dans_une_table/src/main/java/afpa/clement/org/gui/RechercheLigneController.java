package afpa.clement.org.gui;

import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.control.TitledPane;
import javafx.scene.input.MouseEvent;

import java.net.URL;
import java.sql.*;
import java.util.ResourceBundle;

public class RechercheLigneController implements Initializable {
    public Label label_code_fourni;
    public TextField txtfield_code_fourni;
    public Button btn_rechercher;
    public TitledPane pane_infos_fourni;
    public Label label_nom;
    public Label label_adresse;
    public Label label_cpville;
    public Label label_contact;
    public TextField textfield_nom;
    public TextField textfield_adresse;
    public TextField textfield_cp;
    public TextField textfield_ville;
    public TextField textfield_contact;

    @Override
    public void initialize(URL location, ResourceBundle resources) {

    }

    public void rechercheFournis(MouseEvent mouseEvent) {
        String fournis = txtfield_code_fourni.getText();

        try {
            String url = "jdbc:mysql://localhost:3306/papyrus?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

            Connection con = DriverManager.getConnection(url, "root", "");

            Statement stm = con.createStatement();

            ResultSet result = stm.executeQuery("SELECT * FROM FOURNIS WHERE numfou =" + fournis);

            while (result.next()) {
                /*int num = result.getInt("numfou");
                String nom = result.getString("nomfou");
                String ville = result.getString("vilfou");
                System.out.format("[%d] %s %s\n", num, nom, ville);*/
                String nom = result.getString("nomfou");
                textfield_nom.setText(nom);
                String adresse = result.getString("ruefou");
                textfield_adresse.setText(adresse);
                String cp = result.getString("posfou");
                textfield_cp.setText(cp);
                String ville = result.getString("vilfou");
                textfield_ville.setText(ville);
                String contact = result.getString("confou");
                textfield_contact.setText(contact);
            }
            stm.close();
            result.close();
            con.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
