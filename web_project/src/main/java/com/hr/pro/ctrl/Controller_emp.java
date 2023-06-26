package com.hr.pro.ctrl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hr.pro.dto.Emp_DTO;
import com.hr.pro.model.EmpDaoImpl;
import com.hr.pro.model.IEmpDao;

public class Controller_emp extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1929203393897751112L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		IEmpDao dao = new EmpDaoImpl();
		
		List<Emp_DTO> lists = dao.getDeptList();
		req.setAttribute("deptSel", lists);
		
		req.getRequestDispatcher("/emp_details.jsp").forward(req, resp);
	}
}
