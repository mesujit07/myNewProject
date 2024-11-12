<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.example.new_Project.Entity.User"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Fetch All Records</title>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function toggleMenu() {
		var menu = document.getElementById("menu");
		var isVisible = menu.style.display === "block";
		menu.style.display = isVisible ? "none" : "block";
	}

	function showUserRecords() {
		var recordsSection = document.getElementById("recordsSection");
		recordsSection.style.display = "block";

		$.ajax({
			url : '/fetchAllRecords',
			type : 'GET',
			success : function(response) {
				window.location.href = '/fetchAllRecords';
			}
		});
	}

	function showUserRecords() {
		var recordsSection = document.getElementById("recordsSection");
		recordsSection.style.display = "block";
		return false;
	}

	$(document)
			.ready(
					function() {
						$("#searchForm")
								.submit(
										function(event) {
											event.preventDefault();
											var username = $("#username").val();
											$
													.ajax({
														url : '/searchByUsername',

														type : 'GET',

														data : {
															username : username
														},

														success : function(
																response) {
															var tableBody = $("#userTableBody");
															tableBody.empty();

															if (response.length === 0) {
																tableBody
																		.append('<tr><td colspan="5">No users found.</td></tr>');
															} else {
																response
																		.forEach(function(
																				user) {
																			tableBody
																					.append('<tr>'
																							+ '<td>'
																							+ user.id
																							+ '</td>'
																							+ '<td>'
																							+ user.username
																							+ '</td>'
																							+ '<td>'
																							+ user.email
																							+ '</td>'
																							+ '<td>'
																							+ user.password
																							+ '</td>'
																							+ '<td><a href="/delete/'
																							+ user.id
																							+ '" onclick="return confirm(\'Are you sure you want to delete this user?\');">'
																							+ '<button class="delete-button">Delete</button>'
																							+ '</a></td>'
																							+ '<td><a href="/reset"><button class="edit-button">Edit</button></a></td>'
																							+ '</tr>');
																		});
															}
														}
													});
										});
					});
</script>
<style>
.hamburger {
	font-size: 30px;
	cursor: pointer;
	background: none;
	border: none;
	color: #333;
	margin-top: 10px;
	padding: 10px;
}

#menu {
	display: none;
	position: fixed;
	left: 0;
	top: 0;
	width: 200px;
	height: 100%;
	background-color: #333;
	padding-top: 20px;
	z-index: 1000;
}

#menu ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
	color: white;
}

#menu ul li {
	padding: 8px 16px;
}

#menu ul li a {
	color: white;
	text-decoration: none;
}

#menu ul li a:hover {
	background-color: #575757;
}

.content {
	padding: 20px;
	margin-left: 220px;
}

 #recordsSection {
	margin-top: 20px;
} 

#recordsSection {
	display: none;
	margin-top: 20px;
}

.records-table {
	width: 100%;
	border-collapse: collapse;
}

.records-table th, .records-table td {
	padding: 12px;
	text-align: left;
	border: 1px solid #ddd;
}

.records-table th {
	background-color: #2196F3;
	color: white;
}

.records-table tr:nth-child(even) {
	background-color: #f9f9f9;
}

.delete-button {
	background-color: #f44336;
	color: white;
	border: none;
	padding: 6px 12px;
	cursor: pointer;
}

.edit-button {
	background-color: green;
	color: white;
	border: none;
	padding: 6px 12px;
	cursor: pointer;
}

.delete-button:hover {
	background-color: #d32f2f;
}

.welcome-message {
	color: green;
}
</style>

</head>
<body>


	<button class="hamburger" onclick="toggleMenu()">&#9776;</button>

	<div id="menu">
		<ul>
			<li><a href="/fetchAllRecords"
				onclick="return showUserRecords()">Fetch All Records</a></li>
		</ul>
	</div>


	<div class="content">
		<%-- 		<%
		String message = (String) request.getAttribute("message");
		if (message != null && !message.isEmpty()) {
		%> --%>

		<%
		String message = (String) request.getAttribute("message");

		// If the message is null or empty, redirect to login
		if (message == null || message.isEmpty()) {
			response.sendRedirect("/login");
			return; // Stop further execution of the JSP page
		} else {
		%>

		<div class="welcome-message">
			<h1><%=message%></h1>
		</div>
		<%
		}
		%>
<div id="recordsSection">
			<form id="searchForm" method="get">
				<label for="username">Search by Username:</label> <input type="text"
					id="username" name="username" placeholder="Enter username" />
				<button type="submit">Search</button>
			</form>
			
			

			<table class="records-table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Username</th>
						<th>Email</th>
						<th>Password</th>
						<th>Action</th>
						<th>Edit</th>
					</tr>
				</thead>
				<tbody id="userTableBody">

					<%
					List<User> users = (List<User>) request.getAttribute("userList");
					if (users != null && !users.isEmpty()) {
						for (User user : users) {
					%>
					<tr>
						<td><%=user.getId()%></td>
						<td><%=user.getUsername()%></td>
						<td><%=user.getEmail()%></td>
						<td><%=user.getPassword()%></td>
						<td><a href="/delete/<%=user.getId()%>"
							onclick="return confirm('Are you sure you want to delete this user?');">
								<button class="delete-button">Delete</button>
						</a></td>
						<td><a href="/reset">

								<button class="edit-button">Edit</button>
						</a></td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="5">No users found.</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<a href="/login"><button>Back to login</button></a>
		</div>
	</div>

</body>
</html>
