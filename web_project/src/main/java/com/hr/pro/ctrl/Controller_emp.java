package com.hr.pro.ctrl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		String empIdClicked = req.getParameter("empIdClicked");
		
		List<Emp_DTO> lists001 = dao.emp_selectAll();
		req.setAttribute("lists001", lists001);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(empIdClicked != null && !empIdClicked.isEmpty()) {
			map.put("employee_id", empIdClicked);
			List<Emp_DTO> lists005 = dao.emp_empId_select(map);
			req.setAttribute("lists005", lists005);
			req.getRequestDispatcher("/WEB-INF/views/emp_details.jsp").forward(req, resp);
			return;
		}
		
		req.getRequestDispatcher("/WEB-INF/views/emp_summary.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String deptIdSelect = req.getParameter("deptIdSelect");
		String jobIdSelect = req.getParameter("jobIdSelect");
		String empNameSelect = req.getParameter("empNameSelect");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		IEmpDao dao = new EmpDaoImpl();
		
		List<Emp_DTO> lists001 = dao.emp_selectAll();
		req.setAttribute("lists001", lists001);
		
		//부서 아이디 클릭시 해당 정보
		if(deptIdSelect != null && !deptIdSelect.isEmpty()) {
			map.put("department_id", deptIdSelect);
			List<Emp_DTO> lists003 = dao.emp_deptId_select(map);
			req.setAttribute("lists003", lists003);
		}
		//직무 아이디 클릭시 해당 정보
		if(jobIdSelect != null && !jobIdSelect.isEmpty()) {
			map.put("job_id", jobIdSelect);
			List<Emp_DTO> lists004 = dao.emp_jobId_select(map);
			req.setAttribute("lists004", lists004);
		}
		
		if(empNameSelect != null && !empNameSelect.isEmpty()) {
			List<Emp_DTO> lists002 = dao.emp_search(empNameSelect);
			req.setAttribute("lists002", lists002);
		}
		req.getRequestDispatcher("/WEB-INF/views/emp_summary.jsp").forward(req, resp);
	}
}
