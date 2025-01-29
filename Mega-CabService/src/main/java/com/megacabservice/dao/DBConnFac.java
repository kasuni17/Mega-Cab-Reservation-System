package com.megacabservice.dao;


import java.sql.Connection;

public class DBConnFac {
    public static Connection getConnection() {
        return DBConn.getInstance().getConnection();
    }
}
