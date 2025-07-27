package com.dao;

import java.sql.*;
import java.sql.Date;
import java.util.*;
import com.model.Expense;
import com.util.DBConnection;

public class ExpenseDAO {

    // Add new expense
    public static void addExpense(Expense expense) {
        String sql = "INSERT INTO expenses (username, title, category, amount, date) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, expense.getUsername());
            ps.setString(2, expense.getTitle());
            ps.setString(3, expense.getCategory());
            ps.setDouble(4, expense.getAmount());
            ps.setDate(5, Date.valueOf(expense.getDate())); // convert LocalDate to SQL Date

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 // Total amount spent by user
    public static double getTotalExpense(String username) {
        double total = 0;
        String sql = "SELECT SUM(amount) FROM expenses WHERE username = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                total = rs.getDouble(1);  // get total from first column
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return total;
    }

    // Get all expenses for a user
    public static List<Expense> getExpensesByUser(String username) {
        List<Expense> list = new ArrayList<>();
        String sql = "SELECT * FROM expenses WHERE username = ? ORDER BY date DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String title = rs.getString("title");
                String category = rs.getString("category");
                double amount = rs.getDouble("amount");
                Date sqlDate = rs.getDate("date");

                Expense expense = new Expense(username, title, category, amount, sqlDate.toLocalDate());
                list.add(expense);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
   


    // Category-wise total
    public static Map<String, Double> getExpensesByCategory(String username) {
        Map<String, Double> map = new HashMap<>();
        String sql = "SELECT category, SUM(amount) AS total FROM expenses WHERE username = ? GROUP BY category";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String category = rs.getString("category");
                double total = rs.getDouble("total");
                map.put(category, total);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return map;
    }
}

