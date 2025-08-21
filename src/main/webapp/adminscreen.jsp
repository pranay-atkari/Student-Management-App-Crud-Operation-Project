<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Enroll Student</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
<style>
/* Background image full screen */
.enroll {
    background: url("../images/online-learning-design.jpg") no-repeat center center;
    background-size: cover;
    min-height: 100vh;
    position: relative;
}

/* Dark overlay for readability */
.enroll::before {
    content: "";
    position: absolute;
    top: 0; left: 0; right: 0; bottom: 0;
    background: rgba(0,0,0,0.4);
}

/* Card styling */
.card-registration {
    width: 100%;
    max-width: 850px;
    margin: auto;
    border-radius: 15px;
    position: relative;
    z-index: 2;
    background: rgba(255,255,255,0.95);
}

/* Navbar Styling */
.navbar-custom {
    background-color: #ffffff;
    padding: 0.5rem 2rem;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
}
.navbar-custom img {
    height: 70px;
}
.navbar-custom .btn {
    margin-left: 10px;
    border-radius: 20px;
    font-weight: 500;
    transition: all 0.3s ease-in-out;
}
.btn-enroll:hover {
    background-color: #007bff;
    color: #fff;
}
.btn-view:hover {
    background-color: #28a745;
    color: #fff;
}
.btn-logout:hover {
    background-color: #dc3545;
    color: #fff;
}

/* 🚫 Hide number spinners (Chrome, Edge, Safari) */
input[type=number]::-webkit-inner-spin-button,
input[type=number]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
/* 🚫 Hide number spinners (Firefox) */
input[type=number] {
    -moz-appearance: textfield;
}
</style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-custom d-flex justify-content-between align-items-center">
    <img src="../images/cjclogo.jpeg.jpg" height="90" alt="logo">
    <div>
        <a href="/admin" class="btn btn-outline-primary btn-sm btn-enroll">Enroll Student</a>
        <a href="/student-details" class="btn btn-outline-success btn-sm btn-view">View Student</a>
        <a href="/" class="btn btn-outline-danger btn-sm btn-logout">Logout</a>
    </div>
</nav>

<!-- Enrollment Form Section -->
<section class="enroll d-flex align-items-center justify-content-center">
  <div class="card card-registration p-4 shadow-lg">
    <h3 class="text-center mb-3 text-primary fw-bold">Student Enrollment Form</h3>

    <form action="/enroll_student" method="post">
      <div class="row">
        <div class="col-md-6 mb-3">
          <label class="form-label">Full Name</label>
          <input type="text" name="studentFullName" class="form-control" required/>
        </div>
        <div class="col-md-6 mb-3">
          <label class="form-label">Email</label>
          <input type="email" name="studentEmail" class="form-control" required/>
        </div>
      </div>

      <div class="row">
        <div class="col-md-6 mb-3">
          <label class="form-label">Age</label>
          <!-- 🚫 No spinner, only whole numbers -->
          <input type="number" name="studentAge" class="form-control" required min="1" step="1"/>
        </div>
        <div class="col-md-6 mb-3">
          <label class="form-label">College Name</label>
          <input type="text" name="studentCollageName" class="form-control" required/>
        </div>
      </div>

      <div class="row">
        <div class="col-md-6 mb-3">
          <label class="form-label">Fees Paid</label>
          <!-- 🚫 No spinner, only whole numbers -->
          <input type="number" name="feesPaid" class="form-control" required min="0" step="1"/>
        </div>
        <div class="col-md-6 mb-3">
          <label class="form-label d-block">Course</label>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="studentCourse" value="Java" checked/>
            <label class="form-check-label">Java</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="studentCourse" value="Python"/>
            <label class="form-check-label">Python</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="studentCourse" value="Testing"/>
            <label class="form-check-label">Testing</label>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-6 mb-3">
          <label class="form-label">Batch Mode</label>
          <select name="batchMode" class="form-select" required>
            <option disabled selected>Select Batch Mode</option>
            <option>Online</option>
            <option>Offline</option>
          </select>
        </div>
        <div class="col-md-6 mb-3">
          <label class="form-label">Batch Number</label>
          <select name="batchNumber" class="form-select" required>
            <option disabled selected>Select Batch Number</option>
            <option>FDJ-160</option>
            <option>REG-160</option>
            <option>FDJ-161</option>
          </select>
        </div>
      </div>

      <div class="d-flex justify-content-center mt-3">
        <button type="submit" class="btn btn-primary btn-lg px-5">Submit</button>
      </div>
    </form>
  </div>
</section>
</body>
</html>
