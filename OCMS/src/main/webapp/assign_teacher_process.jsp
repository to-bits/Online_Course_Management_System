<%@ page import="java.sql.*" %>
<%@ page import="com.ocms.db.DBConnect" %>
<%
    String courseId = request.getParameter("course_id");
    String teacherId = request.getParameter("teacher_id");

    String message = "";
    boolean success = false;

    if(courseId != null && teacherId != null) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBConnect.getConnection();
            String query = "UPDATE courses SET teacher_id=? WHERE course_id=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, Integer.parseInt(teacherId));
            ps.setInt(2, Integer.parseInt(courseId));
            int i = ps.executeUpdate();
            if(i > 0) { success = true; message = "Teacher assigned successfully!"; }
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
    <title>Assign Teacher Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(135deg,#0f3460,#1a1a2e); height:100vh; display:flex; justify-content:center; align-items:center; font-family:'Segoe UI',sans-serif; }
        .message-box { background-color:<%= success ? "#d4edda" : "#f8d7da" %>; color:<%= success ? "#155724" : "#721c24" %>; padding:40px; border-radius:20px; box-shadow:0 8px 25px rgba(0,0,0,0.2); width:450px; text-align:center; }
        .btn-custom { margin-top:25px; width:100%; font-weight:bold; border-radius:10px; }
        h2 { margin-bottom:15px; }
    </style>
</head>
<body>
<div class="message-box">
    <h2><%= success ? "Successfully Assigned!" : "#Failed!" %></h2>
    <p><%= message %></p>
    <div class="btn-group">
        <a href="assign_teacher.jsp" class="btn btn-primary btn-custom">Assign Another Teacher</a>
        <a href="admin_dashboard.jsp" class="btn btn-success btn-custom">Go to Dashboard</a>
    </div>
</div>
</body>
</html>
