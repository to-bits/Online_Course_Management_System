<%@ page import="java.sql.*" %>
<%@ page import="com.ocms.db.DBConnect" %>
<%
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String contact = request.getParameter("contact");
    String specialization = request.getParameter("specialization");
    String experience = request.getParameter("experience");

    boolean success = false;
    String errorMessage = "";

    Connection con = null;
    PreparedStatement ps = null;

    try {
        con = DBConnect.getConnection();
        String query = "INSERT INTO teacher(name, password, email, contact, specialization, experience) VALUES (?,?,?,?,?,?)";
        ps = con.prepareStatement(query);
        ps.setString(1, name);
        ps.setString(2, password);
        ps.setString(3, email);
        ps.setString(4, contact);
        ps.setString(5, specialization);
        ps.setInt(6, Integer.parseInt(experience));

        int i = ps.executeUpdate();
        if (i > 0) {
            success = true;
        } else {
            errorMessage = "Registration failed. Please try again.";
        }

    } catch(Exception e) {
        errorMessage = "Error: " + e.getMessage();
    } finally {
        if(ps != null) ps.close();
        if(con != null) con.close();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Teacher Registration Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #4A0E4E;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
        }
        .card {
            padding: 40px;
            border-radius: 15px;
            text-align: center;
            color: white;
            width: 450px;
        }
        .btn-custom {
            margin-top: 20px;
            width: 100%;
            font-weight: bold;
        }
    </style>
</head>
<body>


       
<div class="card shadow" style="background-color: #6f42c1;">
<% if(success) { %>
     <h2 class="text-success">Teacher Registered Successfully!</h2>
        <p>Your account has been created.</p>
        <a href="login.jsp" class="btn btn-success btn-custom">Go to Login Page</a>
    <% } else { %>
    <h2 class="text-danger">❌ Registration Failed!</h2>
    <p><%= errorMessage %></p>
        <a href="teacher_register.jsp" class="btn btn-warning btn-custom">Go Back to Registration</a>
    <% } %>
</div>
</body>
</html>
