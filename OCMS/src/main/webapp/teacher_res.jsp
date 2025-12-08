<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Teacher Registration</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Inter', sans-serif;
      background: linear-gradient(135deg, #6a1b9a, #ab47bc);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      color: #fff;
    }

    .registration-card {
      background: rgba(255, 255, 255, 0.95);
      color: #333;
      border-radius: 1.2rem;
      padding: 2.5rem 2rem;
      box-shadow: 0 15px 40px rgba(0,0,0,0.3);
      width: 100%;
      max-width: 500px;
      transition: transform 0.4s ease, box-shadow 0.4s ease;
    }

    .registration-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 25px 60px rgba(0,0,0,0.4);
    }

    .registration-card h3 {
      font-weight: 700;
      margin-bottom: 1.5rem;
      text-align: center;
      color: #28a745;
    }

    .form-label {
      font-weight: 600;
    }

    .btn-register {
      width: 100%;
      font-weight: 600;
      border-radius: 0.6rem;
      padding: 0.6rem 0;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .btn-register:hover {
      transform: translateY(-3px);
      box-shadow: 0 8px 25px rgba(0,0,0,0.25);
    }

    @media (max-width: 576px) {
      .registration-card {
        padding: 2rem 1.5rem;
      }
    }
  </style>
</head>

<body>

  <div class="registration-card">
    <h3><i class="bi bi-mortarboard-fill"></i> Teacher Registration</h3>

    <form method="post" action="teacher_reg_process.jsp" autocomplete="off">

      <div class="mb-3">
        <label class="form-label">Full Name</label>
        <input type="text" name="name" class="form-control" required autocomplete="off" placeholder="Enter your full name">
      </div>

      <div class="mb-3">
        <label class="form-label">Set Password</label>
        <input type="password" name="password" class="form-control" required autocomplete="new-password" placeholder="Create a strong password">
        <small class="text-muted">Use at least 8 characters with letters & numbers.</small>
      </div>

      <div class="mb-3">
        <label class="form-label">Gmail Address</label>
        <input type="email" name="email" class="form-control" required autocomplete="off" placeholder="yourname@gmail.com">
        <small class="text-muted">Provide a valid Gmail address for verification.</small>
      </div>

      <div class="mb-3">
        <label class="form-label">Contact Number</label>
        <input type="text" name="contact" class="form-control" required autocomplete="off" placeholder="+8801XXXXXXXXX">
        <small class="text-muted">Enter your active phone number.</small>
      </div>

      <div class="mb-3">
        <label class="form-label">Specialization</label>
        <input type="text" name="specialization" class="form-control" required autocomplete="off" placeholder="e.g., Java, Python, Web Development">
        <small class="text-muted">Mention your main teaching subjects.</small>
      </div>

      <div class="mb-3">
        <label class="form-label">Experience (Years)</label>
        <input type="number" name="experience" class="form-control" min="0" required autocomplete="off" placeholder="0">
        <small class="text-muted">How many years you have been teaching.</small>
      </div>

      <button type="submit" class="btn btn-success btn-register">Register</button>

    </form>
  </div>

</body>
</html>
