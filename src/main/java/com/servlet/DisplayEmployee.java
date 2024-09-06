package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import com.entity.Employee;
import com.model.EmployeeManager;

@WebServlet("/displayemployee")
public class DisplayEmployee extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@EJB
    private EmployeeManager employeeManager;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve the list of employees from the EJB
            List<Employee> employeeList = employeeManager.getData();

            // Set the list as a request attribute with generics
            request.setAttribute("employeeList", employeeList);

            // Forward to the JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("displayemployee.jsp");
            dispatcher.forward(request, response);
            
        } catch (Exception e) {
            throw new ServletException("Error retrieving employee data", e);
        }
    }
}
