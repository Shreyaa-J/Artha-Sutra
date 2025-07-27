<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    Double salary = (Double) request.getAttribute("salary");
    Double saving = (Double) request.getAttribute("saving");
    Double expense = (Double) request.getAttribute("expense");
    Double remaining = (Double) request.getAttribute("remaining");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Budget Result</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f3f4f6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .result-container {
            background-color: white;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 0 12px rgba(0,0,0,0.1);
            width: 420px;
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }
        .budget-row {
            margin: 12px 0;
            font-size: 16px;
            display: flex;
            justify-content: space-between;
            border-bottom: 1px dashed #ccc;
            padding-bottom: 6px;
        }
        .label {
            color: #666;
        }
        .value {
            font-weight: 600;
            color: #000;
        }
        .back-link {
            display: block;
            margin-top: 25px;
            text-align: center;
            color: #007bff;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="result-container">
    <h2>💼 Budget Summary</h2>

    <div class="budget-row">
        <span class="label">Monthly Salary:</span>
        <span class="value">₹ <%= salary %></span>
    </div>
    <div class="budget-row">
        <span class="label">Target Saving:</span>
        <span class="value">₹ <%= saving %></span>
    </div>
    <div class="budget-row">
        <span class="label">Actual Expenses:</span>
        <span class="value">₹ <%= expense %></span>
    </div>
    <div class="budget-row">
        <span class="label">Remaining After Saving:</span>
        <span class="value">₹ <%= remaining %></span>
    </div>

    <a class="back-link" href="dashboard.jsp">← Back to Dashboard</a>
</div>

</body>
</html>






