<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>RestMan | Add Food</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-image: url('https://images2.alphacoders.com/229/thumb-1920-22930.jpg');
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                height: 100vh;
                color: #333;
            }

            .container {
                max-width: 700px;
                margin-top: 50px;
            }

            .card {
                padding: 20px;
                border-radius: 10px;
                background-color: rgba(255, 255, 255, 0.85);
            }

            .btn-submit {
                width: 100%;
                margin-top: 20px;
            }

            .form-label {
                font-weight: bold;
            }

            .card-header {
                background-color: #007bff;
                color: white;
            }

            .btn-primary {
                background-color: #28a745;
                border-color: #28a745;
            }

            .btn-primary:hover {
                background-color: #218838;
                border-color: #1e7e34;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="card">
                <div class="card-header text-center">
                    <h4>Add New Food</h4>
                </div>
                <div class="card-body">
                    <form action="addfood" method="POST" onsubmit="return validateForm()">
                        <div class="mb-3">
                            <label for="name" class="form-label">Food Name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="type" class="form-label">Food Type</label>
                            <select class="form-control" id="type" name="type" required>
                                <option value="Main Dish">Main Dish</option>
                                <option value="Appetizer">Appetizer</option>
                                <option value="Dessert">Dessert</option>
                                <option value="Drink">Drink</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="ingredients" class="form-label">Ingredients</label>
                            <textarea class="form-control" id="ingredients" name="ingredients" rows="3" required></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="price" class="form-label">Price</label>
                            <input type="text" class="form-control" id="price" name="price" required>
                        </div>
                        <div class="mb-3">
                            <label for="disc" class="form-label">Description</label>
                            <textarea class="form-control" id="disc" name="disc" rows="3"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary btn-submit">Add Food</button>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
        <script>
                        function validateForm() {
                            var price = document.getElementById("price").value;
                            var regex = /^[0-9]+(\.[0-9]{1,2})?$/;
                            if (!regex.test(price)) {
                                alert("Please enter a valid price (e.g., 10.99)");
                                return false;
                            }
                            return true;
                        }

            <% if (request.getAttribute("error") != null) {%>
                        alert("<%= request.getAttribute("error")%>");
                        window.location.href = "getfoods";
            <% } else if (request.getAttribute("success") != null) {%>
                        alert("<%= request.getAttribute("success")%>");
                        window.location.href = "getfoods";
            <% }%>
        </script>
    </body>
</html>
