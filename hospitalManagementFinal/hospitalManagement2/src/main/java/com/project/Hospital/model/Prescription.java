package com.project.Hospital.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class Prescription {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "prescription_seq")
	@SequenceGenerator(name = "prescription_seq", sequenceName = "prescription_seq", allocationSize = 1)
	private Integer iD;
	private String patient;
	private String doctor;
	private String medicine;
	private String prescriptiondate;
	private Integer quantity;
	private Integer appointmentId;
	private String notes;
	
	public Prescription() {
		// TODO Auto-generated constructor stub
	}

	public Prescription(Integer iD, String patient, String doctor, String medicine, String prescriptiondate,
			Integer quantity, Integer appointmentId, String notes) {
		super();
		this.iD = iD;
		this.patient = patient;
		this.doctor = doctor;
		this.medicine = medicine;
		this.prescriptiondate = prescriptiondate;
		this.quantity = quantity;
		this.appointmentId = appointmentId;
		this.notes = notes;
	}

	public Integer getiD() {
		return iD;
	}

	public void setiD(Integer iD) {
		this.iD = iD;
	}

	public String getPatient() {
		return patient;
	}

	public void setPatient(String patient) {
		this.patient = patient;
	}

	public String getDoctor() {
		return doctor;
	}

	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}

	public String getMedicine() {
		return medicine;
	}

	public void setMedicine(String medicine) {
		this.medicine = medicine;
	}

	public String getPrescriptiondate() {
		return prescriptiondate;
	}

	public void setPrescriptiondate(String prescriptiondate) {
		this.prescriptiondate = prescriptiondate;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getAppointmentId() {
		return appointmentId;
	}

	public void setAppointmentId(Integer appointmentId) {
		this.appointmentId = appointmentId;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	@Override
	public String toString() {
		return "Prescription [iD=" + iD + ", patient=" + patient + ", doctor=" + doctor + ", medicine=" + medicine
				+ ", prescriptiondate=" + prescriptiondate + ", quantity=" + quantity + ", appointmentId="
				+ appointmentId + ", notes=" + notes + "]";
	}

	
}