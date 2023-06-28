package com.test.pro;

import static org.junit.Assert.*;

import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import com.google.common.hash.Hashing;
import com.hr.pro.dto.Admin_DTO;
import com.hr.pro.model.AdminDaoImpl;
import com.hr.pro.model.IAdminDao;

public class Admin_JUnit_Test {

	private IAdminDao dao = new AdminDaoImpl();
	
	@Test
	public void test() {
		String password = "qwer";
		String hash = Hashing.sha256().hashString(password, StandardCharsets.UTF_8).toString();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("admin_id", "hyeon");
		map.put("admin_pw", hash);
		
//		List<Admin_DTO> lists = dao.getLoginUser(map);
//		assertNotNull(lists);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		String now = format.format(cal.getTime());
//		System.out.println(now);
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("last_login", now);
		map2.put("admin_id", "hyeon");
		
		boolean isc = dao.setLastLogin(map2);
		assertTrue(isc);

	}

}
