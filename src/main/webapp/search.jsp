<%@ page import="com.entity.Employee" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Result</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #007bff; /* Blue background for the page */
            color: white; /* Default text color for readability */
        }
        .card-custom {
            background-color: black; /* Black background for the card */
            color: white; /* White text color */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Shadow effect */
        }
        .card-custom .card-body {
            padding: 20px; /* Padding inside the card */
        }
        .card-custom .card-text {
            font-size: 1.1rem; /* Larger text */
        }
        .card-custom .card-title {
            color: #f8f9fa; /* Slightly lighter color for the title */
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h3>Employee Search Result</h3>
    <c:choose>
        <c:when test="${not empty employee}">
            <div class="card mt-3 card-custom">
                <img class="card-img-top m-4" style="max-width:70px;" src="css/emp.png" alt="Employee image">
                <div class="card-body">
                    <h5 class="card-title">Employee Details</h5>
                    <p class="card-text">ID: ${employee.eid}</p>
                    <p class="card-text">Name: ${employee.name}</p>
                    <p class="card-text">Gender: ${employee.gender}</p>
                    <p class="card-text">Address: ${employee.address}</p>
                    <p class="card-text">Mobile: ${employee.mobile}</p>
                    <p class="card-text">Email: ${employee.email}</p>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-danger" role="alert">
                No employee found with the given ID.
            </div>
        </c:otherwise>
    </c:choose>
</div>
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
