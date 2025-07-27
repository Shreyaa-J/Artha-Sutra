package com.dao;

import com.model.Budget;
import com.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class BudgetDAO {

    public static void saveBudget(Budget budget) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO budget (username, salary, saving, expense, remaining, month_year) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, budget.getUsername());
            ps.setDouble(2, budget.getSalary());
            ps.setDouble(3, budget.getSaving());
            ps.setDouble(4, budget.getExpense());
            ps.setDouble(5, budget.getRemaining());
            ps.setString(6, budget.getMonthYear());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}




