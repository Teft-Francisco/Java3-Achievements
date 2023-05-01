package com.francisco.commendations;

import com.francisco.data.CommendationDAO_MySQL;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CommendationsServlet", value = "/commendations")
public class CommendationsServlet extends HttpServlet {
    private List<Commendation> commendations;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CommendationDAO_MySQL commendation_data = new CommendationDAO_MySQL();

        commendations = commendation_data.getAll();

        // https://stackoverflow.com/questions/715650/how-to-clone-arraylist-and-also-clone-its-contents
        List<Commendation> commendationsCopy = new ArrayList<>(commendations.size());
        for(Commendation commendation: commendations) {
            try {
                commendationsCopy.add((Commendation)commendation.clone());
            } catch(CloneNotSupportedException e) {

            }
        }

        String show = request.getParameter("show");
        if(show == null) {
            show = "all";
        }

        if(!show.equalsIgnoreCase("all")) {
            String showTemp = show;
            String finalShow = showTemp.replaceAll("\\+", " ");
            commendationsCopy.removeIf(commendation -> !commendation.getFaction().equals(finalShow));
        }

        String sort = request.getParameter("sort");
        if(sort == null) {
            sort = "alphaAZ";
        }
        switch (sort) {
            case "alphaAZ":
                commendationsCopy.sort((c1, c2) -> c1.getTitle().compareTo(c2.getTitle()));
                break;
            case "alphaZA":
                commendationsCopy.sort((c1, c2) -> c1.getTitle().compareTo(c2.getTitle()) * -1);
                break;
        }

        String search = request.getParameter("search");
        if(search != null) {
            String finalSearch = search;
            commendationsCopy.removeIf(commendation -> !commendation.getTitle().toLowerCase().contains(finalSearch.toLowerCase()));
        } else {
            search = "";
        }
        request.setAttribute("search", search);
        request.setAttribute("show", show);
        request.setAttribute("sort", sort);
        // request.setAttribute("commendations", commendations);
        request.setAttribute("commendations", commendationsCopy);
        request.getRequestDispatcher("WEB-INF/commendations/commendations.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CommendationDAO_MySQL commendation_data = new CommendationDAO_MySQL();
        commendations = commendation_data.getAll();
        String btnAction = request.getParameter("btn");
        if (btnAction.equals("delete")) {
            commendation_data.delete(request.getParameter("title"));
        }
        if (btnAction.equals("edit")) {
            String commendationToEdit = request.getParameter("title");
            Commendation commendationToSend = commendation_data.get(commendationToEdit);
            request.setAttribute("commendationToSend",commendationToSend);
            request.getRequestDispatcher("/WEB-INF/commendations/edit-commendation.jsp").forward(request, response);
            return;
        }
        commendations = commendation_data.getAll();
        request.setAttribute("commendations", commendations);
        request.getRequestDispatcher("/WEB-INF/commendations/commendations.jsp").forward(request, response);
    }
}
