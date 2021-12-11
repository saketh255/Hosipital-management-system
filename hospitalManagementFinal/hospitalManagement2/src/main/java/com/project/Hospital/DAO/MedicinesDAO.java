package com.project.Hospital.DAO;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.project.Hospital.model.Medicines;

public interface MedicinesDAO extends CrudRepository<Medicines, Integer>{
	
	public List<Medicines> findAll();
	

}
