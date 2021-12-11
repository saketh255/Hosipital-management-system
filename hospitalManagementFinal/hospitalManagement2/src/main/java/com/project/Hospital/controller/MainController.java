package com.project.Hospital.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.Hospital.DAO.AppointmentDAO;
import com.project.Hospital.DAO.DepartmentDAO;
import com.project.Hospital.DAO.DoctorsDAO;
import com.project.Hospital.DAO.LoginDAO;
import com.project.Hospital.DAO.MedicinesDAO;
import com.project.Hospital.DAO.PatientsDAO;
import com.project.Hospital.DAO.PharmacistDAO;
import com.project.Hospital.DAO.PrescriptionDAO;
import com.project.Hospital.DAO.StaffDAO;
import com.project.Hospital.model.Appointment;
import com.project.Hospital.model.Department;
import com.project.Hospital.model.Doctors;
import com.project.Hospital.model.Login;
import com.project.Hospital.model.Medicines;
import com.project.Hospital.model.Patients;
import com.project.Hospital.model.Pharmacists;
import com.project.Hospital.model.Prescription;
import com.project.Hospital.model.Staff;

@Controller
public class MainController {

	@Autowired
	DoctorsDAO doctorDao;
	@Autowired
	StaffDAO staffDao;
	@Autowired
	LoginDAO loginDao;
	@Autowired
	MedicinesDAO medicinesDao;
	@Autowired
	DepartmentDAO departmentDao;
	@Autowired
	PharmacistDAO pharmacistDao;
	@Autowired
	PatientsDAO patientDao;
	@Autowired
	PrescriptionDAO prescriptionDao;
	@Autowired
	AppointmentDAO appointmentDao;

	
	@RequestMapping("/home")
	public String home() {
		return "home.jsp";
	}

	@RequestMapping("/")
	public String home1() {
		return "home.jsp";
	}
	
	@RequestMapping("/admin")
	public ModelAndView admin() {
		ModelAndView mv = new ModelAndView("AdminPortal.jsp");
		List<Doctors> doctorList = doctorDao.findAll();
		List<Staff> staffList = staffDao.findAll();
		List<Patients> patientList = patientDao.findAll();
		List<Department> departmentList = departmentDao.findAll();
		List<Pharmacists> pharmacistList = pharmacistDao.findAll();
		mv.addObject("doctorList", doctorList);
		mv.addObject("staffList", staffList);
		mv.addObject("patientList", patientList);
		mv.addObject("departmentList",departmentList);
		mv.addObject("pharmacistList", pharmacistList);
		return mv;
	}

	@RequestMapping("/StaffPortal")
	public ModelAndView Patients() {
	ModelAndView mv = new ModelAndView("staffPortal.jsp");
	List<Patients> patientList = patientDao.findAll();
	mv.addObject("patientList", patientList);
	System.out.println("mv" + mv);
	System.out.println("patients: " + patientList);
	return mv;
	}


	@RequestMapping("/pharmacistPortal")
	public ModelAndView pharmacistPortal(){
		ModelAndView mv = new ModelAndView("pharmacistPortal1.jsp");
		List<Medicines> medicines = medicinesDao.findAll();
		for (Medicines m : medicines) {
			System.out.println(m);
		}
		mv.addObject("list", medicines);
		return mv;
	}
	
	@RequestMapping("/addPatient")
	public ModelAndView addPatient(Patients patient) {
		patientDao.save(patient);
		List<Patients> patientList = patientDao.findAll();
		ModelAndView mv = new ModelAndView("staffPortal.jsp");
		mv.addObject("patientList", patientList);
		mv.addObject("alert", "Patient added successfully");
		return mv;
	}

	/**
	 * 
	 * @param username
	 * @return ModelAndView mv
	 * This will return the appointments webpage with all the appointments the doctor has to attend.
	 */
	@RequestMapping("/appointmentList")
	public ModelAndView appointmentList(String username) {
		System.out.println("This function is working");
		System.out.println(username);
		ModelAndView mv = new ModelAndView("Appointments.jsp");
		Doctors doc = doctorDao.findByUname(username);
		System.out.println("The doctor : " + doc);
		List<Appointment> appointmentList2 = appointmentDao.findByDoctorId(doc.getDoctorId());
		List<Appointment> appointmentList = new ArrayList<Appointment>();
		for(Appointment a : appointmentList2) {
			if((!a.getApplicationDate().equalsIgnoreCase(LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"))))||(a.getApplicationStatus()==1));
			else
				appointmentList.add(a);
			}
		mv.addObject("list", appointmentList);
		mv.addObject("username", username);
		return mv;
	}
	
	
	/**
	 * 
	 * @param appointmentId
	 * @return ModelAndView mv
	 * This will return the current appointment webpage with the appointment details and patient details of the patient.
	 */
	@RequestMapping("/consultation")
	public ModelAndView consultation(Integer appointmentId) {
		Appointment app = appointmentDao.findById(appointmentId).orElse(new Appointment());
		Patients p = patientDao.findById(app.getPatientId()).orElse(new Patients());
		Doctors d = doctorDao.findById(app.getDoctorId()).orElse(new Doctors());
		ModelAndView mv = new ModelAndView("consultation.jsp");
		mv.addObject("patient",p);
		mv.addObject("appointment",app);
		mv.addObject("doctor", d);
		List<Medicines> medicineList = medicinesDao.findAll();
		mv.addObject("list", medicineList);
		return mv;
	}
	
	
	@RequestMapping("/generatePrescription")
	public ModelAndView generatePrescription(Integer AppointmentId) {
		System.out.println("Appointment id : " + AppointmentId);
		ModelAndView mv = new ModelAndView("prescription.jsp");
		List<Prescription> prescriptionList = prescriptionDao.findByappointmentId(AppointmentId);
		Patients p = patientDao.findByName(prescriptionList.get(0).getPatient());
		Appointment app = appointmentDao.findById(prescriptionList.get(0).getAppointmentId()).orElse(new Appointment());
		String doctor = prescriptionList.get(0).getDoctor();
		String PrescriptionDate = prescriptionList.get(0).getPrescriptiondate();
		System.out.println("Prescription list : "+prescriptionList);
		mv.addObject("prescriptionList", prescriptionList);
		mv.addObject("patient", p);
		mv.addObject("doctor", doctor);
		mv.addObject("date", PrescriptionDate);
		mv.addObject("appointment",app);
		return mv;
	}
	


}
