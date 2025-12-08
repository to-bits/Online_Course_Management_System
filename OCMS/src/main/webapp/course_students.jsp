<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.ocms.db.DBConnect" %>

<%
    Integer teacherId = (Integer) session.getAttribute("teacherId");
    if(teacherId == null) {
        response.sendRedirect("teacher_login.jsp");
        return;
    }

    int courseId = Integer.parseInt(request.getParameter("course_id"));

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Course info
    String courseTitle = "";
    String courseDescription = "";

    try {
        con = DBConnect.getConnection();

        // Course details check
        PreparedStatement psCourse = con.prepareStatement(
            "SELECT title, description FROM courses WHERE course_id=? AND teacher_id=?"
        );
        psCourse.setInt(1, courseId);
        psCourse.setInt(2, teacherId);

        ResultSet rsC = psCourse.executeQuery();
        if(rsC.next()) {
            courseTitle = rsC.getString("title");
            courseDescription = rsC.getString("description");
        } else {
            out.println("<h3 style='color:red;'>Invalid Course or Access Denied</h3>");
            return;
        }

        // Student list
     ps = con.prepareStatement(
    	"SELECT s.student_id, s.name, s.email " +
    	"FROM enrollments e " +
    	"JOIN student s ON e.student_id = s.student_id " +
    	"WHERE e.course_id=?"
     );

        ps.setInt(1, courseId);
        rs = ps.executeQuery();

    } catch(Exception e) {
        out.println("<h3 style='color:red;'>Error: "+e.getMessage()+"</h3>");
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Course Students</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body { font-family:'Segoe UI',sans-serif; background:#eef1ff; padding:30px; }
.card { padding:20px; border-radius:12px; box-shadow:0 4px 10px rgba(0,0,0,0.1); }
</style>
</head>
<body>

<div class="container">
    <div class="card mb-4">
        <h3>Course: <%= courseTitle %></h3>
        <p><%= courseDescription %></p>
        <a href="teacher_dashboard.jsp" class="btn btn-dark btn-sm">⬅ Back</a>
    </div>

    <h4>Enrolled Students</h4>
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr><th>ID</th><th>Name</th><th>Email</th></tr>
        </thead>
        <tbody>
        <%
            boolean hasStudent = false;
            while(rs != null && rs.next()) {
                hasStudent = true;
        %>
            <tr>
                <td><%= rs.getInt("student_id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
            </tr>
        <%
            }

            if(!hasStudent) {
        %>
            <tr><td colspan="3" class="text-center text-muted">No Students Enrolled</td></tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>
