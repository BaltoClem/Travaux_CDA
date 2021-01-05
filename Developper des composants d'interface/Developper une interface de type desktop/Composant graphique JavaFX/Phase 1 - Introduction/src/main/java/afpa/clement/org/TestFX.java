package afpa.clement.org;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.layout.Pane;
import javafx.scene.paint.Color;
import javafx.stage.Stage;

public class TestFX extends Application {
    public TestFX() {
        System.out.println("constructeur ...");
    }

    @Override
    public void start(Stage primaryStage) throws Exception {
        System.out.println("start ... ");
        Label label = new Label("Afpa FOREVER ...");
        label.setOnMouseMoved(evt -> {
            System.out.println("ca bouge !");
        });
        Pane root = new Pane();
        root.setStyle("-fx-background-color: lightgreen;");
        label.setStyle("-fx-font-size: 30px; -fx-text-fill: white;");
        label.relocate(50, 20);
        root.getChildren().add(label);
        Scene scene = new Scene( root , 300 , 100 , Color.LIGHTGREEN);
        primaryStage.setTitle( "Une Fenetre en JFX") ;
        primaryStage.setScene(scene) ;
        primaryStage.show() ;
    }

    public static void main(String[] args) {
        System.out.println("main ...");
        Application.launch(args);
    }

    @Override
    public void init() throws Exception {
        System.out.println("init ...");
    }
}
