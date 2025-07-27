<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.User" %>
<%@ page session="true" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Expense</title>
    <!-- Bootstrap CDN for Styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Add Expense for <%= user.getUsername() %></h2>
        <div class="card p-4 shadow-sm mx-auto" style="max-width: 500px;">
            <form action="ExpenseServlet" method="post">
                <div class="mb-3">
                    <label class="form-label">Title</label>
                    <input type="text" name="title" class="form-control" placeholder="e.g. Grocery shopping" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Category</label>
                    <select name="category" class="form-select" required>
                        <option value="">-- Select Category --</option>
                        <option value="Grocery">Grocery</option>
                        <option value="Coaching">Coaching</option>
                        <option value="Self-Help">Self-Help</option>
                        <option value="Trip">Trip</option>
                        <option value="Food">Food</option>
                        <option value="Others">Others</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Amount</label>
                    <input type="number" name="amount" class="form-control" step="0.01" min="0" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Date</label>
                    <input type="date" name="date" class="form-control" required>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Add Expense</button>
                </div>
            </form>
            <div class="text-center mt-3">
                <a href="dashboard.jsp" class="btn btn-link">← Back to Dashboard</a>
            </div>
        </div>
    </div>
</body>
</html>
