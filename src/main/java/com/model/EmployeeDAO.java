package com.model;

import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import com.entity.Employee;

@Stateless
@TransactionManagement(TransactionManagementType.BEAN)
public class EmployeeDAO implements EmployeeManager {

    @Override
    public String saveData(Employee emp) throws Exception {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(emp);
        em.getTransaction().commit();
        em.close();
        emf.close();
        return "Record Inserted Successfully...";
    }

    @Override
    public List<Employee> getData() throws Exception {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
        EntityManager em = emf.createEntityManager();
        
        em.getTransaction().begin();
        TypedQuery<Employee> qry = em.createQuery("select e from Employee e", Employee.class);
        List<Employee> list = qry.getResultList();
        
        em.getTransaction().commit();
        em.close();
        emf.close();
        return list;
    }

    @Override
    public String updateData(int eid, Employee emp) throws Exception {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        
        Employee tmp = em.find(Employee.class, eid);
        if (tmp != null) {
            tmp.setName(emp.getName());
            tmp.setGender(emp.getGender());
            tmp.setAddress(emp.getAddress());
            tmp.setMobile(emp.getMobile());
            tmp.setEmail(emp.getEmail());
            em.getTransaction().commit();
            em.close();
            emf.close();
            return "Updated Successfully";
        } else {
            em.close();
            emf.close();
            return "Employee not found";
        }
    }

    @Override
    public String deleteData(int eid) throws Exception {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("jpa");
        EntityManager em = emf.createEntityManager();
        
        em.getTransaction().begin();
        Employee tmp = em.find(Employee.class, eid);
        if (tmp != null) {
            em.remove(tmp);
            em.getTransaction().commit();
            em.close();
            emf.close();
            return "Deleted Successfully";
        } else {
            em.close();
            emf.close();
            return "Employee not found";
        }
    }
  
}
