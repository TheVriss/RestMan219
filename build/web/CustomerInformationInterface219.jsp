<%@ page import="java.util.List" %>
<%@ page import="model.Table219" %>
<%@ page import="model.Customer219" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>RestMan | Customer Information</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .fixed-btn {
                position: fixed;
                bottom: 20px;
                left: 50%;
                transform: translateX(-50%);
                z-index: 1000;
                display: flex;
                justify-content: center;
                gap: 10px;
            }

            .fixed-btn button, .fixed-btn a {
                padding: 10px 20px;
                font-size: 1rem;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                text-decoration: none;
            }

            .fixed-btn .btn-primary {
                background-color: #007bff;
                color: white;
            }

            .fixed-btn .btn-secondary {
                background-color: #6c757d;
                color: white;
            }

            body {
                background-color: #f8f9fa;
            }
        </style>
    </head>
    <body>
        <div class="container mt-4">
            <h2 class="text-center mb-5">Customer Information</h2>
            <div class="card p-4 shadow">
                <form id="formReservation" action="confirm" method="get">
                    <div class="mb-3">
                        <label class="form-label">Customer Name</label>
                        <input type="text" class="form-control" value="<%
                            Customer219 customer = (Customer219) session.getAttribute("customer");
                            if (customer != null) {
                                out.print(customer.getFullName());
                            } else {
                                out.print("Guest");
                            }
                               %>" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Phone Number</label>
                        <input type="text" class="form-control" value="<%= customer != null ? customer.getPhoneNumber() : "N/A"%>" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" value="<%= customer != null ? customer.getEmail() : "N/A"%>" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <textarea class="form-control" rows="3" readonly><%= customer != null ? customer.getDescription() : "N/A"%></textarea>
                    </div>
                    <div>
                        <h4>Selected Tables</h4>
                        <ul>
                            <%
                                String[] tableIds = request.getParameterValues("tableIds");
                                if (tableIds != null) {
                                    for (String tableId : tableIds) {
                            %>
                            <li>Table ID: <%= tableId%>
                                <input type="hidden" name="tableIds" value="<%= tableId%>">
                            </li>
                            <%
                                }
                            } else {
                            %>
                            <li>No tables selected</li>
                                <%
                                    }
                                %>
                        </ul>
                    </div>
                    <input type="hidden" name="date" value="<%= request.getParameter("date")%>">
                    <input type="hidden" name="startTime" value="<%= request.getParameter("startTime")%>">
                    <input type="hidden" name="endTime" value="<%= request.getParameter("endTime")%>">
                    <div class="fixed-btn">
                        <button type="submit" class="btn btn-primary">Next</button>
                        <a href="MakeReservationInterface219.jsp" class="btn btn-secondary">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
