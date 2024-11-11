<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Form</title>
</head>
<style>
body {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	margin: 0;
	background-color: #f4f4f9;
	font-family: Arial, sans-serif;
}

.nav-bar {
	position: fixed;
	top: 0;
	width: 100%;
	height: 60px;
	background: white;
	box-shadow: 0 2px 5px rgba(0,0,0,0.1);
	z-index: 1000;
}

.page-title {
	position: absolute;
	top: 80px;
	text-align: center;
	color: #2c3e50;
	font-size: 2em;
}

.container {
	background: white;
	padding: 25px;
	border-radius: 12px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1), 
				0 8px 25px rgba(0, 0, 0, 0.05);
	width: 280px;
	text-align: center;
	margin: 20px 0;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.login-icon {
	width: 100px;
	height: 100px;
	margin-bottom: 15px;
	border-radius: 8px;
}

.login-title {
	color: #3498db;
	margin: 10px 0 15px 0;
	font-size: 22px;
}

input[type="text"], input[type="password"] {
	width: 90%;
	padding: 10px;
	margin: 6px 0;
	border: 1px solid #ddd;
	border-radius: 6px;
	box-sizing: border-box;
	font-size: 14px;
}

input[type="submit"] {
	background-color: #3498db;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	font-size: 16px;
	transition: background-color 0.3s;
	width: 90%;
	margin-top: 10px;
}

.links-section {
	margin-top: 15px;
	padding-top: 15px;
	border-top: 1px solid #eee;
	font-size: 14px;
}

.links-section p {
	margin: 8px 0;
}

.footer {
	position: fixed;
	bottom: 0;
	width: 100%;
	height: 60px;
	background: white;
	box-shadow: 0 -2px 5px rgba(0,0,0,0.1);
}
</style>
<body>
	<body>
    <div class="nav-bar"></div>
    <h1 class="page-title">My Project</h1>
    <div class="container">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEpZNXVW8uMc1FhYGYOQDIkUJPvvB9-egGgA&s" alt="Login Icon" class="login-icon">
        <h1 class="login-title">Login to your account</h1>

        <form action="<%= request.getContextPath() %>/login" method="post">
            <input type="text" id="username" name="username" placeholder="Username" required>
            <input type="password" id="password" name="password" placeholder="Password" required>
            <input type="submit" value="Login">
        </form>
        
        <c:if test="${not empty error}">
        <p style="color:red;">${error}</p>
    </c:if>
        <p style="color: green;">
            ${message != null ? message : ''}
        </p>
	        <p style="color: green;">
            ${info != null ?info : ''}
        </p>
        <div class="links-section">
            <p><a href="<%= request.getContextPath() %>/reset">Forgot Password?</a></p>
            <p>
                <span>Don't have an account? </span>
                <a href="<%= request.getContextPath() %>/register">Register here</a>
            </p>
           
        </div>
    </div>
    <div class="footer"></div>
</body>
</body>
</html>
