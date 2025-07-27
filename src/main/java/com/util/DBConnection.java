package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	  private static final String DB_URL = "jdbc:mysql://localhost:3306/expensetracker";
	    private static final String DB_USER = "root";
	    private static final String DB_PASSWORD = "orchid@123"; // ✅ Update this

	    public static Connection getConnection() {
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL 8.x
	            return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	            return null;
	        }
	    }

}
