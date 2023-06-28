package com.hr.pro.ctrl;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.common.hash.Hashing;
import com.hr.pro.dto.Admin_DTO;
import com.hr.pro.model.AdminDaoImpl;
import com.hr.pro.model.IAdminDao;

public class Controller_admin extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1866189441052531613L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("user_id");
		String pw = req.getParameter("user_pw");

		String pwHash = Hashing.sha256().hashString(pw, StandardCharsets.UTF_8).toString();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		String now = format.format(cal.getTime());
		
		Map<String, Object> loginUser = new HashMap<String, Object>();
		loginUser.put("admin_id", id);
		loginUser.put("admin_pw", pwHash);
		loginUser.put("last_login", now);
		
		IAdminDao dao = new AdminDaoImpl();
		List<Admin_DTO> loginSuccess = dao.getLoginUser(loginUser);
		
		HttpSession session = req.getSession();

		if(loginSuccess.size()!=0) {
			req.setAttribute("loginSuccess", "true");
			session.setAttribute("id", id);
			session.setAttribute("lastLogin", now);
			dao.setLastLogin(loginUser);
		} else {
			req.setAttribute("loginSuccess", "false");
		}
		
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}

}
