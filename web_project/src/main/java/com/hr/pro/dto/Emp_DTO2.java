package com.hr.pro.dto;

public class Emp_DTO2 {
	
	private String job_id;
	private int salary;
	public String getJob_id() {
		return job_id;
	}
	public void setJob_id(String job_id) {
		this.job_id = job_id;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	@Override
	public String toString() {
		return "Emp_DTO2 [job_id=" + job_id + ", salary=" + salary + "]";
	}
	
	
}
