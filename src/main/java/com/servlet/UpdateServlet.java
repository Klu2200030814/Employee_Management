package com.servlet;

import java.io.IOException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Employee;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int eid = Integer.parseInt(request.getParameter("eid"));
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String mobile = request.getParameter("mobile");
            String email = request.getParameter("email");

            // Create EntityManagerFactory and EntityManager
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
            EntityManager em = emf.createEntityManager();

            // Begin transaction
            em.getTransaction().begin();

            // Find the existing employee record
            Employee emp = em.find(Employee.class, eid);

            if (emp != null) {
                // Update the employee details
                emp.setName(name);
                emp.setGender(gender);
                emp.setAddress(address);
                emp.setMobile(mobile);
                emp.setEmail(email);

                // Commit the transaction to persist the changes
                em.getTransaction().commit();
                response.sendRedirect(request.getContextPath() + "/displayemployee.jsp?updateSuccess=true");
            } else {
                // Handle case where employee is not found
                em.getTransaction().rollback();
                response.sendRedirect(request.getContextPath() + "/displayemployee.jsp?updateSuccess=false");
            }

            // Close the EntityManager
            em.close();
            emf.close();
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions and possibly redirect to an error page
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
