<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
</head>
<style>
    body {
        font-family: 'Roboto', sans-serif;
        background: linear-gradient(120deg, #e0e0e0, #f5f5f5);
        margin: 0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .container {
        background: white;
        padding: 2rem;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0,0,0,0.1);
        width: 100%;
        max-width: 400px;
        text-align: center;
    }
    .reset-icon {
        width: 120px;
        margin-bottom: 20px;
    }
    h1 {
        color: #2196F3;
        margin-bottom: 30px;
    }
    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 12px;
        margin: 8px 0;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box;
    }
    input[type="submit"] {
        background: #2196F3;
        color: white;
        padding: 12px 24px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        width: 100%;
        font-size: 16px;
        margin-top: 20px;
        transition: background 0.3s ease;
    }
    input[type="submit"]:hover {
        background: #1976D2;
    }
    a {
        color: #2196F3;
        text-decoration: none;
        margin-top: 15px;
        display: inline-block;
    }
    a:hover {
        text-decoration: underline;
    }
    .error {
        color: #f44336;
        margin-top: 10px;
    }
    .success {
        color: #4CAF50;
        margin-top: 10px;
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


        <!-- Display dynamic messages -->
        <p style="color: red;">
            ${error != null ? error : ''}
        </p>
        <h1 style="color: green;">
            ${message != null ? message : ''}
        </h1>
        <span>Remember your password? </span>
        <a href="<%= request.getContextPath() %>/login">Login here</a>

    </div>
</body>
</html>
