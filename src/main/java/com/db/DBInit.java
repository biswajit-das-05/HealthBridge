package com.db;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class DBInit implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("🚀 App started, initializing DB...");
        DBConnect.getConn();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("🛑 App stopped");
    }
}
