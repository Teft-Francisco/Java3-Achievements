package com.francisco.commendations;

import com.francisco.data.CommendationDAO_MySQL;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EditCommendationServlet", value = "/edit-commendation")
public class EditCommendationServlet extends HttpServlet {

    private Commendation commendation;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CommendationDAO_MySQL commendation_data = new CommendationDAO_MySQL();
        if(commendation == null) {
            commendation = (Commendation) request.getSession().getAttribute("commendation");;
        }
            request.setAttribute("commendationToEdit", commendation);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
