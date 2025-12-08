<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.ocms.db.DBConnect" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    boolean loginSuccess = false;
    String message = "";

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        if(username != null && password != null) {
            con = DBConnect.getConnection();
            String query = "SELECT * FROM admins WHERE username=? AND password=?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if(rs.next()) {
                loginSuccess = true;
                session.setAttribute("adminName", rs.getString("username"));
            } else {
                message = "Invalid username or password!";
            }
        }
    } catch(Exception e) {
        message = "Error: " + e.getMessage();
    } finally {
        if(rs != null) rs.close();
        if(ps != null) ps.close();
        if(con != null) con.close();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #16213e, #0f3460);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', sans-serif;
        }
        .card {
            background: white;
            border-radius: 20px;
            padding: 40px;
            width: 400px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
        }
        h2 { text-align: center; margin-bottom: 25px; color: #0f3460; }
        .btn-custom { width: 100%; font-weight: bold; border-radius: 10px; margin-top: 20px; }
        .message { text-align: center; margin-top: 15px; color: red; }
        .form-text {
            font-size: 0.85rem;
            color: #555;
        }
    </style>
</head>
<body>

<div class="card">
    <h2>Admin Login</h2>

    <% if(username == null || password == null) { %>
        <form action="admin_login.jsp" method="post" autocomplete="off">
            <div class="mb-3">
                <label class="form-label">Username</label>
                <input type="text" name="username" class="form-control" required autocomplete="off" placeholder="Enter username">
                <small class="form-text">Your admin username</small>
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" required autocomplete="new-password" placeholder="Enter password">
                <small class="form-text">Use a strong password</small>
            </div>
            <button type="submit" class="btn btn-primary btn-custom">Login</button>
        </form>
    <% } else { %>
        <div class="message-box" style="background-color:<%= loginSuccess ? "#d4edda" : "#f8d7da" %>; color:<%= loginSuccess ? "#155724" : "#721c24" %>; padding:30px; border-radius:15px; text-align:center;">
            <% if(loginSuccess) { %>
                <h2>✔ Login Successful!</h2>
                <p>Welcome, <%= session.getAttribute("adminName") %>!</p>
                <a href="admin_dashboard.jsp" class="btn btn-success btn-custom">Go to Dashboard</a>
            <% } else { %>
                <h2>❌ Login Failed!</h2>
                <p><%= message %></p>
                <a href="admin_login.jsp" class="btn btn-danger btn-custom">Try Again</a>
            <% } %>
        </div>
    <% } %>

</div>

</body>
</html>
