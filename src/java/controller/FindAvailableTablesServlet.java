package controller;

import dao.TableDAO219;
import model.Table219;

import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FindAvailableTablesServlet extends HttpServlet {

    private TableDAO219 tableDAO;

    @Override
    public void init() throws ServletException {
        tableDAO = new TableDAO219();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        String date = request.getParameter("date");
        String capacity = request.getParameter("capacity");

        if (startTime == null || endTime == null || date == null
                || startTime.isEmpty() || endTime.isEmpty() || date.isEmpty()) {
            request.setAttribute("error", "Please provide complete start time, end time, and date.");
            request.getRequestDispatcher("MakeReservationInterface219.jsp").forward(request, response);
            return;
        }

        ArrayList<Table219> availableTables = tableDAO.findAvailableTables(date, startTime, endTime, capacity);
        if (availableTables.isEmpty()) {
            request.setAttribute("message", "No available tables in the selected time range.");
        } else {
            request.setAttribute("availableTables", availableTables);
        }
        request.getRequestDispatcher("MakeReservationInterface219.jsp").forward(request, response);
    }
}
