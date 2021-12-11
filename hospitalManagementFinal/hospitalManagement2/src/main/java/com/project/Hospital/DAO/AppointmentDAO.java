package com.project.Hospital.DAO;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.project.Hospital.model.Appointment;

public interface AppointmentDAO extends CrudRepository<Appointment, Integer>{
	
	public List<Appointment> findAll();
	public List<Appointment> findByDoctorId(Integer doctorId);

}
