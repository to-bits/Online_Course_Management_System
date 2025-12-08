<%@ page import="java.sql.*" %>
<%@ page import="com.ocms.db.DBConnect" %>
<%
    Integer studentId = (Integer) session.getAttribute("studentId");
    if(studentId == null) {
        response.sendRedirect("student_login.jsp");
        return;
    }

    int courseId = Integer.parseInt(request.getParameter("course_id"));
    String message = "";

    try (Connection con = DBConnect.getConnection();
         PreparedStatement ps = con.prepareStatement(
            "INSERT INTO enrollments(student_id, course_id) VALUES (?,?)"
         )) {
        ps.setInt(1, studentId);
        ps.setInt(2, courseId);
        int result = ps.executeUpdate();
        message = (result > 0) ? "Successfully enrolled!" : "Enrollment failed!";
    } catch(Exception e) {
        message = "Error: "+e.getMessage();
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Enrollment Result</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="padding:50px; font-family:'Segoe UI',sans-serif;">
<div class="container">
    <div class="alert <%= message.contains("Successfully") ? "alert-success" : "alert-danger" %>">
        <%= message %>
    </div>
    <a href="student_dashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
</div>
</body>
</html>
