<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.ocms.db.DBConnect" %>
<%
    String adminName = (String) session.getAttribute("adminName");
    if(adminName == null) { 
        response.sendRedirect("admin_login.jsp"); 
        return; 
    }

    Connection con = null;
    Statement stmtStudents = null;
    Statement stmtTeachers = null;
    ResultSet rsStudents = null;
    ResultSet rsTeachers = null;

    try {
        con = DBConnect.getConnection();

        // Students + enrolled courses
        stmtStudents = con.createStatement();
        String studentQuery = "SELECT s.student_id, s.name, s.email, s.contact, s.educational_qualification, " +
                              "GROUP_CONCAT(c.title SEPARATOR ', ') AS courses " +
                              "FROM student s " +
                              "LEFT JOIN enrollments e ON s.student_id = e.student_id " +
                              "LEFT JOIN courses c ON e.course_id = c.course_id " +
                              "GROUP BY s.student_id";
        rsStudents = stmtStudents.executeQuery(studentQuery);

        // Teachers + assigned courses
        stmtTeachers = con.createStatement();
        String teacherQuery = "SELECT t.teacher_id, t.name, t.email, t.contact, t.specialization, " +
                              "GROUP_CONCAT(c.title SEPARATOR ', ') AS courses " +
                              "FROM teacher t " +
                              "LEFT JOIN courses c ON t.teacher_id = c.teacher_id " +
                              "GROUP BY t.teacher_id";
        rsTeachers = stmtTeachers.executeQuery(teacherQuery);

    } catch(Exception e) {
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    } 
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View All Users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background:#f4f6ff; font-family:'Segoe UI',sans-serif; padding:30px; }
        h2 { color:#0f3460; margin-bottom:20px; font-weight:bold; }
        table { background:white; box-shadow:0 4px 15px rgba(0,0,0,0.1); border-radius:10px; }
        .container { max-width:1200px; margin:auto; }
        .nav { margin-bottom:30px; padding:15px; background:#0f3460; color:white; border-radius:10px; font-size:20px; font-weight:bold; }
        td, th { vertical-align: middle !important; }
    </style>
</head>
<body>
<div class="container">
    <div class="nav">
        Welcome, <%= adminName %> | <a href="logout.jsp" style="color:white; text-decoration:none;">Logout</a>
    </div>

    <!-- Students Table -->
    <h2>All Students</h2>
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>ID</th><th>Name</th><th>Email</th><th>Contact</th><th>Education</th><th>Courses Enrolled</th>
            </tr>
        </thead>
        <tbody>
        <%
            try {
                if(rsStudents != null) {
                    while(rsStudents.next()) {
        %>
            <tr>
                <td><%= rsStudents.getInt("student_id") %></td>
                <td><%= rsStudents.getString("name") %></td>
                <td><%= rsStudents.getString("email") %></td>
                <td><%= rsStudents.getString("contact") %></td>
                <td><%= rsStudents.getString("educational_qualification") %></td>
                <td><%= rsStudents.getString("courses") != null ? rsStudents.getString("courses") : "None" %></td>
            </tr>
        <%
                    }
                }
            } catch(Exception e) {
                out.println("<tr><td colspan='6' style='color:red;'>Error fetching students: "+e.getMessage()+"</td></tr>");
            }
        %>
        </tbody>
    </table>

    <!-- Teachers Table -->
    <h2 class="mt-5">All Teachers</h2>
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>ID</th><th>Name</th><th>Email</th><th>Contact</th><th>Specialization</th><th>Courses Assigned</th>
            </tr>
        </thead>
        <tbody>
        <%
            try {
                if(rsTeachers != null) {
                    while(rsTeachers.next()) {
        %>
            <tr>
                <td><%= rsTeachers.getInt("teacher_id") %></td>
                <td><%= rsTeachers.getString("name") %></td>
                <td><%= rsTeachers.getString("email") %></td>
                <td><%= rsTeachers.getString("contact") %></td>
                <td><%= rsTeachers.getString("specialization") %></td>
                <td><%= rsTeachers.getString("courses") != null ? rsTeachers.getString("courses") : "None" %></td>
            </tr>
        <%
                    }
                }
            } catch(Exception e) {
                out.println("<tr><td colspan='6' style='color:red;'>Error fetching teachers: "+e.getMessage()+"</td></tr>");
            }
        %>
        </tbody>
    </table>
</div>

<%
    // Close resources in finally block
    try {
        if(rsStudents != null) rsStudents.close();
        if(stmtStudents != null) stmtStudents.close();

        if(rsTeachers != null) rsTeachers.close();
        if(stmtTeachers != null) stmtTeachers.close();

        if(con != null) con.close();
    } catch(Exception e) {
        out.println("<h3 style='color:red;'>Error closing resources: "+e.getMessage()+"</h3>");
    }
%>
</body>
</html>
