package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	private static Connection conn;

	public static Connection getConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			String host = System.getenv("MYSQLHOST");
			String port = System.getenv("MYSQLPORT");
			String database = System.getenv("MYSQLDATABASE");
			String user = System.getenv("MYSQLUSER");
			String password = System.getenv("MYSQLPASSWORD");

			System.out.println("DB HOST = " + host);
			System.out.println("DB PORT = " + port);
			System.out.println("DB NAME = " + database);
			System.out.println("DB USER = " + user);

			String url = "jdbc:mysql://" + host + ":" + port + "/" + database
					+ "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

			conn = DriverManager.getConnection(url, user, password);

			System.out.println("✅ DATABASE CONNECTED SUCCESSFULLY");

		} catch (Exception e) {
			System.out.println("❌ DATABASE CONNECTION FAILED");
			e.printStackTrace();
		}
		return conn;
	}
}
