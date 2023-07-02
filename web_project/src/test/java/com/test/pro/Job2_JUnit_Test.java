package com.test.pro;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;

import com.hr.pro.dto.Job2_DTO;
import com.hr.pro.manager.SqlSessionFactoryManager;
import com.hr.pro.model.IJob2Dao;
import com.hr.pro.model.Job2DaoImpl;

public class Job2_JUnit_Test {

	private IJob2Dao dao = new Job2DaoImpl();
	
	@Test
	public void job_select() {
		List<Job2_DTO> lists = dao.job_selectAll();
//		List<Job2_DTO> lists = dao.job_id_drop();
//		List<Job2_DTO> lists = dao.job_title_drop();	
		assertNotNull(lists);
	}
	
//	@Test
	public void job_search_name() {
		String jobName = "S";
		Job2_DTO dto = new Job2_DTO();
		dto.setJob_title(jobName);
//		List<Job2_DTO> lists = dao.job_search_name(dto);
//		assertNotNull(lists);		
	}
	
//	@Test
	public void job_update() {
		Map<String, Object> map = new HashMap<String, Object>();
		Job2_DTO dto = new Job2_DTO();
//		map.put("newJob_id", "IT_FROG");
//		map.put("oldJob_id", "IT_PROG");
//		int n = dao.job_update_id(map);
//		int m = dao.job_update_empJobId(map);
//		assertEquals(1, n);
//		assertNotNull(m);
//		map.put("newJob_title", "Programmer");
//		map.put("oldJob_title", "Frogrammer");
//		boolean isc = dao.job_update_title(map);
//		assertTrue(isc);
		map.put("min_salary", 4000);
		map.put("max_salary", 10000);
		map.put("job_id", "IT_PROG");
		boolean isc1 = dao.job_update_minSal(map);
		boolean isc2 = dao.job_update_maxSal(map);
		assertTrue(isc1);
		assertTrue(isc2);
	}
	
	@Test
	public void job_delete(){
		String job_id = "FROG";
		Job2_DTO dto = new Job2_DTO();
		dto.setJob_id(job_id);
		int result1 = dao.job_delete(dto);
		int result2 = dao.job_delete_empJobId(dto);
		assertEquals(1, result1);
		assertNotNull(result2);
	}
	
//	@Test
	public void job_insert() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("job_id", "FROG");
		map.put("job_title", "frogrammer");
		map.put("min_salary", 1000);
		map.put("max_salary", 3000);
		boolean isc = dao.job_insert(map);
		assertTrue(isc);
	}
	
	
	
	
	

}
