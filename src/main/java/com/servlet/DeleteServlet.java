package com.servlet;

import java.io.IOException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Employee;

public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int eid = Integer.parseInt(request.getParameter("eid"));

        EntityManagerFactory emf = null;
        EntityManager em = null;
        try {
            emf = Persistence.createEntityManagerFactory("jpa");
            em = emf.createEntityManager();
            em.getTransaction().begin();

            // Find the employee entity by ID
            Employee emp = em.find(Employee.class, eid);

            if (emp != null) {
                // Remove the entity if it exists
                em.remove(emp);
                em.getTransaction().commit();
            } else {
                // If employee not found, handle it appropriately
                em.getTransaction().rollback();
                response.sendRedirect("displayemployee.jsp?deleteSuccess=false");
                return;
            }

            // Redirect after successful deletion
            response.sendRedirect("displayemployee.jsp?deleteSuccess=true");
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            response.sendRedirect("displayemployee.jsp?deleteSuccess=false");
        } finally {
            if (em != null) em.close();
            if (emf != null) emf.close();
        }
    }
}
