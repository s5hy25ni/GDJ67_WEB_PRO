package com.test.pro;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import com.hr.pro.dto.Emp_DTO2;
import com.hr.pro.model.EmpDaoImpl2;
import com.hr.pro.model.IEmpDao2;

public class Emp_JUnit_Test2 {

	IEmpDao2 dao = new EmpDaoImpl2();
	
	@Test
	public void test() {
		String id = "IT_PROG";
		Emp_DTO2 dto = new Emp_DTO2();
//		List<Emp_DTO2> result = dao.emp_avgSal_all();
		dto.setJob_id(id);
		List<Emp_DTO2> result = dao.emp_avgSal_each(dto);
		assertNotNull(result);
	}

}
