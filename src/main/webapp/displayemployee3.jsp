<%@page import="com.entity.Employee" %>
<%@page import="javax.persistence.EntityManager" %>
<%@page import="javax.persistence.EntityManagerFactory" %>
<%@page import="javax.persistence.Persistence" %>
<%@page import="javax.persistence.TypedQuery" %>
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
        background-color: #f4f9f8;
        font-family: 'Arial', sans-serif;
      }
      .card {
        background: linear-gradient(135deg, #6a11cb, #2575fc); /* Gradient background */
        border: none;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
        color: #fff; /* White text color */
        opacity: 0; /* Start invisible */
        transform: translateY(20px); /* Start with slight downward offset */
        transition: opacity 0.5s ease, transform 0.5s ease; /* Transition effects */
      }
      .card.visible {
        opacity: 1; /* Visible */
        transform: translateY(0); /* No offset */
      }
      .card-body {
        padding: 20px;
      }
      .card-text {
        margin-bottom: 10px;
      }
      .card-img-top {
        border-radius: 50%;
        display: block;
        margin: 0 auto 20px;
        border: 3px solid #fff; /* White border */
      }
      .icon-btn {
        background-color: transparent;
        border: none;
        color: #fff;
        font-size: 1.5rem;
        cursor: pointer;
        transition: color 0.3s ease;
        margin-right: 10px;
      }
      .icon-btn:hover {
        color: #f0f0f0;
      }
      .icon-btn-danger {
        color: #dc3545; /* Red color for delete icon */
      }
      .icon-btn-danger:hover {
        color: #c82333; /* Darker red on hover */
      }
      .alert {
        margin-top: 20px;
      }
    </style>
    <script>
      // JavaScript to add the 'visible' class for the floating effect
      document.addEventListener("DOMContentLoaded", function() {
        var cards = document.querySelectorAll(".card");
        cards.forEach(function(card, index) {
          setTimeout(function() {
            card.classList.add("visible");
          }, index * 100); // Stagger the animation with a delay
        });
      });
    </script>
  </head>
  <body>
    <div class="container">
      <%@ include file="navigation.jsp" %>
    </div>

    <div class="container">
      <% 
        String updateSuccess = request.getParameter("updateSuccess");
        if ("true".equals(updateSuccess)) {
      %>
        <div class="alert alert-success" role="alert">
          Saved successfully!
        </div>
      <% } else if ("false".equals(updateSuccess)) { %>
        <div class="alert alert-danger" role="alert">
          Update failed. Employee not found.
        </div>
      <% } %>
    </div>
      
    <%
      EntityManagerFactory emf = null;
      EntityManager em = null;
      try {
          emf = Persistence.createEntityManagerFactory("jpa");
          em = emf.createEntityManager();
          em.getTransaction().begin();

          // Using JPA TypedQuery with ORDER BY clause for ascending order
          TypedQuery<Employee> qry = em.createQuery("SELECT e FROM Employee e ORDER BY e.eid ASC", Employee.class);
          java.util.List<Employee> ls = qry.getResultList();

          em.getTransaction().commit();
          
          for(Employee emp : ls) {
    %>
    <div class="container">
      <div class="card mt-3">
        <img class="card-img-top m-4" style="max-width:70px;" src="css/emp.png" alt="Employee image">
        <div class="card-body">
          <h5 class="card-text">Emp ID: <%= emp.getEid() %></h5>
          <p class="card-text">Name: <%= emp.getName() %></p>
          <p class="card-text">Gender: <%= emp.getGender() %></p>
          <p class="card-text">Address: <%= emp.getAddress() %></p>
          <p class="card-text">Mobile: <%= emp.getMobile() %></p>
          <p class="card-text">Email: <%= emp.getEmail() %></p>
          <a href="DeleteServlet?eid=<%= emp.getEid() %>" class="icon-btn icon-btn-danger"><i class="fas fa-trash-alt"></i></a>
        </div>
      </div>
    </div>
    <%
          }
      } catch (Exception e) {
          if (em != null && em.getTransaction().isActive()) {
              em.getTransaction().rollback();
          }
          e.printStackTrace();
      } finally {
          if (em != null) em.close();
          if (emf != null) emf.close();
      }
    %>
  </body>
</html>
