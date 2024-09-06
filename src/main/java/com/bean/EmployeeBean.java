package com.bean;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.entity.Employee;

@ManagedBean(name = "employeeBean")
@RequestScoped
public class EmployeeBean {
    private int eid;
    private String name;
    private String gender;
    private String address;
    private String mobile;
    private String email;

    // Getters and Setters for the fields

    public String updateEmployee() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            Employee emp = em.find(Employee.class, eid);
            if (emp != null) {
                emp.setName(name);
                emp.setGender(gender);
                emp.setAddress(address);
                emp.setMobile(mobile);
                emp.setEmail(email);
                em.getTransaction().commit();
            }
        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            em.close();
            emf.close();
        }
        return "displayemployee"; // navigate to the employee display page
    }

    // Other necessary methods
}
