package com.company;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Ecriture {

    public static void main(String[] args) {
        try {

            String url = "jdbc:mysql://localhost:3306/papyrus?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            Connection con = DriverManager.getConnection(url, "root", "");

            PreparedStatement stm = con.prepareStatement("INSERT INTO fournis (numfou, nomfou, ruefou, vilfou, posfou, confou) VALUES (?, ?, ?, ?, ?, ?)");

            stm.setInt(1, 666);
            stm.setString(2, "aa");
            stm.setString(3, "bb");
            stm.setString(4, "cc");
            stm.setString(5, "dd");
            stm.setString(6, "ee");

            stm.execute();

            stm.close();
            con.close();

        } catch (Exception e) {
            System.out.println("Error");
            System.out.println(e.getMessage());
        }

    }
}
