package com.project.Hospital.controller;

import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.Hospital.DAO.AppointmentDAO;
import com.project.Hospital.DAO.DoctorsDAO;
import com.project.Hospital.DAO.LoginDAO;
import com.project.Hospital.DAO.MedicinesDAO;
import com.project.Hospital.DAO.PatientsDAO;
import com.project.Hospital.DAO.PharmacistDAO;
import com.project.Hospital.DAO.PrescriptionDAO;
import com.project.Hospital.DAO.StaffDAO;
import com.project.Hospital.model.Appointment;
import com.project.Hospital.model.Doctors;
import com.project.Hospital.model.Login;
import com.project.Hospital.model.Medicines;
import com.project.Hospital.model.Patients;
import com.project.Hospital.model.Pharmacists;
import com.project.Hospital.model.Prescription;
import com.project.Hospital.model.Staff;

@Controller
public class DBController {

	@Autowired
	DoctorsDAO doctorDao;
	@Autowired
	PatientsDAO patientDao;
	@Autowired
	PrescriptionDAO prescriptionDao;
	@Autowired
	MedicinesDAO medicinesDao;
	@Autowired
	AppointmentDAO appointmentDao;
	@Autowired
	LoginDAO loginDao;
	@Autowired
	StaffDAO staffDao;
	@Autowired
	PharmacistDAO pharmacistDao;
	
	
	
	/**
	 * 
	 * @param username
	 * @return ModelAndView mv
	 * This will dispaly the webpage to book appointment for the patient.
	 */
	@RequestMapping("/bookAppointment")
	public ModelAndView bookAppointment(String username) {
		System.out.println("Username " + username);
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String min = now.format(formatter);
		String max = now.plusWeeks(1).format(formatter);
		ModelAndView mv = new ModelAndView("BookAppointment.jsp");
		List<Doctors> doctorList = doctorDao.findAll();
		mv.addObject("doctorList", doctorList);
		Patients p = patientDao.findByName(username);
		System.out.println("patient:" + p);
		mv.addObject("min",min);
		mv.addObject("max",max);
		mv.addObject("patient", p);
		mv.addObject("username", username);
		return mv;
	}
	
	/**
	 * 
	 * @param appointment
	 * @return ModelAndView mv
	 * This will add appointment details of the patient into the database.
	 */
	@RequestMapping("/addAppointment")
	public ModelAndView addAppointment(Appointment appointment) {
		appointment.setApplicationStatus(0);
		appointmentDao.save(appointment);
		Patients p = patientDao.findById(appointment.getPatientId()).orElse(new Patients());
		ModelAndView mv = new ModelAndView("/bookAppointment?username="+p.getName());
		mv.addObject("patient",p);
		mv.addObject("alert","Appointment booked successfully");
		List<Doctors> doctorList = doctorDao.findAll();
		mv.addObject("doctorList", doctorList);
		return mv;
	}
	
	
	/**
	 * 
	 * @param prescription
	 * @return ModelAndView mv
	 * This will return the webpage to add the prescription details of the patient.
	 */
	@RequestMapping("/addPrescription")
	public ModelAndView addPrescription(Prescription prescription) {
		System.out.println("entered addPrescription");
		prescription.setPrescriptiondate(LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		prescriptionDao.save(prescription);
		System.out.println("Saved: "+prescription);
		Appointment app = appointmentDao.findById(prescription.getAppointmentId()).orElse(new Appointment());
		Patients p = patientDao.findById(app.getPatientId()).orElse(new Patients());
		Doctors d = doctorDao.findById(app.getDoctorId()).orElse(new Doctors());
		ModelAndView mv = new ModelAndView("/consultation");
		mv.addObject("patient",p);
		mv.addObject("appointment",app);
		mv.addObject("doctor",d );
		List<Medicines> medicineList = medicinesDao.findAll();
		mv.addObject("list", medicineList);
		return mv;
	}
	
	
	
	/**
	 * 
	 * @param doctorId
	 * @param appointmentId
	 * @return ModelAndView mv
	 * 
	 * This will display the webpage with all the appointments the doctor has and he can select a specific apoointment to attend. It will remove the sppointment id of which he have attended.
	 */
	
	@RequestMapping("/currentAppointment")
	public ModelAndView currentAppointment(Integer doctorId, Integer appointmentId) {
		Doctors doc = doctorDao.findById(doctorId).orElse(new Doctors());
		Appointment app = appointmentDao.findById(appointmentId).orElse(new Appointment());
		app.setApplicationStatus(1);
		appointmentDao.save(app);
		ModelAndView mv = new ModelAndView("Appointments.jsp");
		List<Appointment> appointmentList2 = appointmentDao.findByDoctorId(doctorId);
		List<Appointment> appointmentList = new ArrayList<Appointment>();
		for(Appointment a : appointmentList2) {
			if((!a.getApplicationDate().equalsIgnoreCase(LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"))))||(a.getApplicationStatus()==1));
			else
				appointmentList.add(a);
			}
		mv.addObject("list", appointmentList);
		mv.addObject("username", doc.getName());
		return mv; 
	}
	
	
	
	

	@RequestMapping("/addDoctor")
	public ModelAndView addDoctor(Doctors doctor, Login login) {
		
		ModelAndView mv=new ModelAndView("/admin");
		int count=(loginDao.findAll().size()-1);
		for(int i=0; i<loginDao.findAll().size(); i++) {
			
			System.out.println("i= "+i);
			System.out.println("count = " + count);
		if(loginDao.findAll().get(i).getUsername().equals(doctor.getUname())) {
			System.out.println("Entered if loop");
			mv.addObject("alert", "Username already taken! Try again");
			
			break;
		}
		else {
			if(i==count) {
			System.out.println("entered else loop");
		doctorDao.save(doctor);
		Login login1 = new Login();
		
		login1.setUsername(doctor.getUname());
		login1.setPassword(doctor.getUname());
		login1.setSiteName("DoctorPortal.jsp");
		
		loginDao.save(login1);
		
		mv.addObject("alert", "Doctor added successfully");
		break;
			}
		}
	}
		return mv;
	}

	

	@RequestMapping("/removeDoctor")
	public ModelAndView removeDoctor(Integer doctorId) {
		ModelAndView mv = new ModelAndView("/admin");
		Doctors doc = doctorDao.findById(doctorId).orElse(new Doctors());
		Login login = loginDao.findByUsername(doc.getUname());
		doctorDao.delete(doc);
		loginDao.delete(login);
		mv.addObject("alert", "Doctor removed successfully");
		return mv;
	}
	
	@RequestMapping("/addPharmacist")
	public ModelAndView addPharmacist(Pharmacists pharmacist, Login login) {
		
		ModelAndView mv=new ModelAndView("/admin");
		int count=(loginDao.findAll().size()-1);
		for(int i=0; i<loginDao.findAll().size(); i++) {
			
		if(loginDao.findAll().get(i).getUsername().equals(pharmacist.getUname())) {
			System.out.println("Entered if loop");
			mv.addObject("alert", "Username already taken! Try again");
			
			break;
		}
		else {
			if(i==count) {
		pharmacistDao.save(pharmacist);
		Login login1 = new Login();
		
		login1.setUsername(pharmacist.getUname());
		login1.setPassword(pharmacist.getUname());
		login1.setSiteName("pharmacistPortal.jsp");
		
		loginDao.save(login1);
		
		mv.addObject("alert", "Pharmacist added successfully");
		break;
			}
		}
	}
		return mv;
	}

	

	@RequestMapping("/removePharmacist")
	public ModelAndView removePharmacist(Integer id) {
		ModelAndView mv = new ModelAndView("/admin");
		Pharmacists pharma = pharmacistDao.findById(id).orElse(new Pharmacists());
		Login login = loginDao.findByUsername(pharma.getUname());
		
		System.out.println("Pharmacist id : "+ id);
		System.out.println(pharma);
		System.out.println(login);
		
		pharmacistDao.delete(pharma);
		System.out.println("pharmacist removed from pharmacists entity");
		loginDao.delete(login);
		System.out.println("pharmacist removed from login entity");
		
		mv.addObject("alert", "Pharmacist removed successfully");
		return mv;
	}


	
	@RequestMapping("/addAdmin")
	public ModelAndView addAdmin(Login login) {
		ModelAndView mv = new ModelAndView("/admin");
		login.setSiteName("Admin.jsp");
		
		loginDao.save(login);
		
		return mv;
	}
	



	@RequestMapping("/addMedicine")
	public ModelAndView addMedicine(Medicines medicine) {
		medicinesDao.save(medicine);
		ModelAndView mv = new ModelAndView("pharmacistPortal.jsp");
		
		mv.addObject("alert", "Medicine added successfully");
		return mv;
	}

	@RequestMapping("/removeMedicine")
	public ModelAndView removeMedicine(Medicines medicine) {
		medicinesDao.delete(medicine);
		ModelAndView mv = new ModelAndView("pharmacistPortal.jsp");
		mv.addObject("alert", "medicine removed successfully");
		return mv;
	}

	@RequestMapping("/addStaff")
	public ModelAndView addStaff(Staff staff) {
		staffDao.save(staff);
		ModelAndView mv = new ModelAndView("/admin");
		mv.addObject("alert", "Staff added successfully");
		return mv;
	}

	@RequestMapping("/removeStaff")
	public ModelAndView removeStaff(Integer staffId) {
		Staff staff = staffDao.findById(staffId).orElse(new Staff());
		staffDao.delete(staff);
		ModelAndView mv = new ModelAndView("/admin");
		mv.addObject("alert", "Staff removed successfully");
		return mv;
	}
	
	
}
