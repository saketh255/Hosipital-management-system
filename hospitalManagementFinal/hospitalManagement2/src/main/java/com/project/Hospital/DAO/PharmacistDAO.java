package com.project.Hospital.DAO;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.project.Hospital.model.Pharmacists;

public interface PharmacistDAO extends CrudRepository<Pharmacists, Integer>{
	
	public List<Pharmacists> findAll();
	public Pharmacists findByName(String name);

}
