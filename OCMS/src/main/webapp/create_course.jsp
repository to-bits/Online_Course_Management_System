<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String adminName = (String) session.getAttribute("adminName");
    if(adminName == null) { response.sendRedirect("admin_login.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Course</title>
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
    <h2>Create New Course</h2>

    <form action="create_course_process.jsp" method="post">
        <div class="mb-3">
            <label class="form-label">Course Title</label>
            <input type="text" name="title" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea name="description" class="form-control" rows="3" required></textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">Seats</label>
            <input type="number" name="seats" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary btn-custom">Create</button>
    </form>
</div>

</body>
</html>
