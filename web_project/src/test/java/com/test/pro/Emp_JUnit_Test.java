package com.test.pro;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import com.hr.pro.dto.Emp_DTO;
import com.hr.pro.model.EmpDaoImpl;
import com.hr.pro.model.IEmpDao;

public class Emp_JUnit_Test {

	private IEmpDao dao = new EmpDaoImpl();
	
	@Test
	public void test() {
//		Map<String, Object> mapDate = new HashMap<String, Object>();
//		mapDate.put("minDate", "2005-01-01");
//		mapDate.put("maxDate", "2007-01-01");
//		List<Emp_DTO> listsDate = dao.emp_date_select(mapDate);
//		assertNotNull(listsDate);
		
		Map<String, Object> mapSalary = new HashMap<String, Object>();
		mapSalary.put("minSalary", 1000);
		mapSalary.put("maxSalary", 3000);
		List<Emp_DTO> listsSalary = dao.emp_salary_select(mapSalary);
		assertNotNull(listsSalary);
	}

}