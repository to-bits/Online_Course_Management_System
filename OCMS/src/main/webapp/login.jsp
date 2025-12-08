<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Login Portal</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
      background: rgb(34, 65, 105);
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      color: #fff;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .hero {
      padding: 3rem 1rem; /* slightly smaller */
      text-align: center;
    }
    .role-card {
      transition: transform .2s ease, box-shadow .2s ease;
      cursor: pointer;
      border: none;
      border-radius: 1rem;
      height: 18rem; /* slightly smaller */
    }
    .role-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 12px 40px rgba(0, 0, 0, 0.25);
    }
    .role-card .card-body {
      background: #fff;
      border-radius: 1rem;
      color: #333;
      padding: 1.5rem;
    }
    .btn-role {
      width: 100%;
      border-radius: 0.5rem;
      font-weight: 600;
      margin-top: 10px;
    }
    footer {
      margin-top: auto;
      padding: 1rem 0;
      text-align: center;
      color: #e2e8f0;
    }
    .signup-msg {
      margin-top: 2rem;
      text-align: center;
      color: #fff;
      font-size: 1rem;
    }
    .signup-msg a {
      color: #ffd700;
      text-decoration: none;
      font-weight: 600;
    }
    .signup-msg a:hover {
      text-decoration: underline;
    }
    .navbar-brand {
      font-size: 1.5rem;
      font-weight: bold;
      color: #fff !important;
    }
    .nav-link {
      color: #e2e8f0 !important;
    }
    .nav-link:hover {
      color: #fff !important;
    }
   .custom-navbar {
    background-color: #153053; /* তোমার পছন্দের color */
  }
  .custom-navbar .navbar-brand {
    color: #fff; /* text color */
    font-weight: bold;
  }
  </style>
</head>
<body>

  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg custom-navbar">
  <div class="container">
    <a class="navbar-brand" href="#">Login Portal</a>
  </div>
</nav>

  <!-- Roles Section -->
  <section id="roles" class="mt-5 pt-5">
    <div class="container">
      <div class="row g-4 justify-content-center">
        <!-- Admin Card -->
        <div class="col-md-4">
          <div class="card role-card text-center p-3" onclick="openLogin('admin')">
            <div class="card-body">
              <div class="mb-3 fs-1 text-primary"><i class="bi bi-shield-lock-fill"></i></div>
              <h5 class="card-title">Admin</h5>
              <p class="card-text">Manage users and courses site-wide.</p>
              <button class="btn btn-primary btn-role" onclick="openLogin('admin'); event.stopPropagation();">Admin Login</button>
            </div>
          </div>
        </div>

        <!-- Teacher Card -->
        <div class="col-md-4">
          <div class="card role-card text-center p-3" onclick="openLogin('teacher')">
            <div class="card-body">
              <div class="mb-3 fs-1 text-success"><i class="bi bi-mortarboard-fill"></i></div>
              <h5 class="card-title">Teacher</h5>
              <p class="card-text">Create courses and grade assignments.</p>
              <button class="btn btn-success btn-role" onclick="openLogin('teacher'); event.stopPropagation();">Teacher Login</button>
            </div>
          </div>
        </div>

        <!-- Student Card -->
        <div class="col-md-4">
          <div class="card role-card text-center p-3" onclick="openLogin('student')">
            <div class="card-body">
              <div class="mb-3 fs-1 text-warning"><i class="bi bi-person-fill"></i></div>
              <h5 class="card-title">Student</h5>
              <p class="card-text">Enroll in courses and view grades.</p>
              <button class="btn btn-warning text-dark btn-role" onclick="openLogin('student'); event.stopPropagation();">Student Login</button>
            </div>
          </div>
        </div>
      </div>

      <!-- Signup message -->
      <div class="signup-msg">
        If you haven’t registered yet, please <a href="register.jsp">Sign Up</a>.
      </div>
    </div>
  </section>

  <!-- Login Modal -->
  <div class="modal fade" id="loginModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="loginModalLabel">Login</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <form id="loginForm" method="post" action="#">
          <div class="modal-body">
            <input type="hidden" name="role" id="roleInput">
            <div class="mb-3">
              <label for="usernameInput" class="form-label">Username</label>
              <input type="text" class="form-control" id="usernameInput" name="username" required>
            </div>
            <div class="mb-3">
              <label for="passwordInput" class="form-label">Password</label>
              <input type="password" class="form-control" id="passwordInput" name="password" required>
            </div>
            <div id="loginHint" class="text-muted small"></div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Login</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <footer id="contact">
    <div class="container text-center mt-5">
      <small>© <span id="year"></span> OCMS — Contact: admin@example.com</small>
    </div>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script>
  document.getElementById('year').textContent = new Date().getFullYear();

  function openLogin(role) {
    role = role?.toLowerCase() || 'student';
    const titles = { admin: 'Admin Login', teacher: 'Teacher Login', student: 'Student Login' };
    // আলাদা login page সেট করবো
    const pages = { admin: 'admin_login.jsp', teacher: 'teacher_login.jsp', student: 'student_login.jsp' };

    // direct redirect করে দিবো
    window.location.href = pages[role] || "student_login.jsp";
  }
</script>

</body>
</html>