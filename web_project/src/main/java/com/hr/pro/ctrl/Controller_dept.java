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
import com.hr.pro.dto.Emp_DTO2;
import com.hr.pro.model.DeptDaoImpl;
import com.hr.pro.model.EmpDaoImpl2;
import com.hr.pro.model.IDeptDao;
import com.hr.pro.model.IEmpDao2;

public class Controller_dept extends HttpServlet {

	private static final long serialVersionUID = 1889639480071972938L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IDeptDao dao = new DeptDaoImpl();
		IEmpDao2 dao2 = new EmpDaoImpl2();
		String deptIdClicked = req.getParameter("deptIdClicked");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		//TODO WP026
				List<Dept_DTO> lists026 = dao.dept_selectAll();
				req.setAttribute("lists026", lists026);
				
		if(deptIdClicked != null && !deptIdClicked.isEmpty()) {
				map.put("department_id", deptIdClicked);
				List<Dept_DTO> lists3 = dao.dept_id_select(map);
				List<Emp_DTO2> lists4 = dao2.emp_dept_details(map);
				req.setAttribute("lists027", lists3);
				req.setAttribute("lists036", lists4);
				req.getRequestDispatcher("/WEB-INF/views/dept_details.jsp").forward(req, resp);
				return;
			}
		
		req.getRequestDispatcher("/WEB-INF/views/dept_summary.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String deptIdSelect = req.getParameter("deptIdSelect");
		String deptNameSelect = req.getParameter("deptNameSelect");
		
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
		
		req.getRequestDispatcher("/WEB-INF/views/dept_summary.jsp").forward(req, resp);
	}

}
