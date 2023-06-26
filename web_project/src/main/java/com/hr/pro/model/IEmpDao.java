package com.hr.pro.model;

import java.util.List;

import com.hr.pro.dto.Emp_DTO;

public interface IEmpDao {
	public List<Emp_DTO> getDeptList();
}
