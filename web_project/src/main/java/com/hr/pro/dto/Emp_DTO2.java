package com.hr.pro.dto;

public class Emp_DTO2 {
	
	private int employee_id;
	private String first_name;
	private String last_name;
	private String hire_date;
	private String job_id;
	private int salary;
	private int department_id;
	private String manager_id;
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getHire_date() {
		return hire_date;
	}
	public void setHire_date(String hire_date) {
		this.hire_date = hire_date;
	}
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
	public int getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	@Override
	public String toString() {
		return "Emp_DTO2 [employee_id=" + employee_id + ", first_name=" + first_name + ", last_name=" + last_name
				+ ", hire_date=" + hire_date + ", job_id=" + job_id + ", salary=" + salary + ", department_id="
				+ department_id + ", manager_id=" + manager_id + "]";
	}
	
	
}
