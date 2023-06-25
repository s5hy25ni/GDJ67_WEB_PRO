package com.hr.pro.ctrl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hr.pro.dto.Dept_DTO;
import com.hr.pro.model.DeptDaoImpl;
import com.hr.pro.model.IDeptDao;

public class Controller_dept extends HttpServlet {

	private static final long serialVersionUID = 1889639480071972938L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IDeptDao dao = new DeptDaoImpl();
		
		//TODO WP026
				List<Dept_DTO> lists = dao.dept_selectAll();
				req.setAttribute("list026", lists);
				
				req.getRequestDispatcher("/index2.jsp").forward(req, resp);
	}

}
