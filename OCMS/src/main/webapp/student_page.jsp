<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", Arial, sans-serif;
            background: #f4f6f9;
        }
        nav {
            background: #cd7e41;
            display: flex;
            justify-content: center;
            padding: 10px 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }
        nav a {
            color: #fff;
            text-decoration: none;
            margin: 0 20px;
            font-size: 16px;
            font-weight: 500;
            transition: color 0.3s, border-bottom 0.3s;
            padding-bottom: 5px;
        }
        nav a:hover {
            color: #ffeb3b;
            border-bottom: 2px solid #ffeb3b;
        }
        footer {
            margin-top: 50px;
            background: #cd7e41;
            color: #f6f6f5;
            text-align: center;
            padding: 12px;
            font-size: 14px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>


<nav>
    <a href="enrolled.jsp">Enrolled Courses</a>
    <a href="add_course.jsp">Add Course</a>
    <a href="details.jsp">See Details</a>
    <a href="logout.jsp">Logout</a>
</nav>

<footer>
    &copy; 2025 Student Portal. All Rights Reserved.
</footer>

</body>
</html>