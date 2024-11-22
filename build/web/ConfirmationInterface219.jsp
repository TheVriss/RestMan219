<%@ page import="model.Customer219" %>
<%@ page import="model.Table219" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>RestMan | Reservation Confirmation</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .card {
                margin-bottom: 20px;
            }
            .card-header {
                background-color: #007bff;
                color: white;
                font-size: 1.25rem;
                text-align: center;
            }
            .card-body {
                background-color: white;
                padding: 20px;
            }
            .container-flex {
                display: flex;
                gap: 20px;
                justify-content: space-between;
                flex-wrap: wrap;
            }
            .card-container {
                flex: 1;
                min-width: 280px;
            }
            .table-list {
                padding-left: 20px;
                list-style-type: none;
            }
            .table-item {
                margin-bottom: 15px;
                padding: 10px;
                background-color: #f1f1f1;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }
            .table-item strong {
                color: #007bff;
            }
            .btn-container {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container mt-4">
            <h2 class="text-center mb-4">Reservation Confirmation</h2>
            <div class="container-flex">
                <div class="card-container">
                    <div class="card shadow">
                        <div class="card-header">Customer Information</div>
                        <div class="card-body">
                            <%
                                Customer219 customer = (Customer219) session.getAttribute("customer");
                                if (customer != null) {
                            %>
                            <p><strong>Customer Name: </strong><%= customer.getFullName()%></p>
                            <p><strong>Phone Number: </strong><%= customer.getPhoneNumber()%></p>
                            <p><strong>Email: </strong><%= customer.getEmail()%></p>
                            <p><strong>Description: </strong><%= customer.getDescription()%></p>
                            <%
                            } else {
                            %>
                            <p><strong>Customer not logged in.</strong></p>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
                <div class="card-container">
                    <div class="card shadow">
                        <div class="card-header">Selected Tables</div>
                        <div class="card-body">
                            <ul class="table-list">
                                <%
                                    List<Table219> tables = (List<Table219>) request.getAttribute("tables");
                                    if (tables != null && !tables.isEmpty()) {
                                        for (Table219 table : tables) {
                                %>
                                <li class="table-item">
                                    <strong>Table ID:</strong> <%= table.getId()%><br>
                                    <strong>Table Name:</strong> <%= table.getName()%><br>
                                    <strong>Seats:</strong> <%= table.getCapacity()%><br>
                                    <strong>Description:</strong> <%= table.getDisc()%>
                                </li>
                                <%
                                    }
                                } else {
                                %>
                                <li class="table-item">No tables selected.</li>
                                    <%
                                        }
                                    %>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="btn-container mb-5">
                <a href="MakeReservationInterface219.jsp" class="btn btn-secondary">Return</a>
                <form action="confirm" method="post">
                    <input type="hidden" name="startTime" value="<%= request.getParameter("startTime")%>">
                    <input type="hidden" name="endTime" value="<%= request.getParameter("endTime")%>">
                    <input type="hidden" name="date" value="<%= request.getParameter("date")%>">
                    <%
                        if (tables != null && !tables.isEmpty()) {
                            for (Table219 table : tables) {
                    %>
                    <input type="hidden" name="tableIds" value="<%= table.getId()%>">
                    <%
                            }
                        }
                    %>
                    <button type="submit" class="btn btn-primary">Confirm Reservation</button>
                </form>
            </div>
        </div>
        <%
            String message = (String) request.getAttribute("message");
            String redirect = (String) request.getAttribute("redirect");
            if (message != null) {
        %>
        <script>
            alert("<%= message%>");
            <% if ("CustomerMainInterface219.jsp".equals(redirect)) { %>
            window.location.href = "CustomerMainInterface219.jsp";
            <% } %>
        </script>
        <%
            }
        %>
    </body>
</html>
