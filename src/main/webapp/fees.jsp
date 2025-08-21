<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- ✅ Responsive scaling -->
<title>Pay Fees</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
<style>
  body {
    background: url('../images/pngtree-illustration-of-tax-payment-concept-in-3d-render-image_3682339.jpg') 
                no-repeat center center fixed;
    background-size: cover;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    padding: 15px; /* ✅ Prevent content touching edges on small screens */
  }

  .card-box {
    background: rgba(255, 255, 255, 0.95);
    margin: 50px auto;
    padding: 30px;
    border-radius: 20px;
    box-shadow: 0px 6px 20px rgba(0,0,0,0.35);
    width: 100%;
    max-width: 700px;  /* ✅ Limit width for desktop */
  }

  h4 {
    text-align: center;
    font-weight: bold;
    margin-bottom: 25px;
    color: #2c3e50;
    font-size: 1.6rem;
  }

  table {
    margin-bottom: 25px;
  }

  table th {
    width: 40%;
    background: #f8f9fa;
  }

  table td {
    font-weight: 500;
  }

  .form-label {
    font-weight: 600;
  }

  .btn {
    font-weight: 600;
    padding: 10px;
    border-radius: 8px;
  }

  .btn-success {
    background: #28a745;
    border: none;
  }

  .btn-success:hover {
    background: #218838;
  }

  .btn-secondary {
    background: #6c757d;
    border: none;
  }

  .btn-secondary:hover {
    background: #5a6268;
  }

  /* ✅ Mobile adjustments */
  @media (max-width: 576px) {
    .card-box {
      padding: 20px;
      margin: 20px auto;
    }

    h4 {
      font-size: 1.3rem;
    }

    .d-flex {
      flex-direction: column; /* stack buttons */
      gap: 10px;
    }

    .btn {
      width: 100%;
    }
  }
</style>
</head>
<body>

<div class="card-box">
  <h4>💰 Pay Student Fees</h4>

  <table class="table table-bordered">
    <tr><th>Student Id</th><td>${st.studentId}</td></tr>
    <tr><th>Student Name</th><td>${st.studentFullName}</td></tr>
    <tr><th>Course</th><td>${st.studentCourse}</td></tr>
    <tr><th>Batch</th><td>${st.batchNumber}</td></tr>
    <tr><th>Fees Paid</th><td>₹ ${st.feesPaid}</td></tr>
  </table>

  <form action="/payfees" method="post">
    <input type="hidden" name="studentid" value="${st.studentId}" />
    
    <div class="mb-3">
      <label class="form-label">Enter Installment Amount</label>
      <input type="number" step="0.01" name="ammount" 
             class="form-control" placeholder="Enter amount" required />
    </div>

    <div class="d-flex justify-content-between">
      <button class="btn btn-success">Add Installment</button>
      <a href="/student-details" class="btn btn-secondary">Back</a>
    </div>
  </form>
</div>

</body>
</html>
