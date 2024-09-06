package com.servlet;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Employee;
import com.model.EmployeeManager;

@WebServlet("/addEmployee")
public class AddEmployeeServlet extends HttpServlet {

   
	private static final long serialVersionUID = 1L;
	@EJB(lookup = "java:global/jpa/EmployeeDAO!com.model.EmployeeManager")
    private EmployeeManager employeeManager;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve employee details from request
        int eid = Integer.parseInt(request.getParameter("eid"));
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");

        // Create employee object
        Employee emp = new Employee();
        emp.setEid(eid);
        emp.setName(name);
        emp.setGender(gender);
        emp.setAddress(address);
        emp.setMobile(mobile);
        emp.setEmail(email);

        // Call the business logic to save the employee
        try {
            String result = employeeManager.saveData(emp);
            request.setAttribute("message", result);
        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
        }

        // Forward to the JSP page to display the result
        request.getRequestDispatcher("/addemployee.jsp").forward(request, response);
    }
}
