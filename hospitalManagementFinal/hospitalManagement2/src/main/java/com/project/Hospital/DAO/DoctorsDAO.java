package com.project.Hospital.DAO;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.project.Hospital.model.Doctors;

public interface DoctorsDAO extends CrudRepository<Doctors, Integer> {
    
	public List<Doctors> findAll();
	public Doctors findByName(String name);
	public List<Doctors> findByDepartmentId(Integer dept_id);
	
	public Doctors findByUname(String uname);
	
}