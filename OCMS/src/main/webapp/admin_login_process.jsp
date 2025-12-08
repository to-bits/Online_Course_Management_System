<%@ page import="java.sql.*" %>
<%@ include file="dbconnect.jsp" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try {
        String sql = "SELECT * FROM admins WHERE username=? AND password=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            // Login successful
            session.setAttribute("admin_username", username); // session maintain
            response.sendRedirect("admin_page.jsp");
        } else {
%>
            <h3 style="color:red; text-align:center; margin-top:50px;">
                Invalid Username or Password
            </h3>
            <p style="text-align:center;"><a href="admin_login.jsp" style="color:white;">Go back to Login</a></p>
<%
        }

        rs.close();
        ps.close();
        conn.close();
    } catch(Exception e) {
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    }
%>
