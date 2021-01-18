package org.afpa.DAL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class HotelDB {
    private final String URL_HOTEL = "jdbc:mysql://localhost:3306/hotel";
    private final String USR_HOTEL = "root";
    private final String PWD_HOTEL = "";
    public Connection con = null;

    public HotelDB() throws SQLException{
    }

    public Connection getCon() throws SQLException{
        con = DriverManager.getConnection(URL_HOTEL, USR_HOTEL, PWD_HOTEL);

        return con;
    }
}

