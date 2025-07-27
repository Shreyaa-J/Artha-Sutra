<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.User, com.model.Expense, com.dao.ExpenseDAO, java.util.List" %>
<%@ page session="true" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    User user = (User) session.getAttribute("user");
    List<Expense> expenses = ExpenseDAO.getExpensesByUser(user.getUsername());
    double total = 0;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Expenses</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-center mb-4">Expenses for <%= user.getUsername() %></h2>

    <table class="table table-bordered">
        <thead class="table-dark">
            <tr>
                <th>Title</th>
                <th>Category</th>
                <th>Amount</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>
        <% for (Expense e : expenses) {
               total += e.getAmount();
        %>
            <tr>
                <td><%= e.getTitle() %></td>
                <td><%= e.getCategory() %></td>
                <td>₹<%= e.getAmount() %></td>
                <td><%= e.getDate() %></td>
            </tr>
        <% } %>
        </tbody>
    </table>

    <div class="text-end">
        <h5 class="mt-3">Total Expenses: ₹<%= total %></h5>
        <a href="dashboard.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a>
    </div>
</div>
</body>
</html>
