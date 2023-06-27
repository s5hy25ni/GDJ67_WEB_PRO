package com.test.pro;

import static org.junit.Assert.*;

import java.nio.charset.StandardCharsets;
import java.util.List;

import org.junit.Test;

import com.google.common.hash.Hashing;
import com.hr.pro.dto.Admin_DTO;
import com.hr.pro.model.AdminDaoImpl;
import com.hr.pro.model.IAdminDao;

public class Admin_JUnit_Test {

	private IAdminDao dao = new AdminDaoImpl();
	@Test
	public void test() {
//		List<Admin_DTO> lists = dao.getAdminList();
//		assertNotNull(lists);
		
		
		String password1 = "1234";
		String password2 = "qwer";
		String hash1 = Hashing.sha256().hashString(password1, StandardCharsets.UTF_8).toString();
		System.out.println(hash1);
		String hash2 = Hashing.sha256().hashString(password2, StandardCharsets.UTF_8).toString();
		System.out.println(hash2);
	}

}
