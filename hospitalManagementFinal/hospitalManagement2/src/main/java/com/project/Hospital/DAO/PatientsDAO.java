package com.project.Hospital.DAO;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.project.Hospital.model.Patients;

public interface PatientsDAO extends CrudRepository<Patients, Integer>{

	public List<Patients> findAll();
	public Patients findByName(String name);
}
