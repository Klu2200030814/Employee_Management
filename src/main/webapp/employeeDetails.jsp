<%@page import="com.entity.Employee" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Employee Details</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2 class="mt-4">Employee Details</h2>
        <% 
            Employee employee = (Employee) request.getAttribute("employee");
            if (employee != null) {
        %>
        <div class="card mt-3">
            <div class="card-body">
                <h5 class="card-title">Employee ID: <%= employee.getEid() %></h5>
                <p class="card-text">Name: <%= employee.getName() %></p>
                <p class="card-text">Gender: <%= employee.getGender() %></p>
                <p class="card-text">Address: <%= employee.getAddress() %></p>
                <p class="card-text">Mobile: <%= employee.getMobile() %></p>
                <p class="card-text">Email: <%= employee.getEmail() %></p>
            </div>
        </div>
        <% 
            } else {
                out.println("Employee not found.");
            }
        %>
        <a href="managerindex.jsp" class="btn btn-primary mt-3">Back to Home</a>
    </div>
</body>
</html>
