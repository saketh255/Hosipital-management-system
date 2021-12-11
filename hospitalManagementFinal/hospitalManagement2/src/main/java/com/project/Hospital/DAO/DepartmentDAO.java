package com.project.Hospital.DAO;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.project.Hospital.model.Department;

public interface DepartmentDAO  extends CrudRepository<Department, Integer>{
	
	public List<Department> findAll();

}
