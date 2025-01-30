package com.megacabservice.db;

import java.sql.Connection;

public class DBConnectionFactory {

    public static Connection getConnection() {
        return DBConn.getConn();
    }
}