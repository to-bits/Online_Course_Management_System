<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.ocms.db.DBConnect" %>
<%
    String adminName = (String) session.getAttribute("adminName");
    if(adminName == null) {
        response.sendRedirect("admin_login.jsp");
        return;
    }

    String courseIdStr = request.getParameter("course_id");
    if(courseIdStr != null) {
        int courseId = Integer.parseInt(courseIdStr);
        Connection con = null;
        PreparedStatement ps = null;
        String message = "";

        try {
            con = DBConnect.getConnection();
            String sql = "DELETE FROM courses WHERE course_id=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, courseId);
            int rows = ps.executeUpdate();
            if(rows > 0) {
                message = "Course deleted successfully!";
            } else {
                message = "Course not found!";
            }
        } catch(Exception e) {
            message = "Error: " + e.getMessage();
        } finally {
            if(ps != null) ps.close();
            if(con != null) con.close();
        }

        // Redirect back to dashboard with optional message
        response.sendRedirect("admin_dashboard.jsp?msg=" + java.net.URLEncoder.encode(message, "UTF-8"));
    } else {
        response.sendRedirect("admin_dashboard.jsp");
    }
%>
