<%@ page import="java.sql.*" %>
<%@ page import="com.ocms.db.DBConnect" %>
<%
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String contact = request.getParameter("contact");
    String educational_qualification = request.getParameter("educational_qualification");

    boolean success = false;
    String errorMessage = "";

    Connection con = null;
    PreparedStatement ps = null;

    try {
        con = DBConnect.getConnection();
        String query = "INSERT INTO student(name, password, email, contact, educational_qualification) VALUES (?,?,?,?,?)";
        ps = con.prepareStatement(query);
        ps.setString(1, name);
        ps.setString(2, password);
        ps.setString(3, email);
        ps.setString(4, contact);
        ps.setString(5, educational_qualification);

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
    <title>Student Registration Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #0f3460, #1a1a2e);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: 'Segoe UI', sans-serif;
        }
        .message-box {
            text-align: center;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
            width: 450px;
        }
        .btn-custom {
            margin-top: 25px;
            width: 100%;
            font-weight: bold;
            border-radius: 10px;
        }
        h2 {
            font-weight: bold;
            margin-bottom: 10px;
        }
        p {
            font-size: 16px;
            color: #333;
        }
    </style>
</head>
<body>

<div class="message-box" style="background-color: <%= success ? "#d4edda" : "#f8d7da" %>;">
    <h2 style="color: <%= success ? "#155724" : "#721c24" %>;">
        <%= success ? "#Student Registered Successfully!" : "#Registration Failed!" %>
    </h2>
    <p>
        <%= success ? "Your student account has been created successfully." : errorMessage %>
    </p>
    <a href="login.jsp" class="btn <%= success ? "btn-success" : "btn-danger" %> btn-custom">
        Go to Login Page
    </a>
</div>

</body>
</html>
