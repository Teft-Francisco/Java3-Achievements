package com.francisco.data;

import com.francisco.commendations.Commendation;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommendationDAO_MySQL implements DAO_MySQL<Commendation>{
    public List<Commendation> getAll() {
        List<Commendation> commendations = new ArrayList<>();
        try(Connection connection = getConnection()) {
            if(connection.isValid(2)) {
                // Step 1: make a statement (Statement or PreparedStatement)
                Statement statement = connection.createStatement();
                // Step 2: Execute a query (plain SQL or stored procedure) and return the results
                ResultSet resultSet = statement.executeQuery("SELECT * FROM commendations");
                // Step 3: Get data from the results
                while(resultSet.next()) {
                    String title = resultSet.getString("title");
                    String description = resultSet.getString("description");
                    String[] requirements = resultSet.getString("requirements").split("\\.");
                    String faction = resultSet.getString("faction");
                    Commendation commendation = new Commendation(title, description, requirements, faction);
                    commendations.add(commendation);
                }
                resultSet.close();
                statement.close();
            }
        } catch(SQLException e) {
            System.out.println("Failed to retrieve commendation data.");
            System.out.println(e.getMessage());
        }
        return commendations;
    }

    public Commendation get(String title) {
        Commendation commendation = new Commendation();
        try(Connection connection = getConnection()) {
            if(connection.isValid(2)) {
                String sql = "SELECT * FROM commendations WHERE title = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, title);
                ResultSet resultSet = statement.executeQuery();
                while(resultSet.next()) {
                    commendation.setTitle(resultSet.getString("title"));
                    commendation.setDescription(resultSet.getString("description"));
                    commendation.setRequirements(resultSet.getString("requirements").split("\\."));
                    commendation.setFaction(resultSet.getString("faction"));
                }
                statement.close();
            }
        } catch(SQLException e) {
            System.out.println("Select commendation failed");
            System.out.println(e.getMessage());
        }
        return commendation;
    }
    public int add(Commendation commendation) {
        int numRowsAffected = 0;
        try(Connection connection = getConnection()) {
            if(connection.isValid(2)) {
                String sql = "INSERT INTO commendations (title, description, requirements, faction)" +
                        "VALUES (?,?,?,?)";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, commendation.getTitle());
                statement.setString(2, commendation.getDescription());
                String[] requirementsArray = commendation.getRequirements();
                String requirementsString = String.join(".", requirementsArray);
                statement.setString(3, requirementsString);
                statement.setString(4, commendation.getFaction());
                numRowsAffected = statement.executeUpdate();
                statement.close();
            }
        } catch(SQLException e) {
            System.out.println("Add commendation failed");
            System.out.println(e.getMessage());
        }
        return numRowsAffected;
    }

    public int edit(String title, String description, String requirements, String faction) {
        int numRowsAffected = 0;
        try(Connection connection = getConnection()) {
            if(connection.isValid(2)) {
                String sql = "UPDATE commendations SET title = ?, description = ?, requirements = ?, faction = ? WHERE title = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, title);
                statement.setString(2, description);
                statement.setString(3, requirements);
                statement.setString(4, faction);
                statement.setString(5, title);
                numRowsAffected = statement.executeUpdate();
                statement.close();
            }
        } catch(SQLException e) {
            System.out.println("Update commendation failed");
            System.out.println(e.getMessage());
        }
        return numRowsAffected;
    }

    public int delete(String title) {
        int numRowsAffected = 0;
        try(Connection connection = getConnection()) {
            if(connection.isValid(2)) {
                String sql = "DELETE FROM commendations WHERE title = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, title);
                numRowsAffected = statement.executeUpdate();
                statement.close();
            }
        } catch(SQLException e) {
            System.out.println("Delete commendation failed");
            System.out.println(e.getMessage());
        }
        return numRowsAffected;
    }
}
