package com.project.Hospital.DAO;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.project.Hospital.model.Prescription;

public interface PrescriptionDAO extends CrudRepository<Prescription, Integer> {

	public List<Prescription> findAll();

	public List<Prescription> findByiD(Integer Id);
	
	public List<Prescription> findByappointmentId(Integer appointmentId);
}
