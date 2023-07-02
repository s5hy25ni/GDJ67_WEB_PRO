package com.hr.pro.dto;

public class Admin_DTO {
	private String admin_id;
	private String admin_pw;
	private String last_login;
	
	public Admin_DTO() {
	}
	
	public Admin_DTO(String admin_id, String admin_pw, String last_login) {
		this.admin_id = admin_id;
		this.admin_pw = admin_pw;
		this.last_login = last_login;
	}

	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pw() {
		return admin_pw;
	}
	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}
	public String getLast_login() {
		return last_login;
	}
	public void setLast_login(String last_login) {
		this.last_login = last_login;
	}
	@Override
	public String toString() {
		return "Admin_DTO [admin_id=" + admin_id + ", admin_pw=" + admin_pw + ", last_login=" + last_login + "]";
	}
	
	
}
