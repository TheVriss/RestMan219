package controller;

import dao.UserDAO219;

import model.User219;
import model.Manager219;
import model.Customer219;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    private UserDAO219 userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO219();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User219 user = userDAO.login(username, password);

        if (user != null) {
            HttpSession session = request.getSession();
            if (user instanceof Manager219) {
                session.setAttribute("manager", user);
                response.sendRedirect("ManagerMainInterface219.jsp");
            } else if (user instanceof Customer219) {
                session.setAttribute("customer", user);
                response.sendRedirect("CustomerMainInterface219.jsp");
            } else {
                response.sendRedirect("index.jsp?error=invalidRole");
            }
        } else {
            response.sendRedirect("index.jsp?error=invalidCredentials");
        }
    }
}
