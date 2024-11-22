package controller;

import dao.FoodDAO219;

import model.Food219;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddFoodServlet extends HttpServlet {

    private FoodDAO219 foodDAO;

    @Override
    public void init() throws ServletException {
        foodDAO = new FoodDAO219();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String ingredients = request.getParameter("ingredients");
        float price;
        try {
            price = Float.parseFloat(request.getParameter("price"));
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Price must be a valid number.");
            request.getRequestDispatcher("AddFoodInterface219.jsp").forward(request, response);
            return;
        }
        String disc = request.getParameter("disc");

        Food219 food = new Food219(name, type, ingredients, price, disc);

        boolean isAdded = foodDAO.addFood(food);
        if (isAdded) {
            request.setAttribute("success", "Food added successfully!");
        } else {
            request.setAttribute("error", "Unable to add food.");
        }
        request.getRequestDispatcher("AddFoodInterface219.jsp").forward(request, response);
    }
}
