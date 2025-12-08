<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About - Course Management System</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    :root {
      --bg-color: #f8f9fa; /* page background */
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      min-height: 100vh;
      background-color: var(--bg-color);
      display: flex;
      flex-direction: column;
    }

    .custom-nav {
      background-color: #4c5d18;
    }
    .custom-nav .nav-link {
      color: #e0e0e0;
    }
    .custom-nav .nav-link:hover {
      color: #fff;
    }

    .about-section {
      flex: 1;
      padding: 4rem 2rem;
      max-width: 900px;
      margin: 0 auto;
      text-align: center;
    }

    .about-section h1 {
      margin-bottom: 1.5rem;
      font-weight: 700;
      color: #333;
    }

    .about-section p {
      font-size: 1.1rem;
      color: #555;
      margin-bottom: 1rem;
      line-height: 1.6;
    }

    footer {
      padding: 1rem;
      text-align: center;
      color: #666;
      font-size: 0.9rem;
      margin-top: auto;
      background-color: #e9ecef;
    }

    .highlight {
      color: #4c5d18;
      font-weight: 600;
    }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark custom-nav shadow">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="index.jsp">Course Management System</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                data-bs-target="#navbarNav" aria-controls="navbarNav" 
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link active" href="about.jsp">About</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- About Section -->
<section class="about-section">
  <h1>About Course Management System</h1>
  <p>
    Our <span class="highlight">Course Management System (CMS)</span> is designed to simplify the management of courses, students, and teachers for educational institutions.
    It provides an easy-to-use platform where <span class="highlight">administrators</span> can manage users, create courses, and monitor progress efficiently.
  </p>
  <p>
    <span class="highlight">Teachers</span> can create course content, manage assignments, grade students, and communicate seamlessly. 
    <span class="highlight">Students</span> can enroll in courses, submit assignments, track grades, and stay updated with course materials in real-time.
  </p>
  <p>
    This system is built using <span class="highlight">Java Servlets, JSP, Bootstrap, and MySQL</span> to provide a robust and scalable solution for educational institutions looking to modernize their course management process.
  </p>
  <p>
    The platform ensures a smooth and interactive experience for all users with a <span class="highlight">responsive design</span> and <span class="highlight">secure login</span> system.
  </p>
</section>

<footer>
  &copy; 2025 Course Management System. All Rights Reserved.
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
