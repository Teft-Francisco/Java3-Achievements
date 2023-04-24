package com.francisco.data;

import com.francisco.commendations.Commendation;
import com.francisco.users.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
                    String[] requirements = resultSet.getString("requirements").split(",");
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
}
