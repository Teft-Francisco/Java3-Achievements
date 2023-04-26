<%@ page import="org.apache.commons.text.WordUtils" %>
<%@ page import="com.francisco.commendations.Commendation" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.francisco.users.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Commendation> commendations = (List<Commendation>)request.getAttribute("commendations");
    String show = "?show=" + (String)request.getAttribute("show");
    String sort = "&sort=" + (String)request.getAttribute("sort");
    String search = (String)request.getAttribute("search");
    User user = (User)session.getAttribute("user");
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Commendations</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<header class="bg-primary">
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand text-light" href="#">Commendation List</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">

                <form class="d-flex" action="commendations" method="get">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search" value="<%= search %>">
                    <button class="btn btn-light" type="submit">Search</button>
                </form>
                <div class="dropdown ms-3">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="filterDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        Show
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="filterDropdown">
                        <li><a class="dropdown-item" href="commendations?show=all<%= sort %>">All</a></li>
                        <li><a class="dropdown-item" href="commendations?show=The+Gold+Hoarders<%= sort %>">The Gold Hoarders</a></li>
                        <li><a class="dropdown-item" href="commendations?show=The+Order+of+Souls<%= sort %>">The Order of Souls</a></li>
                        <li><a class="dropdown-item" href="commendations?show=The+Merchant+Alliance<%= sort %>">The Merchant Alliance</a></li>
                        <li><a class="dropdown-item" href="commendations?show=The+Reaper's+Bones<%= sort %>">The Reaper's Bones</a></li>
                    </ul>
                </div>
                <div class="dropdown ms-3">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="sortDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        Sort
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="sortDropdown">
                        <li><a class="dropdown-item" href="commendations<%= show %>&sort=alphaAZ">Alphabetical (A to Z)</a></li>
                        <li><a class="dropdown-item" href="commendations<%= show %>&sort=alphaZA">Alphabetical (Z to A)</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

</header>
    <main class="container">
        <section class="py-5 text-center container">
            <div class="row py-lg-2">
                <div class="col-lg-6 col-md-8 mx-auto">
                    <h1 class="fw-light">Search for specific Sea of Thieves commendations!</h1>
                </div>
            </div>
        </section>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Commendation</th>
                <th scope="col">Description</th>
                <th scope="col">Requirements</th>
                <th scope="col">Faction</th>
                <% if(user != null && user.getRoles().equals("admin")){ %>
                <th scope="col">Options</th>
                <% } %>
                <% if(user != null && user.getRoles().equals("user")){ %>
                <th scope="col">Options</th>
                <% } %>
            </tr>
            </thead>
            <tbody class="table-group-divider">
            <% for(Commendation commendation: commendations) { %>
            <tr>
                <td>
                    <p><%= commendation.getTitle() %></p>
                </td>
                <td>
                    <p><%= commendation.getDescription() %></p>
                </td>
                <td>
                    <p><%= commendation.getRequirements()[0] %></p>
                    <p><%= commendation.getRequirements()[1] %></p>
                    <p><%= commendation.getRequirements()[2] %></p>
                    <p><%= commendation.getRequirements()[3] %></p>
                    <p><%= commendation.getRequirements()[4] %></p>
                </td>
                <td>
                    <p><%= commendation.getFaction() %></p>
                </td>
                <% if(user != null && user.getRoles().equals("user")){ %>
                <td>
                    <form action="commendations" method="post">
                        <input type="hidden" name="btn" value="edit">
                        <input type="hidden" name="commendationToEdit" value="<%= commendation %>">
                        <button type="submit">Edit Commendation</button>
                    </form>
                </td>
                <% } %>
                <% if(user != null && user.getRoles().equals("admin")){ %>
                <td>
                    <form action="commendations" method="post">
                        <input type="hidden" name="btn" value="edit">
                        <input type="hidden" name="title" value="<%= commendation.getTitle() %>">
                        <button type="submit">Edit Commendation</button>
                    </form>
                    <form action="commendations" method="post">
                        <input type="hidden" name="btn" value="delete">
                        <input type="hidden" name="title" value="<%= commendation.getTitle() %>">
                        <button type="submit">Delete Commendation</button>
                    </form>
                </td>
                <% } %>
            </tr>
            <% } %>
            </tbody>
        </table>

    </main>
<script src="https://code.jquery.com/jquery-3.6.4.slim.min.js"
        integrity="sha256-a2yjHM4jnF9f54xUQakjZGaqYs/V1CYvWpoqZzC2/Bw="
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>
