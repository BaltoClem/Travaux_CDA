package com.company;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Lecture {

    public static void main(String[] args) {
        try {

            String url = "jdbc:mysql://localhost:3306/papyrus?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
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
    }
}
