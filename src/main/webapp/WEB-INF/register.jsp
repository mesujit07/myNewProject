<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Form</title>
    <style>
        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
            background-color: #fff;
        }
        
        .register-image {
            width: 100px;
            height: 100px;
            margin: 0 auto 20px;
            display: block;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        
        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        .submit-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        
        .submit-btn:hover {
            background-color: #45a049;
        }
        
        .login-link {
            text-align: center;
            margin-top: 15px;
        }
        
        .login-link a {
            color: #4CAF50;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="https://cdn-icons-png.flaticon.com/512/5087/5087579.png" alt="Register Icon" class="register-image">
        <form action="/register" method="post">
            <div class="form-group">
                <label for="username">Name:</label>
                <input type="text" id="username" name="username" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <div class="form-group">
                <label for="DOB">Date Of Birth</label>
                <input type="date" id="DOB" name="DOB" required>
            </div>
            
            <button type="submit" class="submit-btn">Register</button>
        </form>
        
        <!-- Display messages -->
        <p style="color: red;">
            ${error != null ? error : ''}
        </p>
        <p style="color: green;">
            ${message != null ? message : ''}
        </p>
        
        <div class="login-link">
            Already have an account? <a href="/login">Login here</a>
        </div>
    </div>
</body>
</html>
