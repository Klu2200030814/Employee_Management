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
    // Begin a new local transaction
    em.getTransaction().begin();

    // Get parameters from the request
    int eid = Integer.parseInt(request.getParameter("eid"));
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String address = request.getParameter("address");
    String mobile = request.getParameter("mobile");
    String email = request.getParameter("email");

    // Create a new Employee object
    Employee emp = new Employee();
    
    // Persist the employee object to the database
    em.persist(emp);
    // Commit the transaction
    em.getTransaction().commit();
    // Close the entity manager
    em.close();
    // Close the entity manager factory
    emf.close();
%>
<br><br>
<div style="text-align: center;">
    <h2>Record Saved Successfully</h2>
    <h2><a href='displayemployee.jsp'>View Records</a></h2>
</div>

</body>
</html>
