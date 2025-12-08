📚 Online Course Management System (OCMS)

A full-featured web application built with JSP, Servlet, and MySQL that allows Admins, Students, and Teachers to manage online course operations efficiently. The system supports course creation, teacher assignment, student enrollment, authentication, and more.

🚀 Features
👨‍💼 Admin Features

Admin Login & Authentication

Create Courses

Assign Teachers to Courses

View All Students & Teachers

Delete Courses

View Students Enrolled in Each Course

👨‍🎓 Student Features

Student Registration & Login

View Available Courses

Enroll in Courses

View Enrolled Courses

👨‍🏫 Teacher Features

Teacher Login

View Assigned Courses

View Students Enrolled in Their Courses

🛠️ Technologies Used
Category	Technologies
Backend	Java (JSP + Servlet), JDBC
Frontend	HTML, CSS, Bootstrap 5
Database	MySQL
Styling	Custom CSS, Google Fonts
Tools	Eclipse IDE, Apache Tomcat, GitHub
🗂️ Project Structure
OnlineCourseManagementSystem/
│
├── src/
│   └── com/ocms/db/DBConnect.java
│
├── webapp/
│   ├── admin_login.jsp
│   ├── student_login.jsp
│   ├── create_course.jsp
│   ├── assign_teacher.jsp
│   ├── admin_dashboard.jsp
│   ├── view_students.jsp
│   ├── view_all.jsp
│   ├── delete_course.jsp
│   ├── student_register.jsp
│   ├── student_home.jsp
│   └── ...
│
├── WEB-INF/
│   └── web.xml
│
└── README.md

🗄️ Database Structure
Students Table
Column	Type	Notes
student_id	INT	PK, Auto Increment
name	VARCHAR	
email	VARCHAR	
password	VARCHAR	
Teacher Table
Column	Type	Notes
teacher_id	INT	PK, Auto Increment
name	VARCHAR	
email	VARCHAR	
password	VARCHAR	
Courses Table
Column	Type	Notes
course_id	INT	PK, Auto Increment
title	VARCHAR	
seats	INT	
teacher_id	INT	FK
Enrollments Table
Column	Type	Notes
id	INT	PK, Auto Increment
student_id	INT	FK
course_id	INT	FK
📜 License

This project is for educational purposes. You may modify or distribute it freely.
