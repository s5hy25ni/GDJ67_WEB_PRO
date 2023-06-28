package com.hr.pro.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.hr.pro.dto.Admin_DTO;
import com.hr.pro.manager.SqlSessionFactoryManager;

public class AdminDaoImpl implements IAdminDao {
	
	private final String NS = "com.hr.pro.model.AdminDaoImpl.";
	private SqlSessionFactory manager = SqlSessionFactoryManager.getFactory();
	private SqlSession session = manager.openSession();
	
	@Override
	public List<Admin_DTO> getLoginUser(Map<String, Object> map) {
		List<Admin_DTO> dto = session.selectList(NS+"getloginUser", map);
		return dto;
	}
	
	@Override
	public boolean setLastLogin(Map<String, Object> map) {
		int result = session.update(NS+"setLastLogin", map);
		session.commit();
		return (result>0)?true:false;
	}
}
