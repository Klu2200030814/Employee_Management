<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management System</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css"> <!-- Link to your style.css -->
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light navbarbackground">
    <a class="navbar-brand" href="#">Employee Management System</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="managerindex.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="addemployee.jsp">Add Employee</a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="displayemployee.jsp">Display All</a>
            </li>
              <li class="nav-item">
                <a class="nav-link" href="displayemployee3.jsp">Delete</a>
            </li>
             <li class="nav-item">
                <a class="nav-link" href="displayemployee4.jsp">update</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" action="SearchServlet" method="get">
            <input class="form-control mr-sm-2" type="search" name="eid" placeholder="Enter Employee ID" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
        <form class="form-inline my-2 my-lg-0 ml-2" action="LogoutServlet" method="post">
            <button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Logout</button>
        </form>
    </div>
</nav>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
