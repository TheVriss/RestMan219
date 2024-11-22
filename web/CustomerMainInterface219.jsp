<%@page import="model.User219"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>RestMan | Customer Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .navbar {
                background-color: #004085;
                padding: 0 20px;
            }

            .navbar-brand {
                color: white;
                font-size: 1.8rem;
                font-weight: bolder;
            }

            .hello-customer {
                text-align: center;
                font-size: 1.5rem;
                margin-top: 20px;
                width: 100%;
            }

            .dashboard-content {
                text-align: center;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 600px;
                margin-top: 20px;
                background-color: #f8f9fa;
            }

            .container {
                max-width: 800px;
            }

            .ms-auto {
                margin-left: auto !important;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">RestMan</a>
                <a href="logout" class="btn btn-danger ms-auto">Logout</a>
            </div>
        </nav>
        <div class="container d-flex flex-column align-items-center vh-100">
            <div class="hello-customer">
                <h2>Welcome, 
                    <%= session.getAttribute("customer") != null
                        ? ((User219) session.getAttribute("customer")).getFullName() : "Customer"%>
                </h2>
            </div>
            <div class="dashboard-content">
                <h4 class="mb-4">Customer Dashboard</h4>
                <div class="d-grid gap-2">
                    <a href="MakeReservationInterface219.jsp" class="btn btn-primary btn-lg">Make Reservation</a>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    </body>
</html>
