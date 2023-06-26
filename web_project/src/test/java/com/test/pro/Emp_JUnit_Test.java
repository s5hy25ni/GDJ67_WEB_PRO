package com.test.pro;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import com.hr.pro.dto.Emp_DTO;
import com.hr.pro.model.EmpDaoImpl;
import com.hr.pro.model.IEmpDao;

public class Emp_JUnit_Test {

	private IEmpDao dao = new EmpDaoImpl();
	
	@Test
	public void test() {
		List<Emp_DTO> lists = dao.getDeptList();
		assertNotNull(lists);
	}

}