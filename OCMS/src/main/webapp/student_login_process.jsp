<%@ page import="java.sql.*" %>
<%@ page import="com.ocms.db.DBConnect" %>
<%
    String name = request.getParameter("name");
    String password = request.getParameter("password");

    boolean loginSuccess = false;
    String message = "";

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        con = DBConnect.getConnection();
        String query = "SELECT * FROM student WHERE name=? AND password=?";
        ps = con.prepareStatement(query);
        ps.setString(1, name);
        ps.setString(2, password);

        rs = ps.executeQuery();
        if(rs.next()) {
            loginSuccess = true;
            // ✅ Set both studentName and studentId in session
            session.setAttribute("studentName", rs.getString("name"));
            session.setAttribute("studentId", rs.getInt("student_id"));
        } else {
            message = "Invalid username or password!";
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
    <title>Student Login Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #0f3460, #1a1a2e);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', sans-serif;
        }
        .message-box {
            background-color: <%= loginSuccess ? "#d4edda" : "#f8d7da" %>;
            color: <%= loginSuccess ? "#155724" : "#721c24" %>;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
            width: 450px;
            text-align: center;
        }
        .btn-custom {
            margin-top: 25px;
            width: 100%;
            font-weight: bold;
            border-radius: 10px;
        }
        h2 { margin-bottom: 15px; }
    </style>
</head>
<body>
<div class="message-box">
    <% if(loginSuccess) { %>
        <h2>#Login Successful!</h2>
        <p>Welcome, <%= session.getAttribute("studentName") %>!</p>
        <a href="student_dashboard.jsp" class="btn btn-success btn-custom">Go to Dashboard</a>
    <% } else { %>
        <h2>#Login Failed!</h2>
        <p><%= message %></p>
        <a href="student_login.jsp" class="btn btn-danger btn-custom">Try Again</a>
    <% } %>
</div>
</body>
</html>
