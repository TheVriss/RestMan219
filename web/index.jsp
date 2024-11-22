<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>RestMan | Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-image: url('https://images6.alphacoders.com/125/1252495.jpg');
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                height: 100vh;
                margin: 0;
            }

            .login-container {
                background-color: rgba(255, 255, 255, 0.8);
                border-radius: 10px;
                padding: 30px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body>
        <div class="container d-flex justify-content-center align-items-center vh-100">
            <div class="card p-4 shadow-sm login-container" style="max-width: 400px; width: 100%;">
                <h2 class="text-center mb-4">Login</h2>
                <form action="login" method="post">
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" id="username" name="username" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" id="password" name="password" class="form-control" required>
                    </div>
                    <div class="d-grid gap-2">
                        <input type="submit" value="Login" class="btn btn-primary">
                    </div>
                </form>
                <%
                    String error = request.getParameter("error");
                    if (error != null) {
                %>
                <div class="alert alert-danger mt-3">
                    <%= error.equals("invalidCredentials") ? "Invalid username or password." : "Invalid role."%>
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    </body>
</html>
