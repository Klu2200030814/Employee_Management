package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ManagerServlet")
public class ManagerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if ("manager".equals(username) && "manager".equals(password)) {
            request.getRequestDispatcher("managerindex.jsp").forward(request, response);
        } else {
            response.setContentType("text/html");
            response.getWriter().println("<script type='text/javascript'>");
            response.getWriter().println("alert('Invalid credentials');");
            response.getWriter().println("location='managerloginn.jsp';");
            response.getWriter().println("</script>");
        }
    }
}
