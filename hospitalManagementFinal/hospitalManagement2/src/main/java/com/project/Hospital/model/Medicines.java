package com.project.Hospital.model;

import javax.persistence.*;

@Entity
public class Medicines {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "medicine_seq")
	@SequenceGenerator(name = "medicine_seq", sequenceName = "medicine_seq", allocationSize = 1)
	private Integer id;
	private String name;
	private Integer price;
	private String description;
	
	
	
	public Medicines(Integer id, String name, Integer price, String description) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.description = description;
	}

	public Medicines() {
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Medicines [id=" + id + ", name=" + name + ", price=" + price + ", description=" + description + "]";
	}
	
	
	
}