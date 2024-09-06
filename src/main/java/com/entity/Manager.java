package com.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity

@Table(name = "managerLogin")
public class Manager implements Serializable {
	

	private static final long serialVersionUID = 1L;
	@Id
	int mid;
	String musername;
	String mpassword;
	
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getMusername() {
		return musername;
	}
	public void setMusername(String musername) {
		this.musername = musername;
	}
	public String getMpassword() {
		return mpassword;
	}
	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}

	

	}