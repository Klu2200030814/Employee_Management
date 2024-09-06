<%@ page import="com.entity.Employee" %>
<%@ page import="javax.persistence.EntityManager" %>
<%@ page import="javax.persistence.EntityManagerFactory" %>
<%@ page import="javax.persistence.Persistence" %>
<%@ page import="javax.persistence.TypedQuery" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Employee Approvals</title>
    <%@ include file="header_footer.jsp" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
      body {
        background-color: #f4f9f8;
        font-family: 'Arial', sans-serif;
      }
      .card {
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        border: none;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
        color: #fff;
        opacity: 0;
        transform: translateY(20px);
        transition: opacity 0.5s ease, transform 0.5s ease;
      }
      .card.visible {
        opacity: 1;
        transform: translateY(0);
      }
      .card-body {
        padding: 20px;
        position: relative;
      }
      .card-img-top {
        border-radius: 50%;
        display: block;
        margin: 0 auto 20px;
        border: 3px solid #fff;
      }
      .approval-options {
        position: absolute;
        right: 20px;
        top: 20px;
      }
      .approval-options label {
        margin-right: 10px;
        color: #fff;
      }
      .submit-btn {
        margin-top: 20px;
      }
      .alert {
        margin-top: 20px;
      }
    </style>
    <script>
      document.addEventListener("DOMContentLoaded", function() {
        var cards = document.querySelectorAll(".card");
        cards.forEach(function(card, index) {
          setTimeout(function() {
            card.classList.add("visible");
          }, index * 100);
        });
      });
    </script>
  </head>
  <body>
    <div class="container">
      <%@ include file="navigation2.jsp" %>
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

    <form action="ApprovalServlet" method="post">
      <%
        EntityManagerFactory emf = null;
        EntityManager em = null;
        try {
            emf = Persistence.createEntityManagerFactory("jpa");
            em = emf.createEntityManager();
            em.getTransaction().begin();

            TypedQuery<Employee> qry = em.createQuery("SELECT e FROM Employee e ORDER BY e.eid ASC", Employee.class);
            java.util.List<Employee> ls = qry.getResultList();

            em.getTransaction().commit();
            
            for(Employee emp : ls) {
      %>
      <input type="hidden" name="employee_<%= emp.getEid() %>" value="<%= emp.getEid() %>">
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
            <div class="approval-options">
              <input type="radio" name="approval_<%= emp.getEid() %>" value="Approved" id="approved_<%= emp.getEid() %>">
              <label for="approved_<%= emp.getEid() %>">Approved</label>
              <input type="radio" name="approval_<%= emp.getEid() %>" value="Rejected" id="rejected_<%= emp.getEid() %>">
              <label for="rejected_<%= emp.getEid() %>">Rejected</label>
            </div>
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
      <div class="container submit-btn">
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
    </form>
  </body>
</html>