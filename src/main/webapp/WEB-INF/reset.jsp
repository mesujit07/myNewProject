<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
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

    .reset-icon {
        width: 80px;
        height: 80px;
        margin-bottom: 20px;
        border-radius: 50%;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease;
    }

    .reset-icon:hover {
        transform: scale(1.05);
    }

    h1 {
        color: #2d3436;
        margin: 10px 0 25px 0;
        font-size: 24px;
        font-weight: 600;
    }

    label {
        display: block;
        text-align: left;
        color: #666;
        font-size: 14px;
        margin-bottom: 5px;
    }

    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 12px 2px;
        margin: 8px 0 25px 0;
        border: none;
        border-bottom: 2px solid #e0e0e0;
        border-radius: 0;
        box-sizing: border-box;
        font-size: 14px;
        transition: all 0.3s ease;
        background: transparent;
    }

    input[type="text"]:focus, input[type="password"]:focus {
        border-bottom: 2px solid #6c5ce7;
        outline: none;
        box-shadow: none;
    }

    input[type="text"]::placeholder, input[type="password"]::placeholder {
        color: #999;
        font-size: 13px;
        transition: opacity 0.3s ease;
    }

    input[type="text"]:focus::placeholder, input[type="password"]:focus::placeholder {
        opacity: 0.5;
    }

    input[type="submit"] {
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

    input[type="submit"]:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(108, 92, 231, 0.4);
    }

    .error {
        color: #ff7675;
        font-size: 13px;
        margin: 8px 0;
    }

    .success {
        color: #00b894;
        font-size: 13px;
        margin: 8px 0;
    }

    a {
        color: #6c5ce7;
        text-decoration: none;
        font-size: 14px;
        transition: color 0.3s ease;
        margin-top: 20px;
        display: inline-block;
    }

    a:hover {
        color: #a367fc;
    }

    span {
        font-size: 14px;
        color: #666;
    }
</style>
<body>
    <div class="container">
        <img src="https://cdn-icons-png.flaticon.com/512/6195/6195699.png" alt="Reset Password Icon" class="reset-icon">
        <h1>Reset Password</h1>

        <form action="<%= request.getContextPath() %>/reset" method="post">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required placeholder="Enter your username">

            <label for="password">New Password</label>
            <input type="password" id="password" name="password" required placeholder="Enter new password">

            <input type="submit" value="Reset Password">
        </form>

        <p class="error">${error != null ? reseterror : ''}</p>
        <p class="success">${message != null ? resetinfo : ''}</p>

        <span>Remember your password? </span>
        <a href="<%= request.getContextPath() %>/login">Login here</a>
    </div>
</body>
</html>