package com.megacabservice.db;


import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {

private static Connection conn;

public static Connection getConn()
{

	try

	{

		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/mega_cab_service", "root", "12345");

	}catch(
	Exception e)
	{
		e.printStackTrace();
	}

	return conn;
}}