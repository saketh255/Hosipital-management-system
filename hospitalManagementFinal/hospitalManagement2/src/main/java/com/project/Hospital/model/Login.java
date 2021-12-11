package com.project.Hospital.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@Entity
public class Login {

	@Id
	/*@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "login_seq")
	@SequenceGenerator(name = "login_seq", sequenceName = "login_seq", initialValue = 2, allocationSize = 1)
	private Integer Id;*/
	private String username;
	private String password;
	private String siteName;
	
	public Login() {
		// TODO Auto-generated constructor stub
	}

	public Login(String username, String password, String siteName) {
		super();
		this.username = username;
		this.password = password;
		this.siteName = siteName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSiteName() {
		return siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	@Override
	public String toString() {
		return "Login [username=" + username + ", password=" + password + ", siteName=" + siteName + "]";
	}
	
	
	
}