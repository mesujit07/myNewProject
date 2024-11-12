<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.new_Project.Entity.Location" %>
<!DOCTYPE html>
<html>
<head>
    <title>Locations</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
      
        h1 {
            color: #2c3e50;
            text-align: center;
        }
      
        .search-form {
            margin: 20px 0;
            text-align: center;
        }
      
        input[type="text"] {
            padding: 8px;
            width: 200px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
      
        input[type="submit"] {
            padding: 8px 15px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
      
        input[type="submit"]:hover {
            background-color: #2980b9;
        }
      
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
        }
      
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
      
        th {
            background-color: #3498db;
            color: white;
        }
      
        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>

    <h1>Locations</h1>

    <!-- Search Form for Zone -->
    <div class="search-form">
        <form action="/searchByZone" method="get">
            <label for="zone">Search by Zone:</label>
            <input type="text" id="zone" name="zone" required />
            <input type="submit" value="Search" />
        </fortm>
    </div>

    <!-- Display locations in a table -->
    <div id="locationTableContainer">
        <table>
            <thead>
                <tr>
                    <th>Zone</th>
                    <th>Circle</th>
                    <th>Division</th>
                    <th>Subdivision</th>
                    <th>Section</th>
                    <th>DB User</th>
                    <th>Email</th>
                    <th>Phone Nos</th>
                    <th>New Site</th>
                    <th>Helpdesk</th>
                    <th>Division Code</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Fetch locations from the request attribute
                    List<Location> locations = (List<Location>) request.getAttribute("locations");
                    if (locations != null && !locations.isEmpty()) {
                        for (Location location : locations) {
                %>
                    <tr>
                        <td><%= location.getZone() %></td>
                        <td><%= location.getCircle() %></td>
                        <td><%= location.getDivison() %></td>
                        <td><%= location.getSubdivision() %></td>
                        <td><%= location.getSection() %></td>
                        <td><%= location.getDbuser() %></td>
                        <td><%= location.getEmailids() %></td>
                        <td><%= location.getPhonenos() %></td>
                        <td><%= location.getNewssitecode() %></td>
                        <td><%= location.getHelpdesk_no() %></td>
                        <td><%= location.getDivisionname() %></td>
                    </tr>
                <% 
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="11">No locations found.</td>
                    </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    </div>

</body>
</html>