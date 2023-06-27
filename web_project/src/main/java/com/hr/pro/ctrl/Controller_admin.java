package com.hr.pro.ctrl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hr.pro.dto.Admin_DTO;
import com.hr.pro.model.AdminDaoImpl;
import com.hr.pro.model.IAdminDao;

public class Controller_admin extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1866189441052531613L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IAdminDao dao = new AdminDaoImpl();
		
		List<Admin_DTO> lists = dao.getAdminList();
		req.setAttribute("adminList", lists);
		
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}

}
