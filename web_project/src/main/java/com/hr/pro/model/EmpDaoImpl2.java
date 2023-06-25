package com.hr.pro.model;

import java.util.List;

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

}
