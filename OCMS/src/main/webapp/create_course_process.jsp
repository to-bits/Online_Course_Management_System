<%@ page import="java.sql.*" %>
<%@ page import="com.ocms.db.DBConnect" %>
<%
    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String seats = request.getParameter("seats");

    String message = "";
    boolean success = false;

    if(title != null && description != null && seats != null) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBConnect.getConnection();
            String query = "INSERT INTO courses(title, description, seats) VALUES (?, ?, ?)";
            ps = con.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, description);
            ps.setInt(3, Integer.parseInt(seats));
            int i = ps.executeUpdate();
            if(i > 0) { success = true; message = "Course created successfully!"; }
        } catch(Exception e) {
            message = "Error: " + e.getMessage();
        } finally {
            if(ps != null) ps.close();
            if(con != null) con.close();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Course Creation Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { 
            background: linear-gradient(135deg,#0f3460,#1a1a2e); 
            height:100vh; 
            display:flex; 
            justify-content:center; 
            align-items:center; 
            font-family:'Segoe UI',sans-serif; 
        }
        .message-box { 
            background-color:<%= success ? "#d4edda" : "#f8d7da" %>; 
            color:<%= success ? "#155724" : "#721c24" %>; 
            padding:40px; 
            border-radius:20px; 
            box-shadow:0 8px 25px rgba(0,0,0,0.2); 
            width:450px; 
            text-align:center; 
        }
        .btn-custom { 
            margin-top:15px; 
            width:100%; 
            font-weight:bold; 
            border-radius:10px; 
        }
        .btn-group { 
            display:flex; 
            gap:10px; 
            margin-top:25px; 
        }
        .btn-group a { flex:1; }
        h2 { margin-bottom:15px; }
    </style>
</head>
<body>

<div class="message-box">
    <h2><%= success ? "Your Course is Successfully created!" : "#Failed!" %></h2>
    <p><%= message %></p>

    <div class="btn-group">
        <a href="create_course.jsp" class="btn btn-primary btn-custom">Create Another Course</a>
        <a href="admin_dashboard.jsp" class="btn btn-success btn-custom">Go to Dashboard</a>
    </div>
</div>

</body>
</html>
