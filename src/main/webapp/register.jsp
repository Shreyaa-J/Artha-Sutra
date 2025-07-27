<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - Artha Sutra</title>
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
        .btn-success {
            background-color: #198754;
            border: none;
        }
        .btn-success:hover {
            background-color: #157347;
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
<div class="card p-4 shadow-sm" style="width: 100%; max-width: 450px;">
    <div class="text-center mb-4">
        <div class="brand-title">Artha Sutra</div>
        <small class="text-muted">Your smart personal expense tracker</small>
    </div>

    <h5 class="text-center mb-3">Create Account</h5>
    <form action="RegisterServlet" method="post">
        <div class="mb-3">
            <label for="username" class="form-label">Choose Username</label>
            <input type="text" class="form-control" id="username" name="username" required autofocus>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email ID</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Create Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-success w-100">Register</button>
    </form>

    <p class="mt-3 text-center">Already have an account? <a href="login.jsp">Login</a></p>
</div>
</body>
</html>




    