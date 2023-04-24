<%@ page import="org.apache.commons.text.WordUtils" %>
<%@ page import="com.francisco.commendations.Commendation" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%
    List<Commendation> commendations = (List<Commendation>)request.getAttribute("commendations");
    String show = "?show=" + (String)request.getAttribute("show");
    String sort = "&sort=" + (String)request.getAttribute("sort");
    String search = (String)request.getAttribute("search");
%>
<html>
<head>
    <title>Commendations</title>
</head>
<body>
    <h1>Commendation List:</h1>

    <main class="container">
        <section class="py-5 text-center container">
            <div class="row py-lg-2">
                <div class="col-lg-6 col-md-8 mx-auto">
                    <h1 class="fw-light">Search for specific commendations!</h1>
                </div>
            </div>
        </section>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Commendation</th>
                <th scope="col">Description</th>
                <th scope="col">Requirements</th>
                <th scope="col"><Faction></Faction></th>
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
            </tr>
            <% } %>
            </tbody>
        </table>

    </main>
</body>
</html>
