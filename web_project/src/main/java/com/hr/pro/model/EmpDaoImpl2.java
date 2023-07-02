package com.hr.pro.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.hr.pro.dto.Emp_DTO2;
import com.hr.pro.manager.SqlSessionFactoryManager;

public class EmpDaoImpl2 implements IEmpDao2 {

	private final String NS = "com.hr.pro.model.EmpDaoImpl2.";
	private SqlSessionFactory manager = SqlSessionFactoryManager.getFactory();
	
	@Override
	public List<Emp_DTO2> emp_avgSal_all() {
		SqlSession session = manager.openSession();
		List<Emp_DTO2> result = session.selectList(NS+"emp_avgSal_all");
		return result;
	}

	@Override
	public List<Emp_DTO2> emp_avgSal_each(Emp_DTO2 dto) {
		SqlSession session = manager.openSession();
		List<Emp_DTO2> result = session.selectList(NS+"emp_avgSal_each", dto);
		return result;
	}
	
	@Override
	public List<Emp_DTO2> emp_dept_details(Map<String, Object> map) {
		SqlSession session = manager.openSession();
		List<Emp_DTO2> result = session.selectList(NS+"emp_dept_details", map);
		return result;
	}
	
	@Override
	public List<Emp_DTO2> emp_job_details(Map<String, Object> map) {
		SqlSession session = manager.openSession();
		List<Emp_DTO2> result = session.selectList(NS+"emp_job_details", map);
		return result;
	}

}
