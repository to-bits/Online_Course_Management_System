<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Register Portal</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
      background: rgb(100, 39, 82);
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      color: #fff;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .register-section {
      flex: 1;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 3rem 1rem;
    }

    /* Left image */
    .register-left {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .register-left img {
      max-width: 85%;
      border-radius: 1rem;
      box-shadow: 0 12px 30px rgba(0,0,0,0.4);
      transition: transform .3s ease;
    }
    .register-left img:hover {
      transform: scale(1.05);
    }

    /* Right registration cards */
    .register-right {
      flex: 1;
      display: flex;
      flex-direction: column;
      gap: 1.8rem;
    }

    .reg-card {
      background: #fff;
      color: #333;
      border-radius: 1rem;
      padding: 1.8rem 1.5rem;
      text-align: center;
      box-shadow: 0 8px 25px rgba(0,0,0,0.2);
      transition: transform .3s ease, box-shadow .3s ease;
      cursor: pointer;
    }
    .reg-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 12px 40px rgba(0,0,0,0.35);
    }
    .reg-card h5 {
      margin-bottom: 0.8rem;
      font-weight: 600;
    }
    .reg-card p {
      font-size: 0.95rem;
      color: #555;
      margin-bottom: 1rem;
    }

    .btn-register {
      width: 100%;
      font-weight: 600;
      border-radius: 0.6rem;
    }

    /* Responsive */
    @media (max-width: 992px) {
      .register-section {
        flex-direction: column;
      }
      .register-left, .register-right {
        flex: unset;
        width: 100%;
      }
      .register-left {
        margin-bottom: 2rem;
      }
    }
  </style>
</head>
<body>

<section class="register-section container">
  <!-- Left image -->
  <div class="register-left">
    <img src="sing_up.png" alt="Register Image"> <!-- আপনার ইমেজ নাম দিন -->
  </div>

  <!-- Right registration cards -->
  <div class="register-right">
    <!-- Teacher Registration Card -->
    <div class="reg-card">
      <div class="mb-3 fs-1 text-success"><i class="bi bi-mortarboard-fill"></i></div>
      <h5>Teacher Registration</h5>
      <p>Fill teacher registration form with your contact details.</p>
      <button class="btn btn-success btn-register" onclick="window.location.href='teacher_res.jsp'">Register</button>
    </div>

    <!-- Student Registration Card -->
    <div class="reg-card">
      <div class="mb-3 fs-1 text-warning"><i class="bi bi-person-fill"></i></div>
      <h5>Student Registration</h5>
      <p>Fill student registration form with your education details.</p>
      <button class="btn btn-warning btn-register text-dark" onclick="window.location.href='student_res.jsp'">Register</button>
    </div>
  </div>
</section>

</body>
</html>
