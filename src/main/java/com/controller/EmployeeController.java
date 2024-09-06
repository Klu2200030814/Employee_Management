package com.controller;

import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;

import com.entity.Employee;
import com.model.EmployeeManager;

@ManagedBean(name = "employee", eager = true)
public class EmployeeController {
    int eid;
    String name;
    String gender;
    String address;
    String mobile;
    String email;

    String response;

    List<Employee> list;

    @EJB(lookup = "java:global/jpa/EmployeeDAO!com.model.EmployeeManager")
    EmployeeManager EM;

    public void callDeleteData() {
        try {
            response = EM.deleteData(eid);
        } catch (Exception e) {
            response = e.getMessage();
        }
    }

    public void callUpdateData() {
        Employee emp = new Employee();
        emp.setEid(eid);
        emp.setName(name);
        emp.setGender(gender);
        emp.setAddress(address);
        emp.setMobile(mobile);
        emp.setEmail(email);
        try {
            response = EM.updateData(eid, emp);
        } catch (Exception e) {
            response = e.getMessage();
        }
    }

    public void callSaveData() {
        Employee emp = new Employee();
        emp.setEid(eid);
        emp.setName(name);
        emp.setGender(gender);
        emp.setAddress(address);
        emp.setMobile(mobile);
        emp.setEmail(email);
        try {
            response = EM.saveData(emp);
        } catch (Exception e) {
            response = e.getMessage();
        }
    }

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    public List<Employee> getList() {
        try {
            list = EM.getData();
        } catch (Exception e) {
            response = e.getMessage();
        }
        return list;
    }

    public void setList(List<Employee> list) {
        this.list = list;
    }
}
