package com.project.Hospital.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;



@Entity
public class Appointment {

	@Id 
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "appointment_seq")
	@SequenceGenerator(name = "appointment_seq", sequenceName = "appointment_seq", allocationSize = 1)
	private Integer applicationId;
	private Integer doctorId;
	private String applicationDate;
	private String applicationTime;
	private Integer patientId;
	private Integer applicationStatus;
	
	public Appointment(Integer applicationId, Integer doctorId, String applicationDate, String applicationTime,
			Integer patientId, Integer applicationStatus) {
		super();
		this.applicationId = applicationId;
		this.doctorId = doctorId;
		this.applicationDate = applicationDate;
		this.applicationTime = applicationTime;
		this.patientId = patientId;
		this.applicationStatus = applicationStatus;
	}
	public Appointment() {
		super();
	}
	public Integer getApplicationId() {
		return applicationId;
	}
	public void setApplicationId(Integer applicationId) {
		this.applicationId = applicationId;
	}
	public Integer getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(Integer doctorId) {
		this.doctorId = doctorId;
	}
	public String getApplicationDate() {
		return applicationDate;
	}
	public void setApplicationDate(String applicationDate) {
		this.applicationDate = applicationDate;
	}
	public String getApplicationTime() {
		return applicationTime;
	}
	public void setApplicationTime(String applicationTime) {
		this.applicationTime = applicationTime;
	}
	public Integer getPatientId() {
		return patientId;
	}
	public void setPatientId(Integer patientId) {
		this.patientId = patientId;
	}
	public Integer getApplicationStatus() {
		return applicationStatus;
	}
	public void setApplicationStatus(Integer applicationStatus) {
		this.applicationStatus = applicationStatus;
	}
	@Override
	public String toString() {
		return "Appointment [applicationId=" + applicationId + ", doctorId=" + doctorId + ", applicationDate="
				+ applicationDate + ", applicationTime=" + applicationTime + ", patientId=" + patientId
				+ ", applicationStatus=" + applicationStatus + "]";
	}

	
}
