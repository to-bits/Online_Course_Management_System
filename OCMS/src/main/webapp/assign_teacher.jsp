<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.ocms.db.DBConnect" %>
<%
    String adminName = (String) session.getAttribute("adminName");
    if(adminName == null) { response.sendRedirect("admin_login.jsp"); return; }

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rsCourses = null;
    ResultSet rsTeachers = null;

    try {
        con = DBConnect.getConnection();
        ps = con.prepareStatement("SELECT * FROM courses");
        rsCourses = ps.executeQuery();

        ps = con.prepareStatement("SELECT * FROM teacher");
        rsTeachers = ps.executeQuery();
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Assign Teacher</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background:#e8ecff; font-family:'Segoe UI',sans-serif; }
        .box { width:500px; margin:auto; margin-top:60px; background:white; padding:35px; border-radius:15px; box-shadow:0 4px 20px rgba(0,0,0,0.15); }
        h2 { text-align:center; font-weight:bold; color:#0f3460; margin-bottom:25px; }
        .btn-custom { width:100%; font-weight:bold; border-radius:10px; }
    </style>
</head>
<body>
<div class="box">
    <h2>Assign Teacher to Course</h2>
    <form action="assign_teacher_process.jsp" method="post">
        <div class="mb-3">
            <label class="form-label">Select Course</label>
            <select name="course_id" class="form-control" required>
                <option value="">--Select Course--</option>
                <%
                    while(rsCourses.next()) {
                        out.println("<option value='"+rsCourses.getInt("course_id")+"'>"+rsCourses.getString("title")+"</option>");
                    }
                %>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Select Teacher</label>
            <select name="teacher_id" class="form-control" required>
                <option value="">--Select Teacher--</option>
                <%
                    while(rsTeachers.next()) {
                        out.println("<option value='"+rsTeachers.getInt("teacher_id")+"'>"+rsTeachers.getString("name")+"</option>");
                    }
                %>
            </select>
        </div>
        <button type="submit" class="btn btn-primary btn-custom">Assign Teacher</button>
    </form>
</div>
</body>
</html>

<%
    if(rsCourses != null) rsCourses.close();
    if(rsTeachers != null) rsTeachers.close();
    if(ps != null) ps.close();
    if(con != null) con.close();
%>
