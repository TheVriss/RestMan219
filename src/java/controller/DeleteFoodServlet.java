package controller;

import dao.FoodDAO219;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class DeleteFoodServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);
                FoodDAO219 foodDAO = new FoodDAO219();
                boolean isDeleted = foodDAO.deleteFood(id);
                if (isDeleted) {
                    response.sendRedirect("getfoods?message=delete-success");
                } else {
                    response.sendRedirect("getfoods?message=delete-fail");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("getfoods?message=delete-fail");
            }
        } else {
            response.sendRedirect("getfoods?message=delete-fail");
        }
    }
}
