package com.hr.pro.model;

import java.util.List;

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
}