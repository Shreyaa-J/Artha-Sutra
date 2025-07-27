<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Budget Planner</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #f8f9fa, #e9ecef);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card {
            max-width: 500px;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="card p-4 shadow-sm border-0">
        <h3 class="text-center text-primary mb-3">📊 Budget Planner</h3>
        <form action="BudgetServlet" method="post">
            <div class="mb-3">
                <label for="salary" class="form-label">Monthly Salary (₹)</label>
                <input type="number" class="form-control" id="salary" name="salary" required>
            </div>
            <div class="mb-3">
                <label for="saving" class="form-label">Target Saving (₹)</label>
                <input type="number" class="form-control" id="saving" name="saving" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Plan Budget</button>
        </form>
        <div class="text-center mt-3">
            <a href="dashboard.jsp" class="btn btn-outline-secondary">← Back to Dashboard</a>
        </div>
    </div>
</body>
</html>




