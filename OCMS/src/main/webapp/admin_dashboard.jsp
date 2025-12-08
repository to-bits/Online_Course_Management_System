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
    Statement stmtCourses = null;
    ResultSet rsCourses = null;

    try {
        con = DBConnect.getConnection();
        stmtCourses = con.createStatement();
        rsCourses = stmtCourses.executeQuery(
            "SELECT c.course_id, c.title, c.seats, t.name AS teacher_name " +
            "FROM courses c LEFT JOIN teacher t ON c.teacher_id=t.teacher_id " +
            "ORDER BY c.course_id DESC"
        );
    } catch(Exception e) {
        out.println("<h3 style='color:red;'>Error: "+e.getMessage()+"</h3>");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

<style>
body {
    font-family:'Inter',sans-serif;
    background: linear-gradient(135deg, #f4f6ff, #e2e6f0);
    padding:20px;
}

.navbar-custom {
    background:#0f3460;
    color:white;
    padding:20px 30px;
    font-size:24px;
    font-weight:bold;
    border-radius:10px;
    margin-bottom:30px;
    display:flex;
    justify-content: space-between;
    align-items: center;
}
.navbar-custom a { color:white; text-decoration:none; font-size:16px; transition: 0.3s; }
.navbar-custom a:hover { color:#ffd700; }

.dashboard-cards {
    display:flex;
    flex-wrap:wrap;
    gap:20px;
    margin-bottom:40px;
}
.card-box {
    flex:1 1 300px;
    border-radius:15px;
    padding:30px;
    background:white;
    box-shadow:0 8px 25px rgba(0,0,0,0.15);
    text-align:center;
    transition:0.3s;
    cursor: pointer;
}
.card-box:hover { transform: translateY(-5px); box-shadow:0 12px 30px rgba(0,0,0,0.25); }
.card-box h4 { margin-bottom:10px; color:#0f3460; font-weight:600; }
.card-box p { color:#555; font-size:15px; }

.table-custom {
    background:white;
    border-radius:10px;
    box-shadow:0 8px 20px rgba(0,0,0,0.1);
    overflow:hidden;
}
.table th, .table td { vertical-align: middle !important; }
.table-hover tbody tr:hover { background-color: #f1f3f6; }
.btn-delete { font-size:14px; padding:4px 10px; border-radius:5px; }
</style>
</head>

<body>

<div class="navbar-custom">
    <div>Admin Dashboard | Welcome, <%= adminName %></div>
    <a href="logout.jsp">Logout</a>
</div>

<div class="dashboard-cards">
    <a href="create_course.jsp" style="text-decoration:none;">
        <div class="card-box">
            <h4>Create Course</h4>
            <p>Launch new courses for students</p>
        </div>
    </a>

    <a href="assign_teacher.jsp" style="text-decoration:none;">
        <div class="card-box">
            <h4>Assign Teacher</h4>
            <p>Assign teachers to courses</p>
        </div>
    </a>

    <a href="view_all.jsp" style="text-decoration:none;">
        <div class="card-box">
            <h4>View All Users</h4>
            <p>See all students and teachers</p>
        </div>
    </a>
</div>

<h3>All Courses</h3>

<table class="table table-bordered table-hover table-custom">
    <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Seats</th>
            <th>Assigned Teacher</th>
            <th>Enrolled Students</th>
            <th>Action</th>
        </tr>
    </thead>

    <tbody>
    <%
        try {
            while(rsCourses != null && rsCourses.next()) {
                int courseId = rsCourses.getInt("course_id");
    %>
        <tr>
            <td><%= courseId %></td>
            <td><%= rsCourses.getString("title") %></td>
            <td><%= rsCourses.getInt("seats") %></td>
            <td><%= rsCourses.getString("teacher_name") != null ? rsCourses.getString("teacher_name") : "Not Assigned" %></td>

            <!-- NEW COLUMN: View Enrolled Students -->
            <td>
                <a href="view_course_students.jsp?course_id=<%= courseId %>"
                   class="btn btn-info btn-sm">
                    View Students
                </a>
            </td>

            <!-- Delete -->
            <td>
                <form method="post" action="delete_course.jsp"
                      onsubmit="return confirm('Are you sure you want to delete this course?');">
                    <input type="hidden" name="course_id" value="<%= courseId %>">
                    <button type="submit" class="btn btn-danger btn-delete">Delete</button>
                </form>
            </td>
        </tr>
    <%
            }
        } catch(Exception e) {}
    %>
    </tbody>
</table>

<%
    try {
        if(rsCourses != null) rsCourses.close();
        if(stmtCourses != null) stmtCourses.close();
        if(con != null) con.close();
    } catch(Exception e) {}
%>

</body>
</html>
