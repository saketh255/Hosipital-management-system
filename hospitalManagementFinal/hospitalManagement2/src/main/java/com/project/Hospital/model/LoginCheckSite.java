package com.project.Hospital.model;

public class LoginCheckSite {

	private String siteName;

	public LoginCheckSite(String siteName) {
		super();
		this.siteName = siteName;
	}

	public LoginCheckSite() {
		super();
	}

	public String getSiteName() {
		return siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	@Override
	public String toString() {
		return "LoginCheckSite [siteName=" + siteName + "]";
	}

}
