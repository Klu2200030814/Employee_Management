<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8"/>
    <title>Add Employee</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: #D8EFD3; /* Change background color to white */
            color: #F1F8E8; /* Change text color to dark for better contrast on white background */
        }
        .wrapper {
            width: 50%;
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f8f9fa; /* Light background color for the form container */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(6, 208, 1, 0.7), 0 0 20px rgba(6, 208, 1, 0.7), 0 0 30px rgba(6, 208, 1, 0.7);
            margin-top: 20px;
            border: 1px solid #06D001; /* Neon green border */
        }
        h3 {
            margin-bottom: 20px;
            font-weight: bold;
            text-align: center;
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #06D001, #00FF00); /* Gradient from neon green to light green */
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }
        .form-group label {
            font-weight: 600;
            color: #06D001; /* Neon green color */
        }
        .form-control {
            background-color: #ffffff; /* White background for input fields */
            color: #121212; /* Dark text color for better contrast */
            border: 1px solid #06D001; /* Neon green border */
        }
        .btn-primary {
            background-color: #06D001; /* Neon green button background */
            border-color: #06D001; /* Neon green button border */
            color: #ffffff; /* White text color for contrast */
        }
        .alert-info {
            background-color: #f8f9fa; /* Light background for alert */
            color: #06D001; /* Neon green color for alert text */
            border-color: #06D001; /* Neon green border for alert */
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="wrapper">
            <h3>Add New Employee</h3>
            <form action="addEmployee" method="post">
                <div class="form-group">
                    <label for="eid">Employee ID</label>
                    <input type="text" class="form-control" id="eid" name="eid" placeholder="Enter Employee ID" required/>
                </div>
                <div class="form-group">
                    <label for="name">Employee Name</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter Employee Name" required/>
                </div>
                <div class="form-group">
                    <label for="gender">Employee Gender</label>
                    <input type="text" class="form-control" id="gender" name="gender" placeholder="Enter Employee Gender" required/>
                </div>
                <div class="form-group">
                    <label for="address">Employee Address</label>
                    <input type="text" class="form-control" id="address" name="address" placeholder="Enter Employee Address" required/>
                </div>
                <div class="form-group">
                    <label for="mobile">Employee Mobile</label>
                    <input type="text" class="form-control" id="mobile" name="mobile" placeholder="Enter Employee Mobile" required/>
                </div>
                <div class="form-group">
                    <label for="email">Employee Email</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter Employee Email" required/>
                </div>
                <button type="submit" class="btn btn-primary">Add Employee</button>
            </form>
            <% 
                String message = (String) request.getAttribute("message");
                if (message != null) {
            %>
            <div class="alert alert-info mt-3">
                <%= message %>
            </div>
            <% } %>
        </div>
    </div>
</body>
</html>
