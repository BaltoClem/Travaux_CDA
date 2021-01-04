package com.company;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class CreateDataBase {
    static final String driver = "com.company.jdbc.Driver";
    static final String url = "http://localhost/phpmyadmin/";

    static final String user = "root";
    static final String pass = "";

    public static void main(String[] args) {
        Connection conn =null;
        Statement st = null;
        try{
            Class.forName("com.company.jdbc.Driver");
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(url,user,pass);

            System.out.println("Creating database");
            st = conn.createStatement();
            String sql = "CREATE DATABASE REGISTRATION";
            st.executeUpdate(sql);
            System.out.println("Database created successfully");
        }catch(SQLException e){
            e.printStackTrace();
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            try{
                if (st != null)
                    st.close();
            }catch (SQLException e1){
            }
            try{
                if (conn != null)
                    conn.close();
            }catch (SQLException e2){
                e2.printStackTrace();
            }
        }
        System.out.println("Good bye !");
    }
}
