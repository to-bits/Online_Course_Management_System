<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.ocms.db.DBConnect" %>
<%
    Integer teacherId = (Integer) session.getAttribute("teacherId");
    String teacherName = (String) session.getAttribute("teacherName");
    if(teacherId == null) {
        response.sendRedirect("teacher_login.jsp");
        return;
    }

    Connection con = null;
    PreparedStatement psCourses = null;
    ResultSet rsCourses = null;

    try {
        con = DBConnect.getConnection();
        psCourses = con.prepareStatement(
            "SELECT course_id, title, description FROM courses WHERE teacher_id=?"
        );
        psCourses.setInt(1, teacherId);
        rsCourses = psCourses.executeQuery();
    } catch(Exception e) {
        out.println("<h3 style='color:red;'>Error: "+e.getMessage()+"</h3>");
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body { font-family:'Segoe UI',sans-serif; background:#f4f6ff; padding:30px; }
h2 { color:#0f3460; margin-bottom:20px; }
.nav { background:#0f3460; color:white; padding:15px; border-radius:10px; margin-bottom:30px; font-weight:bold; }
table { background:white; box-shadow:0 4px 15px rgba(0,0,0,0.1); border-radius:10px; }
.btn-custom { background:#0f3460; color:white; border:none; }
.btn-custom:hover { opacity:.8; }
</style>
</head>
<body>
<div class="container">
    <div class="nav">
        Welcome, <%= teacherName %> | 
        <a href="logout.jsp" style="color:white; text-decoration:none;">Logout</a>
    </div>

    <h2>Your Assigned Courses</h2>

    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>Course ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Students</th>
            </tr>
        </thead>
        <tbody>
        <%
            try {
                while(rsCourses != null && rsCourses.next()) {
        %>
            <tr>
                <td><%= rsCourses.getInt("course_id") %></td>
                <td><%= rsCourses.getString("title") %></td>
                <td><%= rsCourses.getString("description") %></td>

                <!-- Button to view enrolled students -->
                <td>
                    <a href="course_students.jsp?course_id=<%= rsCourses.getInt("course_id") %>"
                       class="btn btn-custom btn-sm">
                       View Students
                    </a>
                </td>
            </tr>
        <%
                }
            } catch(Exception e) {}
        %>
        </tbody>
    </table>
</div>

<%
    try {
        if(rsCourses != null) rsCourses.close();
        if(psCourses != null) psCourses.close();
        if(con != null) con.close();
    } catch(Exception e) {}
%>
</body>
</html>
