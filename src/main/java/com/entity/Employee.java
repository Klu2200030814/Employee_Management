 package com.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "recruitement")
public class Employee implements Serializable {
	
	  private static final long serialVersionUID = 1L;

	    @Id
	    private int eid;

	    private String name;

	    private String gender;

	    private String address;

	    private String mobile;

	    private String email;
	    
	    

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
	}