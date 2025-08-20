<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Details</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
<style>
    body {
        background: url("<c:url value='/images/viewstudent.jpg'/>")
                    no-repeat center center fixed;
        background-size: cover;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
    }

    /* Navbar Glass Effect */
    .navbar-custom {
        background: #ffffff;
        backdrop-filter: blur(10px);
        padding: 0.5rem 2rem;
        box-shadow: 0 4px 12px rgba(0,0,0,0.2);
    }
    .navbar-custom img {
        height: 77px;
        border-radius: 8px;
    }
    .navbar-custom .btn {
        margin-left: 10px;
        border-radius: 20px;
        font-weight: 500;
        transition: all 0.3s ease-in-out;
        padding: 5px 15px;
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

    /* Content box */
    .content-box {
        background: rgba(255, 255, 255, 0.95);
        border-radius: 15px;
        padding: 30px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.25);
        margin: 40px auto;
        max-width: 1200px;
    }

    .student-name {
        color: #d9534f;
        font-weight: 600;
    }

    .table thead th {
        background: #f8f9fa;
        font-weight: 600;
    }

    h3 {
        font-weight: 700;
        color: #333;
    }
</style>
</head>
<body>

<nav class="navbar navbar-custom d-flex justify-content-between align-items-center">
    <img src="<c:url value='/images/cjclogo.jpeg.jpg'/>" alt="logo">
    <div>
        <a href="/admin" class="btn btn-outline-primary btn-sm btn-enroll">Enroll Student</a>
        <a href="/student-details" class="btn btn-outline-success btn-sm btn-view">View Student</a>
        <a href="/" class="btn btn-outline-danger btn-sm btn-logout">Logout</a>
    </div>
</nav>

<div class="container content-box">
    <h3 class="text-center mb-4">📘 Student Details</h3>

    <c:if test="${not empty success}">
        <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
            ${success}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <c:if test="${not empty message}">
        <div class="alert alert-warning text-center">${message}</div>
    </c:if>

    <div class="d-flex justify-content-center mb-4">
      <form action="/search" method="get" class="d-flex">
        <select name="batchNumber" class="form-select form-select-sm me-2">
          <option value="" selected>Select Batch Number</option>
          <option>FDJ-160</option>
          <option>REG-160</option>
          <option>FDJ-161</option>
        </select>
        <button class="btn btn-outline-primary btn-sm" type="submit">Search</button>
      </form>
    </div>

    <div class="table-responsive">
        <table class="table table-bordered table-hover text-center align-middle">
          <thead>
            <tr>
              <th>ID</th><th>Name</th><th>Email</th><th>Age</th>
              <th>College</th><th>Course</th><th>Batch</th><th>Mode</th><th>Fees</th><th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${data}" var="s">
              <tr>
                <td>${s.studentId}</td>
                <td class="student-name">${s.studentFullName}</td>
                <td>${s.studentEmail}</td>
                <td>${s.studentAge}</td>
                <td>${s.studentCollageName}</td>
                <td>${s.studentCourse}</td>
                <td>${s.batchNumber}</td>
                <td>${s.batchMode}</td>
                <td>${s.feesPaid}</td>
                <td>
                  <a class="btn btn-sm btn-success" href="/fees?id=${s.studentId}">Pay Fees</a>
                  <a class="btn btn-sm btn-danger"
                     href="/delete?id=${s.studentId}"
                     onclick="return confirm('Are you sure you want to delete this student?');">
                      Delete
                  </a>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>