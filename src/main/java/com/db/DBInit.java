package com.db;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.Connection;
import java.sql.Statement;

@WebListener
public class DBInit implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("🚀 App started, initializing DB...");

        Connection conn = DBConnect.getConn();

        try {
            Statement st = conn.createStatement();

            st.execute(
                    "CREATE TABLE IF NOT EXISTS user_dtls (" +
                            "id INT AUTO_INCREMENT PRIMARY KEY, " +
                            "name VARCHAR(100), " +
                            "email VARCHAR(100), " +
                            "password VARCHAR(100)" +
                            ")"
            );

            System.out.println("✅ user_dtls table ready");

        } catch (Exception e) {
            System.out.println("❌ Failed to create table");
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("🛑 App stopped");
    }
}
