package afpa.moi.org;

import javafx.application.Application;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

public class App extends Application {
    @Override
    public void start(Stage primaryStage) throws Exception {
        Parent root;

        //Définition de la boîte de dialogue
        Scene scene = new Scene(new StackPane(new Label("Salut JavaFX")),200, 200);

        //Paramètrage de la boîte de dialogue
        primaryStage.setScene(scene);

        //Affichage de la boîte de dialogue
        primaryStage.show();
    }
}
