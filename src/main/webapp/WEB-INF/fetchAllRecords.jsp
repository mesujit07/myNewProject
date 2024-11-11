<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.example.new_Project.Entity.User"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Fetch All Records</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!-- Include jQuery -->
    <script>
        // Function to toggle the menu visibility
        function toggleMenu() {
            var menu = document.getElementById("menu");
            var isVisible = menu.style.display === "block";
            menu.style.display = isVisible ? "none" : "block";
        }

        // Function to show/hide the user records section
        function showUserRecords() {
            var recordsSection = document.getElementById("recordsSection");
            var isVisible = recordsSection.style.display === "block";
            recordsSection.style.display = isVisible ? "none" : "block";
        }

        // Function to handle the search AJAX
        $(document).ready(function() {
            // Event listener for the search form submission
            $("#searchForm").submit(function(event) {
                event.preventDefault(); // Prevent the form from submitting normally

                var username = $("#username").val(); // Get the value of the search field

                $.ajax({
                    url: '/searchByUsername', // The URL of the search endpoint
                    type: 'GET',
                    data: { username: username }, // Send the username as a query parameter
                    success: function(response) {
                        // On success, update the table with the new list of users
                        var tableBody = $("#userTableBody");
                        tableBody.empty(); // Clear the existing table rows

                        if (response.length === 0) {
                            tableBody.append('<tr><td colspan="5">No users found.</td></tr>');
                        } else {
                            response.forEach(function(user) {
                                tableBody.append('<tr>' +
                                    '<td>' + user.id + '</td>' +
                                    '<td>' + user.username + '</td>' +
                                    '<td>' + user.email + '</td>' +
                                    '<td>' + user.password + '</td>' +
                                    '<td><button class="delete-button">Delete</button></td>' +
                                    '</tr>');
                            });
                        }
                    }
                });
            });
        });
    </script>
    <style>
        /* Basic CSS for layout and styling */
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

        .delete-button:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>

    <!-- Hamburger Button -->
    <button class="hamburger" onclick="toggleMenu()">☰</button>

    <!-- Left-side Menu -->
    <div id="menu">
        <ul>
            <li><a href="javascript:void(0);" onclick="showUserRecords()">Fetch All Records</a></li>
        </ul>
    </div>

    <!-- Content Section (Main Page) -->
    <div class="content">
        <h1>Welcome to the Fetch All Records Page</h1>
        <p>Click the hamburger menu to show/hide the navigation menu.</p>

        <div id="recordsSection">
            <h2>User Records</h2>

            <!-- Search Form Inside the Table -->
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
                    </tr>
                </thead>
                <tbody id="userTableBody">
                    <!-- This body will be dynamically populated by the AJAX call -->
                    <% 
                        // Fetch users from the backend (this could be all users or an empty list if none found)
                        List<User> users = (List<User>) request.getAttribute("userList"); 
                        if (users != null && !users.isEmpty()) {
                            for (User user : users) {
                    %>
                        <tr>
                            <td><%= user.getId() %></td>
                            <td><%= user.getUsername() %></td>
                            <td><%= user.getEmail() %></td>
                            <td><%= user.getPassword() %></td>
                            <td><button class="delete-button">Delete</button></td>
                        </tr>
                    <% 
                            }
                        } else {
                    %>
                        <tr><td colspan="5">No users found.</td></tr>
                    <% 
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
