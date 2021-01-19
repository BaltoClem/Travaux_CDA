package org.afpa.DAL;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ClientDAO {
    HotelDB hotelDB = new HotelDB();

    public ClientDAO() throws SQLException {
    }

    /**
     * Obtention de tous les clients
     * @return Liste de clients
     */

    public ArrayList<Client> listAll(){
        ArrayList<Client> listeClient = new ArrayList<>();
        try{
            Statement stm = hotelDB.getCon().createStatement();
            ResultSet res = stm.executeQuery("SELECT * FROM client");
            while(res.next()){
                Client c = new Client(  res.getInt("cli_id"),
                                        res.getString("cli_nom"),
                                        res.getString("cli_prenom"),
                                        res.getString("cli_adresse"),
                                        res.getString("cli_ville"));
                listeClient.add(c);
            }
            stm.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return listeClient;
    }
}
