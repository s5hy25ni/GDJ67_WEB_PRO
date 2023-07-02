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
	private SqlSession session = manager.openSession();
	
	@Override
	public List<Emp_DTO> getDeptList() {
		List<Emp_DTO> dto = session.selectList(NS+"dept_select");
		return dto;
	}
	
	@Override
	public List<Emp_DTO> emp_selectAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Emp_DTO> emp_search(String name) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Emp_DTO> emp_deptId_select(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Emp_DTO> emp_jobId_select(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
}