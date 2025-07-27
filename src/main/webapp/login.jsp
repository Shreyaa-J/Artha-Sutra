<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Artha Sutra</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #e3f2fd, #ffffff);
            font-family: "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        }
        .card {
            border: 1px solid #e0e0e0;
            border-radius: 10px;
        }
        .brand-title {
            font-size: 28px;
            font-weight: 700;
            color: #0d6efd;
        }
        .form-label {
            font-weight: 500;
        }
        .btn-primary {
            background-color: #0d6efd;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0b5ed7;
        }
        a {
            color: #0d6efd;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body class="d-flex align-items-center justify-content-center vh-100">
<div class="card p-4 shadow-sm" style="width: 100%; max-width: 420px;">
    <div class="text-center mb-4">
        <div class="brand-title">Artha Sutra</div>
        <small class="text-muted">Your smart personal expense tracker</small>
    </div>

    <h5 class="text-center mb-3">Login</h5>
    <form action="LoginServlet" method="post">
        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control" id="username" name="username" required autofocus>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Login</button>
    </form>

    <p class="mt-3 text-center">Don't have an account? <a href="register.jsp">Register</a></p>
</div>
</body>
</html>


    