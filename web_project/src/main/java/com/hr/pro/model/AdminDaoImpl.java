package com.hr.pro.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.hr.pro.dto.Admin_DTO;
import com.hr.pro.manager.SqlSessionFactoryManager;

public class AdminDaoImpl implements IAdminDao {
	
	private final String NS = "com.hr.pro.model.AdminDaoImpl.";
	private SqlSessionFactory manager = SqlSessionFactoryManager.getFactory();
	private SqlSession session = manager.openSession();
	
	@Override
	public List<Admin_DTO> getAdminList() {
		List<Admin_DTO> dto = session.selectList(NS+"admin_select");
		return dto;
	}
}
