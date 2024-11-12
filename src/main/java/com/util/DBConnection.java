package com.util;

import java.sql.*;

public class DBConnection {

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/health_bridge", "root", "root");  // replace with your DB credentials
        } catch (ClassNotFoundException | SQLException e) {
            throw new SQLException("Database connection error", e);
        }
    }
}
