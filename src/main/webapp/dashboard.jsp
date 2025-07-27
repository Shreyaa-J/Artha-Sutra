<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.dao.ExpenseDAO" %>
<%@ page import="com.model.User" %>
<%@ page import="com.model.Expense" %>
<%@ page session="true" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    User user = (User) session.getAttribute("user");

    double total = 0;
    try {
        total = ExpenseDAO.getTotalExpense(user.getUsername());
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard - Artha Sutra</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #e0eafc, #cfdef3);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .main-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 2rem;
        }

        .title-glow {
            font-weight: 700;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
            color: #333;
        }

        .card-box {
            transition: transform 0.3s, box-shadow 0.3s;
            border-radius: 15px;
        }

        .card-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }

        .btn-lg-icon {
            font-size: 1.1rem;
            font-weight: 600;
            padding: 1rem;
        }

        .section-heading {
            font-size: 1.25rem;
            margin-top: 2rem;
            color: #555;
        }

        @media (max-width: 768px) {
            .btn-lg-icon {
                padding: 0.75rem;
                font-size: 1rem;
            }

            .main-card {
                padding: 1rem;
            }
        }
    </style>
</head>
<body>
<div class="container my-5">
    <div class="main-card">
        <h2 class="text-center title-glow mb-4">Welcome, <%= user.getUsername() %> 👋</h2>

        <div class="row justify-content-center mb-4">
            <div class="col-md-6">
                <div class="card text-white bg-primary card-box">
                    <div class="card-body text-center">
                        <h4 class="card-title">💰 Total Spent</h4>
                        <h2>₹<%= String.format("%.2f", total) %></h2>
                    </div>
                </div>
            </div>
        </div>

        <h5 class="text-center section-heading">Quick Actions</h5>
        <div class="row g-3 justify-content-center">
            <div class="col-lg-3 col-md-4 col-sm-6">
                <a href="addExpense.jsp" class="btn btn-success w-100 btn-lg-icon card-box">➕ Add Expense</a>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <a href="viewExpenses.jsp" class="btn btn-info w-100 btn-lg-icon card-box">📋 View Expenses</a>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <a href="categorySummary.jsp" class="btn btn-warning w-100 btn-lg-icon card-box text-dark">📊 Category Summary</a>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <a href="budgetPlanner.jsp" class="btn btn-dark w-100 btn-lg-icon card-box">📈 Budget Planner</a>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <a href="logout.jsp" class="btn btn-danger w-100 btn-lg-icon card-box">🚪 Logout</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>








