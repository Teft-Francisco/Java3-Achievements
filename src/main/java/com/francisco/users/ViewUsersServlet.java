package com.francisco.users;

import com.francisco.data.UserDAO_MySQL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ViewUsersServlet", value = "/view-users")
public class ViewUsersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO_MySQL user_data = new UserDAO_MySQL();
        request.setAttribute("users",user_data.getAll());
        request.getRequestDispatcher("WEB-INF/users/view-users.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
