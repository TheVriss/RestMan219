<%@page import="model.Table219"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>RestMan | Make Reservation</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fa;
            }

            .container {
                max-width: 960px;
            }

            h2 {
                font-size: 2rem;
                margin-bottom: 20px;
                font-weight: bold;
            }

            .card {
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            .form-label {
                font-weight: bold;
                color: #495057;
            }

            .form-control {
                padding: 10px;
                font-size: 1rem;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .btn-primary, .btn-secondary {
                padding: 10px 20px;
                font-size: 1rem;
                border-radius: 8px;
            }

            .table {
                margin-top: 30px;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            .table th, .table td {
                padding: 12px 20px;
                text-align: center;
            }

            .table-primary {
                background-color: #007bff;
                color: white;
            }

            .table-hover tbody tr:hover {
                background-color: #f1f1f1;
            }

            .text-center {
                text-align: center;
            }

            .mt-4 {
                margin-top: 40px;
            }

            .mb-3 {
                margin-bottom: 15px;
            }

            .col-md-3 {
                margin-bottom: 15px;
            }

            .fixed-btn {
                position: fixed;
                bottom: 20px;
                right: 20px;
                z-index: 1000;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                background-color: white;
                border-radius: 8px;
                padding: 10px;
            }

            .fixed-btn button {
                padding: 10px 20px;
                font-size: 1rem;
            }
        </style>
    </head>
    <body>
        <div class="container mt-4">
            <h2 class="text-center">Make a Reservation</h2>
            <div class="card p-4 shadow">
                <form id="search" action="findavailabletables" method="post">
                    <div class="row mb-3">
                        <div class="col-md-3">
                            <label for="date" class="form-label">Date</label>
                            <input type="date" id="date" name="date" class="form-control" required>
                        </div>
                        <div class="col-md-3">
                            <label for="startTime" class="form-label">Start Time</label>
                            <select id="startTime" name="startTime" class="form-control" required>
                                <%
                                    for (int hour = 0; hour < 24; hour++) {
                                        for (int minute = 0; minute < 60; minute += 30) {
                                            String time = String.format("%02d:%02d", hour, minute);
                                %>
                                <option value="<%= time%>"><%= time%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="endTime" class="form-label">End Time</label>
                            <select id="endTime" name="endTime" class="form-control" required>
                                <%
                                    for (int hour = 0; hour < 24; hour++) {
                                        for (int minute = 0; minute < 60; minute += 30) {
                                            String time = String.format("%02d:%02d", hour, minute);
                                %>
                                <option value="<%= time%>"><%= time%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="capacity" class="form-label">Capacity</label>
                            <input type="number" id="capacity" name="capacity" class="form-control" min="1" required>
                        </div>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Search</button>
                        <a href="CustomerMainInterface219.jsp" class="btn btn-secondary">Return</a>
                    </div>
                </form>
            </div>
            <div class="mt-4">
                <h4 class="text-center">Available Tables</h4>
                <form action="CustomerInformationInterface219.jsp" method="post">
                    <table class="table table-bordered table-hover">
                        <thead class="table-primary">
                            <tr>
                                <th>Table Name</th>
                                <th>Capacity</th>
                                <th>Select</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Table219> availableTables = (List<Table219>) request.getAttribute("availableTables");
                                if (availableTables != null && !availableTables.isEmpty()) {
                                    for (Table219 table : availableTables) {
                            %>
                            <tr>
                                <td><%= table.getName()%></td>
                                <td><%= table.getCapacity()%></td>
                                <td>
                                    <input type="checkbox" name="tableIds" value="<%= table.getId()%>">
                                </td>
                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="3" class="text-center">No tables found. Please search to see available tables.</td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                    <input type="hidden" name="date" value="<%= request.getParameter("date")%>">
                    <input type="hidden" name="startTime" value="<%= request.getParameter("startTime")%>">
                    <input type="hidden" name="endTime" value="<%= request.getParameter("endTime")%>">
                    <div class="fixed-btn">
                        <button type="submit" class="btn btn-primary">Confirm Selection</button>
                    </div>
                </form>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    </body>
</html>
