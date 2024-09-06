<%@ page import="com.entity.Employee" %>
<%@ page import="javax.persistence.EntityManager" %>
<%@ page import="javax.persistence.EntityManagerFactory" %>
<%@ page import="javax.persistence.Persistence" %>
<%@ page import="javax.persistence.TypedQuery" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Approved Employees</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f9f8;
            font-family: 'Arial', sans-serif;
        }
        .container {
            margin-top: 20px;
        }
        .alert {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>Approved Employees</h3>
        <%
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
            EntityManager em = emf.createEntityManager();
            
            // Use the implicit session object
            // HttpSession session = request.getSession(false); // Not needed as session is an implicit object

            try {
                em.getTransaction().begin();

                TypedQuery<Employee> qry = em.createQuery("SELECT e FROM Employee e ORDER BY e.eid ASC", Employee.class);
                java.util.List<Employee> employees = qry.getResultList();

                em.getTransaction().commit();
                
                if (session != null) {
                    @SuppressWarnings("unchecked")
                    Map<Integer, String> approvalStatuses = (Map<Integer, String>) session.getAttribute("approvalStatuses");

                    if (approvalStatuses != null && !approvalStatuses.isEmpty()) {
        %>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Employee ID</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Address</th>
                    <th>Mobile</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for (Employee emp : employees) { 
                        if ("Approved".equals(approvalStatuses.get(emp.getEid()))) {
                %>
                    <tr>
                        <td><%= emp.getEid() %></td>
                        <td><%= emp.getName() %></td>
                        <td><%= emp.getGender() %></td>
                        <td><%= emp.getAddress() %></td>
                        <td><%= emp.getMobile() %></td>
                        <td><%= emp.getEmail() %></td>
                    </tr>
                <% 
                        }
                    } 
                %>
            </tbody>
        </table>
        <% 
                    } else {
        %>
        <div class="alert alert-info">No approved employees found.</div>
        <% 
                    }
                } else {
        %>
        <div class="alert alert-warning">Session expired or not found.</div>
        <% 
                }
            } catch (Exception e) {
                if (em.getTransaction().isActive()) {
                    em.getTransaction().rollback();
                }
                e.printStackTrace();
            } finally {
                em.close();
                emf.close();
            }
        %>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
