package com.hr.pro.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.hr.pro.dto.Emp_DTO;
import com.hr.pro.manager.SqlSessionFactoryManager;

public class EmpDaoImpl implements IEmpDao {
	private final String NS = "com.hr.pro.model.EmpDaoImpl.";
	private SqlSessionFactory manager = SqlSessionFactoryManager.getFactory();
	
	@Override
	public List<Emp_DTO> getDeptList() {
		SqlSession session = manager.openSession();
		List<Emp_DTO> dto = session.selectList(NS+"dept_select");
		return dto;
	}
	
	@Override
	public List<Emp_DTO> emp_selectAll() {
		SqlSession session = manager.openSession();
		List<Emp_DTO> result = session.selectList(NS+"emp_selectAll");
		return result;
	}
	
	@Override
	public List<Emp_DTO> emp_search(String name) {
		SqlSession session = manager.openSession();
		List<Emp_DTO> result = session.selectList(NS+"emp_search", name);
		return result;
	}
	
	@Override
	public List<Emp_DTO> emp_deptId_select(Map<String, Object> map) {
		SqlSession session = manager.openSession();
		List<Emp_DTO> result = session.selectList(NS+"emp_deptId_select", map);
		return result;
	}
	
	@Override
	public List<Emp_DTO> emp_jobId_select(Map<String, Object> map) {
		SqlSession session = manager.openSession();
		List<Emp_DTO> result = session.selectList(NS+"emp_jobId_select", map);
		return result;
	}
	@Override
	public List<Emp_DTO> emp_empId_select(Map<String, Object> map) {
		SqlSession session = manager.openSession();
		List<Emp_DTO> result = session.selectList(NS+"emp_empId_select", map);
		return result;
	}
}