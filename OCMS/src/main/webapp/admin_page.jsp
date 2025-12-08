<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="dbconnect.jsp" %>
<%
    // Session check
    String admin = (String)session.getAttribute("admin_username");
    if(admin == null){
        response.sendRedirect("admin_login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #224169, #1e2e4a);
            font-family: 'Segoe UI', Tahoma, sans-serif;
            color: #fff;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .card {
            background-color: rgba(0,0,0,0.6);
            padding: 40px 30px;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.4);
            min-width: 500px;
            text-align: center;
        }
        .btn-custom {
            padding: 12px 25px;
            font-size: 16px;
            border-radius: 10px;
            transition: all 0.3s ease;
            margin-top: 20px;
        }
        .btn-custom:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }
    </style>
</head>
<body>
<div class="card">
    <h2>Welcome, <%= admin %>!</h2>

    <!-- Example Admin Actions -->
    <a href="manage_teachers.jsp" class="btn btn-primary btn-custom w-100 mb-2">Manage Teachers</a>
    <a href="manage_students.jsp" class="btn btn-success btn-custom w-100 mb-2">Manage Students</a>
    <a href="logout.jsp" class="btn btn-danger btn-custom w-100">Logout</a>
</div>
</body>
</html>
