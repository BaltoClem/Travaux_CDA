package com.company;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Lecture2 {
    public static void main(String[] args) {
        try {

            String url = "jdbc:mysql://localhost:3306/papyrus?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Connection con = DriverManager.getConnection(url, "root", "");

            PreparedStatement stm = con.prepareStatement("SELECT * FROM FOURNIS WHERE SATISF>?");

            stm.setInt(1, 5);

            ResultSet result =stm.executeQuery ();

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
    }
}
