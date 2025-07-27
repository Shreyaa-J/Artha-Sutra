package com.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;

import com.model.Expense;
import com.model.User;
import com.dao.ExpenseDAO;

@WebServlet("/ExpenseServlet")
public class ExpenseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String title = request.getParameter("title");
        String category = request.getParameter("category");
        double amount = Double.parseDouble(request.getParameter("amount"));

        // Convert form date string to LocalDate
        LocalDate date = LocalDate.parse(request.getParameter("date"));

        // Match constructor with LocalDate
        Expense expense = new Expense(user.getUsername(), title, category, amount, date);
        ExpenseDAO.addExpense(expense);

        response.sendRedirect("dashboard.jsp");
    }
}

