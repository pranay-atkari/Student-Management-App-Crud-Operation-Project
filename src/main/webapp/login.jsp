<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- ✅ Responsive scaling -->
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
      rel="stylesheet" crossorigin="anonymous">

<style>
    html, body {
        height: 100%;
        margin: 0;
    }

    body {
        background: url("<c:url value='/images/360_F_119115529_mEnw3lGpLdlDkfLgRcVSbFRuVl6sMDty.jpg'/>") 
                    no-repeat center center fixed;
        background-size: cover;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 15px; /* ✅ prevent content sticking on mobile edges */
    }

    .login-card {
        background: rgba(255, 255, 255, 0.9);
        border-radius: 20px;
        padding: 35px;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.35);
        width: 100%;
        max-width: 450px;   /* ✅ responsive width */
        backdrop-filter: blur(6px);
        text-align: center;
    }

    .login-title {
        font-weight: 700;
        color: #333;
        margin-bottom: 20px;
    }

    .btn-custom {
        background: linear-gradient(45deg, #007bff, #00bfff);
        border: none;
        color: white;
        font-weight: 500;
        padding: 12px;
        font-size: 16px;
        transition: 0.3s;
        border-radius: 8px;
    }

    .btn-custom:hover {
        background: linear-gradient(45deg, #0056b3, #0096c7);
        transform: scale(1.05);
    }

    .form-label {
        font-weight: 500;
    }

    form {
        width: 100%;
    }

    /* ✅ Mobile adjustments */
    @media (max-width: 576px) {
        .login-card {
            padding: 25px;
            max-width: 100%;
        }
        .btn-custom {
            font-size: 14px;
            padding: 10px;
        }
    }
</style>
</head>
<body>

    <div class="login-card">
        <h2 class="login-title">🔑 Login</h2>
        
        <!-- Show error message if login fails -->
        <c:if test="${not empty login_fail}">
            <div class="alert alert-danger text-center py-2 w-100">
                ${login_fail}
            </div>
        </c:if>
        
        <form action="login" method="post">
            <div class="mb-3 text-start">
                <label class="form-label">👤 Username</label>
                <input type="text" name="username" class="form-control" placeholder="Enter username" required/>
            </div>
            
            <div class="mb-3 text-start">
                <label class="form-label">🔒 Password</label>
                <input type="password" name="password" class="form-control" placeholder="Enter password" required/>
            </div>
            
            <button class="btn btn-custom w-100 mt-2" type="submit">Login</button>
        </form>
    </div>

</body>
</html>
