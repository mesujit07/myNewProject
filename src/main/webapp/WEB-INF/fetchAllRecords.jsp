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
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

    function toggleMenu() {
        var menu = document.getElementById("menu");
        var isVisible = menu.style.display === "block";
        menu.style.display = isVisible ? "none" : "block";
    }

   
    function showUserRecords() {
        var modal = document.getElementById("recordsModal");
        modal.style.display = "block"; 
    }

   
    function closeModal() {
        var modal = document.getElementById("recordsModal");
        modal.style.display = "none"; 
    }

    function openDelete() {
        var modal = document.getElementById("deleteModal");
        modal.style.display = "none"; 
    }
    
    $(document).ready(function() {
        $("#searchForm").submit(function(event) {
            event.preventDefault(); 
            var username = $("#username").val();

            $.ajax({
                url: '/searchByUsername',
                type: 'GET',
                data: { username: username },
                success: function(response) {
                    var tableBody = $("#userTableBody");
                    tableBody.empty();
                    if (response.length === 0) {
                        tableBody.append('<tr><td colspan="5">No users found.</td></tr>');
                    } else {
                        response.forEach(function(user) {
                            tableBody.append('<tr>'
                                + '<td>' + user.id + '</td>'
                                + '<td>' + user.username + '</td>'
                                + '<td>' + user.email + '</td>'
                                + '<td>' + user.password + '</td>'
                                + '<td><a href="/delete/' + user.id + '" onclick="return confirm(\'Are you sure you want to delete this user?\');">'
                                + '<button id="deleteModal" class="delete-button">Delete</button></a></td>'
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
      body {
          margin: 0;
          background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
          font-family: 'Poppins', sans-serif;
      }

      .hamburger {
          font-size: 25px;
          cursor: pointer;
          background: rgba(255, 255, 255, 0.95);
          border: none;
          color: #6c5ce7;
          margin: 15px;
          padding: 12px;
          border-radius: 12px;
          box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
          transition: transform 0.3s ease;
      }

      .hamburger:hover {
          transform: translateY(-2px);
      }

      #menu {
          display: none;
          position: fixed;
          left: 0;
          top: 0;
          width: 200px;
          height: 100%;
          background-color: rgba(255, 255, 255, 0.95);
          backdrop-filter: blur(10px);
          box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
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
          color: #2d3436;
          transition: color 0.3s ease;
          font-size: 14px;
          text-decoration: none;
      }

      #menu ul li a:hover {
          color: #6c5ce7;
          background-color: transparent;
      }

      .content {
          padding: 20px;
          margin-left: 220px;
      }

      #recordsModal {
          display: none;
          position: fixed;
          z-index: 1;
          left: 0;
          top: 0;
          width: 100%;
          height: 100%;
          overflow: auto; 
          background-color: rgba(0, 0, 0, 0.2);
          backdrop-filter: blur(5px);
          border-radius: 50px;
      }

      .modal-content {
          background: rgba(255, 255, 255, 0.95);
          margin: 10% auto;
          padding: 20px;
          width: 80%;
          max-width: 1000px;
          position: relative;
          border-radius: 20px;
          box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
      }

      .modal-header {
          display: flex;
          justify-content: space-between;
          align-items: center;
      }

      .modal-header h2 {
          color: #2d3436;
          font-weight: 600;
      }

      .modal-header .close {
          font-size: 30px;
          cursor: pointer;
          color: #6c5ce7;
          transition: color 0.3s ease;
      }

      .modal-header .close:hover {
          color: #a367fc;
      }

      #searchForm {
          margin: 20px 0;
      }

      #searchForm input {
          padding: 12px 2px;
          border: none;
          border-bottom: 2px solid #e0e0e0;
          border-radius: 0;
          font-size: 14px;
          transition: all 0.3s ease;
          background: transparent;
          margin-right: 10px;
      }

      #searchForm input:focus {
          border-bottom: 2px solid #6c5ce7;
          outline: none;
      }

      #searchForm button {
          background: linear-gradient(45deg, #6c5ce7, #a367fc);
          color: white;
          padding: 10px 20px;
          border: none;
          border-radius: 12px;
          cursor: pointer;
          font-size: 14px;
          transition: transform 0.3s ease;
      }

      #searchForm button:hover {
          transform: translateY(-2px);
      }

      .records-table {
          width: 100%;
          border-collapse: collapse;
          border-radius: 12px;
          overflow: hidden;
          margin: 20px 0;
      }

      .records-table th, .records-table td {
          padding: 12px;
          text-align: left;
          border: 1px solid #ddd;
      }

      .records-table th {
          background: linear-gradient(45deg, #6c5ce7, #a367fc);
          color: white;
          font-weight: 500;
          padding: 15px;
      }

      .records-table td {
          color: #2d3436;
      }

      .records-table tr:nth-child(even) {
          background-color: rgba(108, 92, 231, 0.05);
      }

      .delete-button {
          background: #ff7675;
          color: white;
          border: none;
          padding: 8px 16px;
          border-radius: 8px;
          cursor: pointer;
          transition: all 0.3s ease;
      }

      .delete-button:hover {
          background: #d63031;
          transform: translateY(-2px);
      }

      .edit-button {
          background: #00b894;
          color: white;
          border: none;
          padding: 8px 16px;
          border-radius: 8px;
          cursor: pointer;
          transition: all 0.3s ease;
      }

      .edit-button:hover {
          background: #00a28d;
          transform: translateY(-2px);
      }

      .modal-footer {
          text-align: center;
          margin-top: 20px;
      }

      .modal-footer button {
          background: linear-gradient(45deg, #6c5ce7, #a367fc);
          color: white;
          padding: 10px 25px;
          border: none;
          border-radius: 12px;
          cursor: pointer;
          font-size: 14px;
          transition: transform 0.3s ease;
      }

      .modal-footer button:hover {
          transform: translateY(-2px);
      }

      .welcome-message h1 {
          color: #2d3436;
          font-size: 24px;
          font-weight: 600;
      }
  </style>
  </head>
<body>

<button class="hamburger" onclick="toggleMenu()"><i class="fa-solid fa-burger"></i></button>

<div id="menu">
    <ul>
        <li><a href="javascript:void(0)" onclick="showUserRecords()"> <i class="fa-solid fa-database"></i>  <span style="margin-left: 10px;">Fetch All Records</a></li>
       <li> <a href="/export/users/excel"><i class="fa-solid fa-download"></i><span style="margin-left: 10px;">Export TO Excel</a></li>
       <li> <a href="/export/users/pdf"><i class="fa-solid fa-file-pdf"></i><span style="margin-left: 10px;">Export TO PDF</a></li>
       <li>
			  <a href="/export/import/excel">
			    <i class="fa-solid fa-file-excel"></i>
			    <span style="margin-left: 10px;">Upload Excel</span>
			  </a>
			  <!-- Form to upload Excel file -->
			  <form action="/export/upload-excel" method="POST" enctype="multipart/form-data" style="display: inline-block;">
			    <input type="file" name="file" id="excelFile" required />
			    <button type="submit">Upload Excel</button>
			  </form>
			</li>

    </ul>
</div>

<div class="content">

    <%
     HttpSession session2  = request.getSession(false); 
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("/login");
        return;
    }

    String message = (String) session.getAttribute("message");
    String username = (String) session.getAttribute("username");
%>

	  <div class="welcome-message">
	        <h1><%=message%></h1>
	    </div>

<% String successupload= (String) request.getAttribute("successupload"); %>
<% if (successupload != null) { %>
    <p style="color: green;"><%= successupload %></p>
<% } %>


<% String errorupload = (String) request.getAttribute("errorupload"); %>
<% if (errorupload != null) { %>
    <p style="color: red;"><%= errorupload %></p>
<% } %>

	    	
	    
    <div id="recordsModal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>User Records</h2>
                <span class="close" onclick="closeModal()">&times;</span>
            </div>

            
            <form id="searchForm" method="get">
                <label for="username">Search by Username:</label>
                <input type="text" id="username" name="username" placeholder="Enter username" />
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
                        <td><a href="/delete/<%=user.getId()%>" onclick="return confirm('Are you sure you want to delete this user?');">
                            <button class="delete-button">Delete</button></a></td>
                        <td><a href="/reset"><button class="edit-button">Edit</button></a></td>
                    </tr>
                    <%
                    }
                    } else {
                    %>
                    <tr>
                        <td colspan="6">No users found.</td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
        <div class="modal-footer">
            <button onclick="closeModal()">Close</button>
        </div>
    </div>

</div>



</body>
</html>
 