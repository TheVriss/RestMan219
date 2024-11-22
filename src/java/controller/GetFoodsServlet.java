package controller;

import dao.FoodDAO219;

import model.Food219;

import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class GetFoodsServlet extends HttpServlet {

    private FoodDAO219 foodDAO;

    public GetFoodsServlet() {
        super();
    }

    @Override
    public void init() throws ServletException {
        foodDAO = new FoodDAO219();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ArrayList<Food219> foods = foodDAO.getFoods();

            request.setAttribute("foods", foods);

            request.getRequestDispatcher("FoodManagementInterface219.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while retrieving the food list.");
        }
    }
}
