<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="com.dao.ExpenseDAO" %>
<%@ page import="com.model.User" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    User user = (User) session.getAttribute("user");
    Map<String, Double> categoryMap = ExpenseDAO.getExpensesByCategory(user.getUsername());
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Category-wise Summary</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Charts Loader -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {packages: ['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Category', 'Amount'],
                <% for (Map.Entry<String, Double> entry : categoryMap.entrySet()) { %>
                    ['<%= entry.getKey() %>', <%= entry.getValue() %>],
                <% } %>
            ]);

            var pieOptions = {
                title: 'Category-wise Expense Distribution (Pie Chart)',
                pieHole: 0.4,
                height: 400,
                width: '100%'
            };

            var barOptions = {
                title: 'Category-wise Expense (Bar Chart)',
                height: 400,
                legend: { position: 'none' },
                hAxis: { title: 'Category' },
                vAxis: { title: 'Amount (₹)' }
            };

            var pieChart = new google.visualization.PieChart(document.getElementById('expenseChart'));
            pieChart.draw(data, pieOptions);

            var barChart = new google.visualization.ColumnChart(document.getElementById('barChart'));
            barChart.draw(data, barOptions);
        }
    </script>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2 class="text-center mb-4">Category-wise Expense Summary</h2>

        <!-- Expense Table -->
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>Category</th>
                    <th>Total Amount (₹)</th>
                </tr>
            </thead>
            <tbody>
                <% for (Map.Entry<String, Double> entry : categoryMap.entrySet()) { %>
                <tr>
                    <td><%= entry.getKey() %></td>
                    <td><%= String.format("%.2f", entry.getValue()) %></td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <!-- Charts -->
        <div id="expenseChart" class="mt-5"></div>
        <div id="barChart" class="mt-5"></div>

        <div class="text-center mt-4">
            <a href="dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>




    