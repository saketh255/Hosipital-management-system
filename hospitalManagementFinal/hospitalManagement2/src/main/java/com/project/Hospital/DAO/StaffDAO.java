package com.project.Hospital.DAO;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.project.Hospital.model.Staff;

public interface StaffDAO extends CrudRepository<Staff, Integer> {

	public List<Staff> findAll();
}
