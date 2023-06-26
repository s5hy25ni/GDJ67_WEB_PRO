package com.hr.pro.dto;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
@NoArgsConstructor
public class Emp_DTO {
	private int employee_id;
	private String first_name;
	private String last_name;
	private String hire_date;
	private String job_id;
	private int salary;
	private int department_id;
	private String department_name;
}
