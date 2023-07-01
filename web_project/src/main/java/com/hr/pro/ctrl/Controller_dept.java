package com.hr.pro.ctrl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		String deptIdClicked = req.getParameter("deptIdClicked");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		//TODO WP026
				List<Dept_DTO> lists = dao.dept_selectAll();
				req.setAttribute("lists026", lists);
				
		if(deptIdClicked != null && !deptIdClicked.isEmpty()) {
				map.put("department_id", deptIdClicked);
				List<Dept_DTO> lists3 = dao.dept_id_select(map);
				req.setAttribute("lists027", lists3);
				req.getRequestDispatcher("/dept_details.jsp").forward(req, resp);
				return;
			}
		req.getRequestDispatcher("/dept_summary.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String deptIdSelect = req.getParameter("deptIdSelect");
		String deptNameSelect = req.getParameter("deptNameSelect");
		String deptIdClicked = req.getParameter("deptIdClicked");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		IDeptDao dao = new DeptDaoImpl();
		
		List<Dept_DTO> lists = dao.dept_selectAll();
		req.setAttribute("lists026", lists);
		
		//TODO WP027
		if(deptIdSelect != null && !deptIdSelect.isEmpty()) {
			map.put("department_id", deptIdSelect);
			List<Dept_DTO> lists1 = dao.dept_id_select(map);
			req.setAttribute("lists027", lists1);
		}
			
		//TODO WP028
		if(deptNameSelect != null && !deptNameSelect.isEmpty()) {
			List<Dept_DTO> lists2 = dao.dept_search_name(deptNameSelect);
			req.setAttribute("lists028", lists2);
		}
		
		req.getRequestDispatcher("/dept_summary.jsp").forward(req, resp);
	}

}
