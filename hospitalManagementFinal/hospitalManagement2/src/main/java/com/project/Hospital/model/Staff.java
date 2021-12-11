package com.project.Hospital.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class Staff {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "staff_seq")
	@SequenceGenerator(name = "staff_seq", sequenceName = "staff_seq", allocationSize = 1)
	private Integer staffId;
	private Integer departmentId;
	private String name;
	private String gender;
	private String address;
	private long contact;
	private Integer salary;
	private String designation;
	
	
	public Staff(Integer staffId, Integer departmentId, String name, String gender, String address, long contact,
			Integer salary, String designation) {
		super();
		this.staffId = staffId;
		this.departmentId = departmentId;
		this.name = name;
		this.gender = gender;
		this.address = address;
		this.contact = contact;
		this.salary = salary;
		this.designation = designation;
	}
	public Staff() {
		super();
	}
	public Integer getStaffId() {
		return staffId;
	}
	public void setStaffId(Integer staffId) {
		this.staffId = staffId;
	}
	public Integer getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
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
	public long getContact() {
		return contact;
	}
	public void setContact(long contact) {
		this.contact = contact;
	}
	public Integer getSalary() {
		return salary;
	}
	public void setSalary(Integer salary) {
		this.salary = salary;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	@Override
	public String toString() {
		return "Staff [staffId=" + staffId + ", departmentId=" + departmentId + ", name=" + name + ", gender=" + gender
				+ ", address=" + address + ", contact=" + contact + ", salary=" + salary + ", designation="
				+ designation + "]";
	}

	
	
}