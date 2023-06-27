package com.test.pro;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import com.hr.pro.dto.Admin_DTO;
import com.hr.pro.model.AdminDaoImpl;
import com.hr.pro.model.IAdminDao;

public class Admin_JUnit_Test {

	private IAdminDao dao = new AdminDaoImpl();
	@Test
	public void test() {
		List<Admin_DTO> lists = dao.getAdminList();
		assertNotNull(lists);
	}

}
