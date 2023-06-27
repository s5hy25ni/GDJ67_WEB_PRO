package com.hr.pro.ctrl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("user_id");
		
	}

}
