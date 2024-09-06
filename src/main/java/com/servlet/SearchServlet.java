package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import com.entity.Employee;

public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String eidParam = request.getParameter("eid");
        
        if (eidParam == null || eidParam.isEmpty()) {
            response.sendRedirect("index.jsp?error=noId");
            return;
        }

        int eid = Integer.parseInt(eidParam);
        EntityManagerFactory emf = null;
        EntityManager em = null;
        Employee employee = null;

        try {
            emf = Persistence.createEntityManagerFactory("jpa");
            em = emf.createEntityManager();
            
            TypedQuery<Employee> query = em.createQuery("SELECT e FROM Employee e WHERE e.eid = :eid", Employee.class);
            query.setParameter("eid", eid);
            employee = query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (em != null) em.close();
            if (emf != null) emf.close();
        }

        if (employee == null) {
            response.sendRedirect("index.jsp?error=noEmployeeFound");
        } else {
            request.setAttribute("employee", employee);
            request.getRequestDispatcher("search.jsp").forward(request, response);
        }
    }
}
