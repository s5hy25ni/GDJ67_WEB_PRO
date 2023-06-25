package com.test.pro;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import com.hr.pro.dto.Dept_DTO;
import com.hr.pro.model.DeptDaoImpl;
import com.hr.pro.model.IDeptDao;

public class Dept_JUnit_Test {
	
	private IDeptDao dao = new DeptDaoImpl();

//	@Test
	public void dept_select() {
		Dept_DTO dto = new Dept_DTO();
		List<Dept_DTO> lists = dao.dept_selectAll();
//		List<Dept_DTO> lists = dao.dept_id_drop();
//		dto.setDepartment_name("s");
//		List<Dept_DTO> lists = dao.dept_search_name(dto);
//		List<Dept_DTO> lists = dao.dept_managerId_drop();
//		List<Dept_DTO> lists = dao.dept_empManagerId_drop();
		assertNotNull(lists);
	}
	
//	@Test
	public void dept_update() {
		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("new_name", "IT");
//		map.put("old_name", "TI");
//		boolean isc = dao.dept_update_name(map);
//		map.put("new_id", 100);
		map.put("old_id", 777);
		boolean isc = dao.dept_update_managerId(map);
//		int n = dao.dept_update_empManagerId(map);
		assertTrue(isc);
//		assertNotNull(n);
	}
	
//	@Test
	public void dept_delete() {
		int id = 280;
		Dept_DTO dto = new Dept_DTO();
		dto.setDepartment_id(id);
		boolean isc = dao.dept_delete(dto);
//		int result = dao.dept_delete_empDeptId(dto);
		assertTrue(isc);
//		assertNotNull(result);
	}
	
	@Test
	public void dept_insert() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("department_id", 60);
		map.put("department_name", "IT");
		map.put("manager_id", 103);
//		int n = dao.dept_insert_idName(map);
//		assertEquals(1, n);
		boolean isc = dao.dept_insert_managerId(map);
		int result = dao.dept_insert_empManagerId(map);
		assertTrue(isc);
		
	}

}
