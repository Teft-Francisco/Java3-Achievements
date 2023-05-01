<%@ page import="com.francisco.commendations.Commendation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Commendation commendation = (Commendation)request.getAttribute("commendationToSend");%>
<% String requirementString = ""; %>
<% for (int i = 0; i < commendation.getRequirements().length; i++) { requirementString += commendation.getRequirements()[i] + "."; } %>
<% if(requirementString.substring(requirementString.length() - 1).equals(".")) {
    StringBuffer convertedString = new StringBuffer(requirementString);
    convertedString.deleteCharAt(convertedString.length() - 1);
    requirementString = convertedString.toString();
} %>
<!DOCTYPE html>
<html lang="en">
<html>
<head>
    <title>Edit Commendation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<main class="container">
<div>
<form method="post" action="edit-commendation">
    <input name = "original_title" type="hidden">
    <div class="form-row">
        <label for="title" class="col-sm-2 col-form-label">Commendation Title:</label>
        <input class="form-control" name="title" id="title" contenteditable="false" value="<%= commendation.getTitle() %>" disabled>
    </div>
    <div class="form-row">
        <label for="description" class="col-sm-2 col-form-label">Commendation Description</label>
        <input class="form-control" name="description" id="description" value="<%= commendation.getDescription() %>">
    </div>
    <div class="form-row">
        <label for="requirements" class="col-sm-2 col-form-label">Commendation Requirements</label>
        <input class="form-control" name="requirements" id="requirements" value="<%= requirementString %>">
    </div>
    <div class="form-row">
        <label for="faction" class="col-sm-2 col-form-label">Faction:</label>
        <select name="faction" id="faction" content="<%= commendation.getFaction() %>">
            <option value="The Gold Hoarders">The Gold Hoarders</option>
            <option value="The Order of Souls">The Order of Souls</option>
            <option value="The Merchant Alliance">The Merchant Alliance</option>
            <option value="The Reaper's Bones">The Reaper's Bones</option>
        </select>
    </div>
    <br>
    <div class="form-row">
        <button type="submit">Save Commendation</button>
    </div>
</form>
</div>
</main>
</body>
</html>