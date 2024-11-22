package controller;

import model.Customer219;
import model.Table219;

import dao.TableDAO219;
import dao.ReservationDAO219;
import dao.BookedTableDAO219;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ConfirmServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] tableIds = request.getParameterValues("tableIds");

        if (tableIds != null && tableIds.length > 0) {
            TableDAO219 tableDAO = new TableDAO219();
            List<Table219> tables = new ArrayList<>();

            for (String tableId : tableIds) {
                Table219 table = tableDAO.findTableById(Integer.parseInt(tableId));
                if (table != null) {
                    tables.add(table);
                }
            }
            request.setAttribute("tables", tables);
        } else {
            request.setAttribute("tables", new ArrayList<>());
        }
        request.getRequestDispatcher("/ConfirmationInterface219.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        String date = request.getParameter("date");
        String[] tableIds = request.getParameterValues("tableIds");

        HttpSession session = request.getSession();
        Customer219 customer = (Customer219) session.getAttribute("customer");

        String message;
        String redirect;
        if (customer != null) {
            try {
                ReservationDAO219 reservationDAO = new ReservationDAO219();
                BookedTableDAO219 bookedTableDAO = new BookedTableDAO219();

                String reservationTime = date + " " + startTime;
                int reservationId = reservationDAO.createReservation(reservationTime, "Reservation confirmed by customer", customer.getId());

                if (reservationId > 0) {
                    if (tableIds != null) {
                        for (String tableId : tableIds) {
                            bookedTableDAO.createBookedTable(
                                    Integer.parseInt(tableId),
                                    reservationId,
                                    reservationTime,
                                    date + " " + endTime
                            );
                        }
                    }
                    message = "Reservation confirmed successfully!";
                    redirect = "CustomerMainInterface219.jsp";
                } else {
                    message = "Failed to confirm reservation!";
                    redirect = "ConfirmationInterface219.jsp";
                }
            } catch (SQLException e) {
                e.printStackTrace();
                message = "An error occurred while processing your reservation!";
                redirect = "ConfirmationInterface219.jsp";
            }
        } else {
            message = "You must be logged in to make a reservation!";
            redirect = "index.jsp";
        }

        request.setAttribute("message", message);
        request.setAttribute("redirect", redirect);
        request.getRequestDispatcher("/ConfirmationInterface219.jsp").forward(request, response);
    }
}
