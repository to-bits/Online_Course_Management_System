<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Teacher Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #224169;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', sans-serif;
        }
        .card {
            background: #ffffff;
            border-radius: 20px;
            padding: 40px;
            width: 400px;
            box-shadow: 0 8px 30px rgba(11, 11, 11, 0.2);
        }
        .btn-custom {
            width: 100%;
            font-weight: bold;
            border-radius: 10px;
            background-color: rgba(55, 139, 66, 0.858);
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: bold;
            color: #41a473;
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>Teacher Login</h2>
        <form action="teacher_login_process.jsp" method="post" autocomplete="off">
            <div class="mb-3">
                <label class="form-label">Username</label>
                <input type="text" name="name" class="form-control" required placeholder="Enter your username" autocomplete="off">
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" required placeholder="Enter your password" autocomplete="new-password">
            </div>
            <button type="submit" class="btn btn-primary btn-custom">Login</button>
            <p class="mt-3 text-center">Don't have an account? <a href="register.jsp">Register Here</a></p>
        </form>
    </div>
</body>
</html>
