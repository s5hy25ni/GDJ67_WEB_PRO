package com.hr.pro.model;

import java.util.List;

import com.hr.pro.dto.Emp_DTO2;

public interface IEmpDao2 {

	public List<Emp_DTO2> emp_avgSal_all();
	
	public List<Emp_DTO2> emp_avgSal_each(Emp_DTO2 dto);
	
}
