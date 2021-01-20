package org.afpa.DAL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class HotelDB {
    private static Connection con;
    private static String URL_HOTEL = "jdbc:mysql://localhost:3306/hotel";;
    private static String USR_HOTEL = "root";
    private static String PWD_HOTEL = "";

    public HotelDB() throws SQLException{
    }

    public static Connection getCon() throws SQLException{
        con = DriverManager.getConnection(URL_HOTEL, USR_HOTEL, PWD_HOTEL);

        return con;
    }
}

