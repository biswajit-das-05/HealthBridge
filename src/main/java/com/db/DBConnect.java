package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static Connection conn;
	
	public static Connection getConn()
	{
		try {
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/health_bridge", "root", "root");
		    System.out.println("Connection Status: " + conn);
		} catch (Exception e) {
		    e.printStackTrace();
		}
		return conn;

	}


}
