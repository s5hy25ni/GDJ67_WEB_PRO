package com.hr.pro.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.hr.pro.dto.Job2_DTO;
import com.hr.pro.manager.SqlSessionFactoryManager;

public class Job2DaoImpl implements IJob2Dao {

	private Logger logger = Logger.getLogger(Job2DaoImpl.class);
	private final String NS = "com.hr.pro.model.Job2DaoImpl.";
	private SqlSessionFactory manager = SqlSessionFactoryManager.getFactory();
	
	@Override //WP018
	public List<Job2_DTO> job_selectAll() {
		SqlSession session = manager.openSession();
		List<Job2_DTO> resultDto = session.selectList(NS+"job_selectAll");
		return resultDto;
	}

	@Override //WP019
	public List<Job2_DTO> job_id_select(Map<String, Object> map) {
		SqlSession session = manager.openSession();
		List<Job2_DTO> resultDto = session.selectList(NS+"job_id_select");
		return resultDto;
	}

	@Override //WP020
	public List<Job2_DTO> job_search_name(Job2_DTO dto) {
		SqlSession session = manager.openSession();
		List<Job2_DTO> resultDto = session.selectList(NS+"job_search_name", dto);
		return resultDto;
	}

	@Override //WP021
	public int job_update_id(Map<String, Object> map) {
		SqlSession session = manager.openSession(true);
		int n = session.update(NS+"job_update_id", map);
		return n;
	}

	@Override //WP021
	public int job_update_empJobId(Map<String, Object> map) {
		SqlSession session = manager.openSession(true);
		int n = session.update(NS+"job_update_empJobId", map);
		return n;
	}

	@Override //WP022
	public List<Job2_DTO> job_title_drop() {
		SqlSession session = manager.openSession();
		List<Job2_DTO> resultDto = session.selectList(NS+"job_title_drop");
		return resultDto;
	}

	@Override //WP022
	public boolean job_update_title(Map<String, Object> map) {
		SqlSession session = manager.openSession(true);
		int n = session.update(NS+"job_update_title", map);
		return (n>0)? true:false;
	}

	@Override //WP023
	public boolean job_update_minSal(Map<String, Object> map) {
		SqlSession session = manager.openSession(true);
		int n = session.update(NS+"job_update_minSal", map);
		return (n>0)? true:false;
	}

	@Override //WP023
	public boolean job_update_maxSal(Map<String, Object> map) {
		SqlSession session = manager.openSession(true);
		int n = session.update(NS+"job_update_maxSal", map);
		return (n>0)? true:false;
	}

	@Override //WP024
	public int job_delete(Job2_DTO dto) {
		SqlSession session = manager.openSession(true);
		int n = session.delete(NS+"job_delete", dto);
		return n;
	}

	@Override //WP024
	public int job_delete_empJobId(Job2_DTO dto) {
		SqlSession session = manager.openSession(true);
		int n = session.update(NS+"job_delete_empJobId", dto);
		return n;
	}

	@Override //WP025
	public boolean job_insert(Map<String, Object> map) {
		SqlSession session = manager.openSession(true);
		int n = session.insert(NS+"job_insert", map);
		return (n>0)?true:false;
	}

	
}
