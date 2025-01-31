package com.megacabservice.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
    private static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/mega_cab_service";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "12345";

    private static DBConn instance;
    private Connection connection;

    private DBConn() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC Driver not found!", e);
        } catch (SQLException e) {
            throw new RuntimeException("Database connection failed!", e);
        }
    }

    public static DBConn getInstance() {
        if (instance == null) {
            synchronized (DBConn.class) {
                if (instance == null) {
                    instance = new DBConn();
                }
            }
        }
        return instance;
    }

    public Connection getConnection() {
        if (connection == null) {
            throw new IllegalStateException("Database connection is not available!");
        }
        return connection;
    }

    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
                connection = null;
                instance = null;
            } catch (SQLException e) {
                throw new RuntimeException("Error closing database connection", e);
            }
        }
    }
}
