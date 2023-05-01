# Commendation Catalog

## What is it?
This is a small web application allowing for the storage and easy sorting of achievements (Known as commendations) for the game Sea of Thieves.

## How does it work?
This web application is built on a SQL database that contains all the data for the commendations. When a user views the list of commendations the Servlet retrieves the data and passes it to the page.

If the user is logged in they can edit existing commendation data. If the user has the admin role they can delete commendations from the list.

Any user regardless of role can sort the list by title and by the respective in-game faction associated with the commendation.