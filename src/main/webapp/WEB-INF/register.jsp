<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | MyProject</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>
<style>
    body {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        font-family: 'Poppins', sans-serif;
    }

    .container {
        background: rgba(255, 255, 255, 0.95);
        padding: 35px;
        border-radius: 20px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
        width: 320px;
        text-align: center;
        backdrop-filter: blur(10px);
    }

    .register-image {
        width: 80px;
        height: 80px;
        margin-bottom: 20px;
        border-radius: 50%;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease;
    }

    .register-image:hover {
        transform: scale(1.05);
    }

    .form-group {
        margin-bottom: 20px;
        text-align: left;
    }

    .form-group label {
        display: block;
        color: #666;
        font-size: 14px;
        margin-bottom: 5px;
    }

    .form-group input {
        width: 100%;
        padding: 12px 2px;
        border: none;
        border-bottom: 2px solid #e0e0e0;
        border-radius: 0;
        box-sizing: border-box;
        font-size: 14px;
        transition: all 0.3s ease;
        background: transparent;
    }

    .form-group input:focus {
        border-bottom: 2px solid #6c5ce7;
        outline: none;
    }

    .form-group input::placeholder {
        color: #999;
        font-size: 13px;
    }

    input[type="date"] {
        color: #666;
    }

    .submit-btn {
        background: linear-gradient(45deg, #6c5ce7, #a367fc);
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 12px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 500;
        width: 100%;
        margin-top: 20px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .submit-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(108, 92, 231, 0.4);
    }

    .login-link {
        margin-top: 25px;
        font-size: 14px;
    }

    .login-link a {
        color: #6c5ce7;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .login-link a:hover {
        color: #a367fc;
    }

    p[style*="red"] {
        color: #ff7675 !important;
        font-size: 13px;
        margin: 8px 0;
    }

    p[style*="green"] {
        color: #00b894 !important;
        font-size: 13px;
        margin: 8px 0;
    }
</style>
<body>
    <div class="container">
        <img src="https://cdn-icons-png.flaticon.com/512/5087/5087579.png" alt="Register Icon" class="register-image">
        <form action="/register" method="post">
            <div class="form-group">
                <label for="username">Name</label>
                <input type="text" id="username" name="username" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <div class="form-group">
                <label for="DOB">Date Of Birth</label>
                <input type="date" id="DOB" name="DOB" required>
            </div>
            
            <button type="submit" class="submit-btn">Create Account</button>
        </form>
        
        <p style="color: red;">${errorregister != null ? errorregister : ''}</p>
        <p style="color: green;">${message != null ? message : ''}</p>
        
        <div class="login-link">
            Already have an account? <a href="/login">Login here</a>
        </div>
    </div>
</body>
</html>
