package com.project.Hospital.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Department {

	@Id
	private Integer ID;
	private String Name;
	
	public Department(Integer iD, String name) {
		super();
		ID = iD;
		Name = name;
	}

	public Department() {
		super();
	}

	public Integer getID() {
		return ID;
	}

	public void setID(Integer iD) {
		ID = iD;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	@Override
	public String toString() {
		return "Department [ID=" + ID + ", Name=" + Name + "]";
	}


}