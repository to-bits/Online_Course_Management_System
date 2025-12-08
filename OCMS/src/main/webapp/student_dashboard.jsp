<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.ocms.db.DBConnect" %>
<%
    Integer studentId = (Integer) session.getAttribute("studentId");
    String studentName = (String) session.getAttribute("studentName");
    if(studentId == null) {
        response.sendRedirect("student_login.jsp");
        return;
    }

    Connection con = null;
    PreparedStatement psEnrolled = null;
    PreparedStatement psAllCourses = null;
    ResultSet rsEnrolled = null;
    ResultSet rsAllCourses = null;

    try {
        con = DBConnect.getConnection();

        psEnrolled = con.prepareStatement(
            "SELECT c.course_id, c.title, c.description, t.name AS teacher_name " +
            "FROM courses c " +
            "LEFT JOIN teacher t ON c.teacher_id = t.teacher_id " +
            "INNER JOIN enrollments e ON c.course_id = e.course_id " +
            "WHERE e.student_id=?"
        );
        psEnrolled.setInt(1, studentId);
        rsEnrolled = psEnrolled.executeQuery();

        psAllCourses = con.prepareStatement(
            "SELECT * FROM courses WHERE course_id NOT IN " +
            "(SELECT course_id FROM enrollments WHERE student_id=?)"
        );
        psAllCourses.setInt(1, studentId);
        rsAllCourses = psAllCourses.executeQuery();

    } catch(Exception e) {
        out.println("<h3 style='color:red;'>Error: "+e.getMessage()+"</h3>");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Student Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body { font-family:'Segoe UI',sans-serif; background:#f4f6ff; padding:20px; }
.navbar-custom {
    background:#0f3460;
    color:white;
    padding:15px 20px;
    border-radius:10px;
    font-weight:bold;
    margin-bottom:30px;
    display:flex;
    justify-content: space-between;
    align-items: center;
}
.navbar-custom a { color:white; text-decoration:none; font-weight:500; }
.navbar-custom a:hover { text-decoration:underline; }
.section-card {
    background:white;
    border-radius:15px;
    padding:25px;
    margin-bottom:30px;
    box-shadow:0 8px 20px rgba(0,0,0,0.1);
}
.section-card h3 { color:#0f3460; margin-bottom:20px; }
.table-custom {
    border-radius:10px;
    overflow:hidden;
    box-shadow:0 4px 15px rgba(0,0,0,0.1);
}
.table-custom th, .table-custom td { vertical-align: middle !important; }
.btn-enroll {
    background:#0f3460;
    color:white;
    font-weight:bold;
    border-radius:8px;
    transition:0.3s;
}
.btn-enroll:hover { background:#153053; color:#fff; }
</style>
</head>
<body>
<div class="container">
    <div class="navbar-custom">
        <span>Welcome, <%= studentName %></span>
        <a href="logout.jsp">Logout</a>
    </div>

    <!-- Enrolled Courses -->
    <div class="section-card">
        <h3>Your Enrolled Courses</h3>
        <table class="table table-bordered table-hover table-custom">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Teacher</th>
                </tr>
            </thead>
            <tbody>
            <%
                try {
                    boolean hasCourses = false;
                    while(rsEnrolled != null && rsEnrolled.next()) {
                        hasCourses = true;
            %>
                <tr>
                    <td><%= rsEnrolled.getInt("course_id") %></td>
                    <td><%= rsEnrolled.getString("title") %></td>
                    <td><%= rsEnrolled.getString("description") %></td>
                    <td><%= rsEnrolled.getString("teacher_name") %></td>
                </tr>
            <%
                    }
                    if(!hasCourses) {
            %>
                <tr>
                    <td colspan="4" class="text-center text-muted">You have not enrolled in any courses yet.</td>
                </tr>
            <%
                    }
                } catch(Exception e) {}
            %>
            </tbody>
        </table>
    </div>

    <!-- Enroll in New Courses -->
    <div class="section-card">
        <h3>Enroll in a New Course</h3>
        <form action="enroll_course.jsp" method="post">
            <div class="mb-3">
                <label class="form-label">Select Course</label>
                <select name="course_id" class="form-select" required>
                    <option value="">-- Select Course --</option>
                    <%
                        try {
                            boolean hasAvailable = false;
                            while(rsAllCourses != null && rsAllCourses.next()) {
                                hasAvailable = true;
                    %>
                    <option value="<%= rsAllCourses.getInt("course_id") %>"><%= rsAllCourses.getString("title") %></option>
                    <%
                            }
                            if(!hasAvailable) {
                    %>
                    <option value="">No courses available to enroll</option>
                    <%
                            }
                        } catch(Exception e) {}
                    %>
                </select>
            </div>
            <button type="submit" class="btn btn-enroll">Enroll Now</button>
        </form>
    </div>
</div>

<%
    try {
        if(rsEnrolled != null) rsEnrolled.close();
        if(psEnrolled != null) psEnrolled.close();
        if(rsAllCourses != null) rsAllCourses.close();
        if(psAllCourses != null) psAllCourses.close();
        if(con != null) con.close();
    } catch(Exception e) {}
%>
</body>
</html>
