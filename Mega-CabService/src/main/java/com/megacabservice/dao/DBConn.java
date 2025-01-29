package com.megacabservice.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacabservice";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "12345";
    private static DBConn instance;
    private Connection connection;

    private DBConn() {
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish a connection
            this.connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
        } catch (ClassNotFoundException e) {
            System.out.println("JDBC Driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("SQL Exception occurred!");
            e.printStackTrace();
        }
    }

    public static DBConn getInstance() {
        if (instance == null) {
            instance = new DBConn();
        }
        return instance;
    }

    public Connection getConnection() {
        return connection;
    }
}
