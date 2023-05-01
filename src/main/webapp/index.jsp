<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.francisco.users.User" %>
<% User user = (User)session.getAttribute("user"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Commendation Catalog</title>
</head>
<body>
<h1>Welcome to the Commendation Catalog!</h1>
<h2>Table of Contents</h2>
<h3>Available Options:</h3>
<ul>
    <li><a href="commendations">View Commendations</a></li>
    <li><a href="signup">Sign Up</a></li>
    <% if(user != null && user.getRoles().equals("admin")){ %>
    <li><a href="view-users">View All Users</a></li>
    <% } %>

    <% if(user == null) { %>
    <li><a href="signup">Register User</a></li>
    <li><a href="login">Login</a></li>
    <% } else { %>
    <li><a href="logout">Logout</a></li>
    <% } %>
</ul>
</body>
</html>
