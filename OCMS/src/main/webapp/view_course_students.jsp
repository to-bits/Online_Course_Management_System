<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.ocms.db.DBConnect" %>

<%
    String adminName = (String) session.getAttribute("adminName");
    if(adminName == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }

    int courseId = Integer.parseInt(request.getParameter("course_id"));
    Connection con = null;
    PreparedStatement psCourse = null;
    PreparedStatement psStudents = null;
    ResultSet rsCourse = null;
    ResultSet rsStudents = null;

    String courseTitle = "";

    try {
        con = DBConnect.getConnection();

        // Get course info
        psCourse = con.prepareStatement("SELECT title FROM courses WHERE course_id = ?");
        psCourse.setInt(1, courseId);
        rsCourse = psCourse.executeQuery();
        if(rsCourse.next()) {
            courseTitle = rsCourse.getString("title");
        }

        // Get enrolled students
        psStudents = con.prepareStatement(
            "SELECT s.student_id, s.name, s.email, s.contact " +
            "FROM enrollments e INNER JOIN student s ON e.student_id = s.student_id " +
            "WHERE e.course_id = ? ORDER BY s.student_id DESC"
        );
        psStudents.setInt(1, courseId);
        rsStudents = psStudents.executeQuery();

    } catch(Exception e) {
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Enrolled Students</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

<style>
body {
    font-family:'Inter',sans-serif;
    background: linear-gradient(135deg, #eef3ff, #d9e0f2);
    padding:20px;
}
.container-box {
    background:white;
    padding:25px;
    border-radius:12px;
    box-shadow:0 10px 30px rgba(0,0,0,0.1);
}
.title-text {
    font-size:26px;
    font-weight:700;
    color:#0f3460;
    margin-bottom:20px;
}
.table-custom {
    background:white;
    border-radius:10px;
    overflow:hidden;
    box-shadow:0 8px 20px rgba(0,0,0,0.1);
}
.table-hover tbody tr:hover { background-color:#f1f3f6; }
.back-btn {
    text-decoration:none;
    padding:8px 16px;
    background:#0f3460;
    color:white;
    border-radius:8px;
    font-weight:600;
    transition:0.3s;
}
.back-btn:hover { background:#1a4c85; }
</style>
</head>

<body>

<div class="container">
    <a href="admin_dashboard.jsp" class="back-btn">&larr; Back</a>

    <div class="container-box mt-3">
        <div class="title-text">
            Enrolled Students for: <span style="color:#1a4c85;"><%= courseTitle %></span>
        </div>

        <table class="table table-bordered table-hover table-custom">
            <thead class="table-dark">
                <tr>
                    <th>Student ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                </tr>
            </thead>

            <tbody>
            <%
                boolean hasStudents = false;

                try {
                    while(rsStudents != null && rsStudents.next()) {
                        hasStudents = true;
            %>
                <tr>
                    <td><%= rsStudents.getInt("student_id") %></td>
                    <td><%= rsStudents.getString("name") %></td>
                   
                    <td><%= rsStudents.getString("email") %></td>
                    <td><%= rsStudents.getString("contact") %></td>
                </tr>
            <%
                    }

                    if(!hasStudents) {
            %>
                <tr>
                    <td colspan="5" class="text-center text-danger fw-bold">
                        No students have enrolled in this course yet.
                    </td>
                </tr>
            <%
                    }
                } catch(Exception e) {}
            %>
            </tbody>
        </table>
    </div>
</div>

<%
    try {
        if(rsCourse != null) rsCourse.close();
        if(rsStudents != null) rsStudents.close();
        if(psCourse != null) psCourse.close();
        if(psStudents != null) psStudents.close();
        if(con != null) con.close();
    } catch(Exception e) {}
%>

</body>
</html>
