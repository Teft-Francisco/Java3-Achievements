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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/commendations/commendations.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String requirements = request.getParameter("requirements");
        String faction = request.getParameter("faction");
        String result = "";
        if(requirements.substring(requirements.length() - 1).equals(".")) {
            StringBuffer convertedString = new StringBuffer(requirements);
            convertedString.deleteCharAt(convertedString.length() - 1);
            requirements = convertedString.toString();
        }
        int rowsReturned = 0;
        try {
            CommendationDAO_MySQL dao = new CommendationDAO_MySQL();
            rowsReturned = dao.edit(title, description, requirements, faction);
        } catch (Exception ex) {
            result = "An error has occurred while trying submit the edited commendation.";
            request.setAttribute("result", result);
            response.sendRedirect(request.getContextPath() + "/commendations");
        }
        if (rowsReturned == 1) {
            response.sendRedirect(request.getContextPath() + "/commendations");
        } else {
            response.sendRedirect(request.getContextPath() + "/commendations");
        }
    }
}
