package com.servlet;

import com.dao.BudgetDAO;
import com.dao.ExpenseDAO;
import com.model.Budget;
import com.model.User;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet("/BudgetServlet")
public class BudgetServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        double salary = Double.parseDouble(request.getParameter("salary"));
        double saving = Double.parseDouble(request.getParameter("saving"));
        double expense = ExpenseDAO.getTotalExpense(user.getUsername());
        double balance = salary - expense;
        double remainingAfterSaving = balance - saving;

      
        Budget budget = new Budget();
        budget.setUsername(user.getUsername());
        budget.setSalary(salary);
        budget.setSaving(saving);
        budget.setExpense(expense);
        budget.setRemaining(remainingAfterSaving);
        budget.setMonthYear(LocalDate.now().format(DateTimeFormatter.ofPattern("MMMM yyyy")));

        BudgetDAO.saveBudget(budget); 

        request.setAttribute("salary", salary);
        request.setAttribute("saving", saving);
        request.setAttribute("expense", expense);
        request.setAttribute("remaining", remainingAfterSaving);

        RequestDispatcher rd = request.getRequestDispatcher("budgetResult.jsp");
        rd.forward(request, response);
    }
}





