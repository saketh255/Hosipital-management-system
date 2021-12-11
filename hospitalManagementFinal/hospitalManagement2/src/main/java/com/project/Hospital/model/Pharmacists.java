package com.project.Hospital.model;



	import javax.persistence.Column;
import javax.persistence.Entity;
	import javax.persistence.GeneratedValue;
	import javax.persistence.GenerationType;
	import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

	@Entity
	public class Pharmacists {

		@Id
		@Column(name = "id")
		@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "pharmacists_seq")
		@SequenceGenerator(name = "pharmacists_seq", sequenceName = "pharmacists_seq", allocationSize = 1)
		private Integer Id;
		private String name;
		private String address;
		private long contact;
		private Integer salary;
		private String uname;
		
		public Pharmacists() {
			// TODO Auto-generated constructor stub
		}

		public Pharmacists(Integer id, String name, String address, long contact, Integer salary, String uname) {
			super();
			Id = id;
			this.name = name;
			this.address = address;
			this.contact = contact;
			this.salary = salary;
			this.uname = uname;
		}

		public Integer getId() {
			return Id;
		}

		public void setId(Integer id) {
			Id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
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

		public String getUname() {
			return uname;
		}

		public void setUname(String uname) {
			this.uname = uname;
		}

		@Override
		public String toString() {
			return "Pharmacists [Id=" + Id + ", name=" + name + ", address=" + address + ", contact=" + contact
					+ ", salary=" + salary + ", uname=" + uname + "]";
		}

		
	}