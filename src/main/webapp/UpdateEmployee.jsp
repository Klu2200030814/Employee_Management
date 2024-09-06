<%@page import="javax.persistence.EntityManager" %>
<%@page import="javax.persistence.EntityManagerFactory" %>
<%@page import="javax.persistence.Persistence" %>
<%@page import="com.entity.Employee" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>EMS</title>
    <%@ include file="header_footer.jsp" %>
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
      body {
        background-color: #f4f6f9;
        font-family: 'Arial', sans-serif;
      }
      .card {
        background: linear-gradient(to right, #4B70F5, #4A249D); /* Lime gradient */
        border: none;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
        transition: transform 0.3s ease-in-out;
      }
      .card-body {
        padding: 20px;
      }
      .card-text {
        color: #333333;
        margin-bottom: 10px;
      }
      .card-img-top {
        border-radius: 50%;
        display: block;
        margin: 0 auto 20px;
      }
      .icon-btn {
        background-color: transparent;
        border: none;
        color: #007bff;
        font-size: 1.5rem;
        cursor: pointer;
        transition: color 0.3s ease;
        margin-right: 10px;
      }
      .icon-btn:hover {
        color: #0056b3;
      }
      .icon-btn-danger {
        color: #dc3545;
      }
      .icon-btn-danger:hover {
        color: #c82333;
      }
      .alert {
        margin-top: 20px;
      }
    </style>
</head>
<body>
<div class="container">
    <%@ include file="navigation.jsp" %>
</div>
<%
    // Obtain the entity manager factory
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
    // Create an entity manager
    EntityManager em = emf.createEntityManager();
    
    // Get the employee ID from the request
    int eid = Integer.parseInt(request.getParameter("eid"));
    // Retrieve the employee from the database using JPA
    Employee emp = em.find(Employee.class, eid);
    
    // Close the entity manager
    em.close();
    // Close the entity manager factory
    emf.close();
%>
<div class="container">
    <div class="card mt-3">
        <img class="card-img-top m-4" style="max-width:70px;" src="css/emp.png" alt="Employee image">
        <div class="card-body">
            <form action="UpdateServlet" method="post">
                <input type="hidden" name="eid" value="<%= emp.getEid() %>">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="name" name="name" value="<%= emp.getName() %>">
                </div>
                <div class="form-group">
                    <label for="gender">Gender:</label>
                    <input type="text" class="form-control" id="gender" name="gender" value="<%= emp.getGender() %>">
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" class="form-control" id="address" name="address" value="<%= emp.getAddress() %>">
                </div>
                <div class="form-group">
                    <label for="mobile">Mobile:</label>
                    <input type="text" class="form-control" id="mobile" name="mobile" value="<%= emp.getMobile() %>">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%= emp.getEmail() %>">
                </div>
                <button type="submit" class="btn btn-primary">Save Update</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
