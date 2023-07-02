package com.hr.pro.model;

import java.util.List;
import java.util.Map;

import com.hr.pro.dto.Emp_DTO2;

public interface IEmpDao2 {
	//WP035
	public List<Emp_DTO2> emp_avgSal_all();
	
	public List<Emp_DTO2> emp_avgSal_each(Emp_DTO2 dto);
	
	//WP036
	public List<Emp_DTO2> emp_dept_details(Map<String, Object> map);
	//WP037
	public List<Emp_DTO2> emp_job_details(Map<String, Object> map);
	
}
