package com.hr.pro.model;

import java.util.List;
import java.util.Map;

import com.hr.pro.dto.Emp_DTO;

public interface IEmpDao {
	public List<Emp_DTO> getDeptList();
	
	public List<Emp_DTO> emp_selectAll();
	
	public List<Emp_DTO> emp_search(String name);
	
	public List<Emp_DTO> emp_deptId_select(Map<String, Object> map);
	
	public List<Emp_DTO> emp_jobId_select(Map<String, Object> map);
	
	public List<Emp_DTO> emp_empId_select(Map<String, Object> map);
}
