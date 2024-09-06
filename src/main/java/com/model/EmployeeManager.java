package com.model;

import java.util.List;

import javax.ejb.Remote;

import com.entity.Employee;

@Remote
public interface EmployeeManager {
    public String saveData(Employee emp) throws Exception;
    public List<Employee> getData() throws Exception;
    public String updateData(int eid, Employee emp) throws Exception;
    public String deleteData(int eid) throws Exception;
   // public String updateApprovalStatus(int eid, String approvalStatus) throws Exception;
}
