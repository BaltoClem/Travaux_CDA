package com.company;

import java.sql.*;

public class ConnectDataBase {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost/?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String user = "root";
        String password = "";
        try{
        Connection myConn = DriverManager.getConnection(url, user, password);
        Statement myStat = myConn.createStatement();
            String sql = "SELECT * from registration.contacts";
            ResultSet rs = myStat.executeQuery(sql);

        while (rs.next())

            System.out.println(rs.getString("contact_name"));

    }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
