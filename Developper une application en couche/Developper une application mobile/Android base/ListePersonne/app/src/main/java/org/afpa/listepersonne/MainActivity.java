package org.afpa.listepersonne;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import java.util.Arrays;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Récupération de listview
        ListView listView = (ListView)findViewById(R.id.listView);

        //Création des users
        UserAccount francois = new UserAccount("François","admin",true);
        UserAccount germain = new UserAccount("Germain","user", true);
        UserAccount cedric = new UserAccount("Cédric","guest",false);

        //Création de la liste
        UserAccount[] users = new UserAccount[]{francois,germain,cedric};

        //Affectation de l'adapter
        listView.setAdapter(new CustomListAdaptater(Arrays.asList(users), this));

    }
}