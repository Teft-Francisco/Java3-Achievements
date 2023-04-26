<%@ page import="com.francisco.commendations.Commendation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Commendation commendation = (Commendation)request.getAttribute("commendationToSend");%>
<html>
<head>
    <title>Edit Commendation</title>
    <link href="styles/edit.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<form>
    <input name = "original_title" type="hidden">
<input name="title" class="titlefield" contenteditable="false" value="<%= commendation.getTitle() %>">
<input name="description" class="requirementsfield" value="<%= commendation.getDescription() %>">
<input name="requirements" class="requirementsfield" value="<%= commendation.getRequirements()[0] %>.<%= commendation.getRequirements()[1] %>.<%= commendation.getRequirements()[2] %>.<%= commendation.getRequirements()[3] %>.<%= commendation.getRequirements()[4] %>">
    <select name="faction" class="titlefield" content="<%= commendation.getFaction() %>">
        <option value="The Gold Hoarders">The Gold Hoarders</option>
        <option value="The Order of Souls">The Order of Souls</option>
        <option value="The Merchant Alliance">The Merchant Alliance</option>
        <option value="The Reaper's Bones">The Reaper's Bones</option>
    </select>
    <button type="submit">Edit Commendation</button>
</form>
</body>
</html>
