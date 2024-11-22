<%@page import="java.util.ArrayList"%>
<%@page import="model.Food219"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>RestMan | Food Management</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <style>
            .btn-action {
                min-width: 100px;
                margin: 5px 0;
                padding: 10px 15px;
                text-align: center;
            }

            .action-col {
                width: 250px;
            }

            .btn-add {
                position: fixed;
                bottom: 30px;
                left: 50%;
                transform: translateX(-50%);
                z-index: 10;
                width: 70px;
                height: 70px;
                border-radius: 50%;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .btn-add i {
                font-size: 30px;
            }

            .btn-return {
                margin-left: auto;
            }

            .header-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .table th, .table td {
                vertical-align: middle;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid mt-5">
            <div class="header-row mb-4">
                <h1>Food List</h1>
                <a href="ManagerMainInterface219.jsp" class="btn btn-secondary btn-return">
                    <i class="bi bi-arrow-left"></i> Back
                </a>
            </div>
            <a href="AddFoodInterface219.jsp" class="btn btn-success btn-add">
                <i class="bi bi-plus-circle"></i>
            </a>
            <%
                String message = request.getParameter("message");
                if ("delete-success".equals(message)) {
            %>
            <script type="text/javascript">
                alert("Food deleted successfully!");
            </script>
            <%
            } else if ("delete-fail".equals(message)) {
            %>
            <script type="text/javascript">
                alert("Failed to delete food.");
            </script>
            <%
                }
            %>

            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Food Name</th>
                        <th>Type</th>
                        <th>Ingredients</th>
                        <th>Price</th>
                        <th>Description</th>
                        <th class="action-col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<Food219> foods = (ArrayList<Food219>) request.getAttribute("foods");
                        if (foods != null && !foods.isEmpty()) {
                            for (Food219 food : foods) {
                    %>
                    <tr>
                        <td><%= food.getId()%></td>
                        <td><%= food.getName()%></td>
                        <td><%= food.getType()%></td>
                        <td><%= food.getIngredients()%></td>
                        <td><%= food.getPrice()%></td>
                        <td><%= food.getDisc()%></td>
                        <td class="text-center">
                            <a href="EditFood219.jsp?id=<%= food.getId()%>" class="btn btn-warning btn-action">Edit</a>
                            <a href="deletefood?id=<%= food.getId()%>" class="btn btn-danger btn-action">Delete</a>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="7" class="text-center">No data available.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    </body>
</html>
