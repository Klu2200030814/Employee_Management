package com.servlet;

import com.entity.Employee;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class ApprovalServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Retrieve parameters and store approval statuses in the session
        Map<Integer, String> approvalStatuses = new HashMap<>();
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
        EntityManager em = emf.createEntityManager();
        
        try {
            em.getTransaction().begin();

            for (String paramName : request.getParameterMap().keySet()) {
                if (paramName.startsWith("approval_")) {
                    int eid = Integer.parseInt(paramName.substring("approval_".length()));
                    String status = request.getParameter(paramName);
                    approvalStatuses.put(eid, status);

                    if ("Rejected".equals(status)) {
                        // Remove rejected employee from the database
                        Employee emp = em.find(Employee.class, eid);
                        if (emp != null) {
                            em.remove(emp);
                        }
                    }
                }
            }

            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
            emf.close();
        }

        // Store the approval statuses in the session
        session.setAttribute("approvalStatuses", approvalStatuses);

        response.sendRedirect("status.jsp?updateSuccess=true");
    }
}
