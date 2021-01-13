package afpa.clement.org;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class App extends Application {

    public static void main(String[] args) {

        try {

            String url = "jdbc:mysql://localhost:3306/papyrus";
            Connection con = DriverManager.getConnection(url, "root", "");

            Statement stm = con.createStatement();

            ResultSet result = stm.executeQuery("SELECT * FROM FOURNIS");

            while (result.next()) {
                int num = result.getInt("numfou");
                String nom = result.getString("nomfou");
                String ville = result.getString("vilfou");
                System.out.format("[%d] %s %s\n", num, nom, ville);
            }

            stm.close();
            result.close();
            con.close();

        } catch (Exception e) {
            System.out.println("Error");
            System.out.println(e.getMessage());
        }
        launch(args); }

    @Override
    public void start(Stage primaryStage) throws IOException {
        Parent root = FXMLLoader.load(getClass().getResource("/afpa/clement/org/gui/RechercheLigne.fxml"));
        Scene scene = new Scene(root);
        primaryStage.setScene(scene);
        primaryStage.show();
    }
}
