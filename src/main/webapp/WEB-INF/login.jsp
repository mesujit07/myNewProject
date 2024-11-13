<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Login | MyProject</title>
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

.login-icon {
	width: 80px;
	height: 80px;
	margin-bottom: 20px;
	border-radius: 50%;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease;
}

.login-icon:hover {
	transform: scale(1.05);
}

.login-title {
	color: #2d3436;
	margin: 10px 0 25px 0;
	font-size: 24px;
	font-weight: 600;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 12px 2px;
	margin: 25px 0;
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

.links-section {
	margin-top: 25px;
	padding-top: 20px;
	border-top: 1px solid #eee;
	font-size: 14px;
}

.links-section a {
	color: #6c5ce7;
	text-decoration: none;
	transition: color 0.3s ease;
}

.links-section a:hover {
	color: #a367fc;
}

.error-message {
	color: #ff7675;
	font-size: 13px;
	margin: 8px 0;
}

.success-message {
	color: #00b894;
	font-size: 13px;
	margin: 8px 0;
}
</style>
<body>
	<div class="container">
		<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEpZNXVW8uMc1FhYGYOQDIkUJPvvB9-egGgA&s" 
			 alt="Login Icon" class="login-icon">
		<h1 class="login-title">Welcome Back</h1>

		<form action="<%=request.getContextPath()%>/login" method="post">
			<input type="text" id="username" name="username" 
				   placeholder="Enter your username" required>
			<input type="password" id="password" name="password" 
				   placeholder="Enter your password" required>
			<input type="submit" value="Sign In">
		</form>

	<p style="color: red;">${errorlogin != null ? errorlogin : ''}</p>

		<c:if test="${not empty info}">
			<div class="success-message">${info}</div>
		</c:if>

		<c:if test="${not empty resetinfo}">
			<div class="success-message">${resetinfo}</div>
		</c:if>

		<div class="links-section">
			<p>
				<a href="<%=request.getContextPath()%>/reset">Forgot Password?</a>
			</p>
			<p>
				<span>New here? </span>
				<a href="<%=request.getContextPath()%>/register">Create Account</a>
			</p>
		</div>
	</div>
</body>
</html>
