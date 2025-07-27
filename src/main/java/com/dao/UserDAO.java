package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.User;
import com.util.DBConnection;



public class UserDAO {
	public static boolean registerUser(String username, String email, String password) {
        try (Connection conn = DBConnection.getConnection()) {
            String query = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, password);

            int rows = stmt.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
	public static boolean registerUser(User user) {
	    return registerUser(user.getUsername(), user.getEmail(), user.getPassword());
	}
    public static boolean validateUser(String username, String password) {
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();
            return rs.next();  // returns true if a match is found

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static User getUserByUsername(String username) {
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT * FROM users WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, username);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                String email = rs.getString("email");
                String password = rs.getString("password");
                return new User(username, email, password);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
