<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Course Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: rgb(82, 100, 172);
            min-height: 100vh;
            color: #fff;
        }
        .left-panel img {
            max-width: 100%;
            border-radius: 15px;
            box-shadow: 0px 4px 20px rgba(0,0,0,0.3);
        }
        .card {
            border-radius: 20px;
            padding: 40px 30px;
        }
        .btn-custom {
            font-size: 1.2rem;
            padding: 14px;
            border-radius: 12px;
            transition: all 0.3s ease-in-out;
            font-weight: 600;
        }
        .btn-custom:hover {
            transform: translateY(-3px);
            box-shadow: 0px 6px 15px rgba(0,0,0,0.3);
        }
        /* Welcome Text */
        .welcome-text h3 {
            font-weight: bold;
            font-size: 2rem;
            margin-bottom: 40px;
        }
        /* Navbar Gradient */
        .custom-nav {
            background: linear-gradient(90deg, #6a11cb, #2575fc) !important;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark custom-nav shadow">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="#">Course Management System</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                    data-bs-target="#navbarNav" aria-controls="navbarNav" 
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Welcome Text -->
    <div class="welcome-text text-center mt-5">
        <h3>Welcome to our Course Management System</h3>
    </div>

    <!-- Main Section -->
    <div class="container py-5">
        <div class="row align-items-center justify-content-center">
            <!-- Left Side Image -->
            <div class="col-md-6 left-panel mb-4 text-center">
                <img src="first.png" alt="Learning Image">
            </div>

            <!-- Right Side Card -->
            <div class="col-md-6">
                <div class="card bg-light text-dark shadow text-center p-4">
                    <h4 class="mb-4 fw-bold text-primary">Get Started</h4>
                    
                    <!-- Login Button -->
                    <form action="login.jsp" method="get" class="mb-3">
                        <button type="submit" class="btn btn-primary btn-custom w-100">
                            🔑 Login
                        </button>
                    </form>

                    <!-- Signup Button -->
                    <form action="register.jsp" method="get">
                        <button type="submit" class="btn btn-success btn-custom w-100">
                            📝 Sign Up
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
