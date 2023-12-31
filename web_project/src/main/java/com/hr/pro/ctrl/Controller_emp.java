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
import com.hr.pro.dto.Emp_DTO;
import com.hr.pro.dto.Job2_DTO;
import com.hr.pro.model.DeptDaoImpl;
import com.hr.pro.model.EmpDaoImpl;
import com.hr.pro.model.IDeptDao;
import com.hr.pro.model.IEmpDao;
import com.hr.pro.model.IJob2Dao;
import com.hr.pro.model.Job2DaoImpl;

public class Controller_emp extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1929203393897751112L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IEmpDao dao = new EmpDaoImpl();
		IDeptDao deptDao = new DeptDaoImpl();
		IJob2Dao jobDao = new Job2DaoImpl();
		
		String empIdClicked = req.getParameter("empIdClicked");
		
		List<Emp_DTO> lists001 = dao.emp_selectAll();
		req.setAttribute("lists001", lists001);
		
		List<Dept_DTO> dept = deptDao.dept_selectAll();
		req.setAttribute("deptAll", dept);
		
		List<Job2_DTO> job = jobDao.job_selectAll();
		req.setAttribute("jobAll", job);
		
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
		String minDate = req.getParameter("minDate");
		String maxDate = req.getParameter("maxDate");
		String minSalary = req.getParameter("minSalary");
		String maxSalary = req.getParameter("maxSalary");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		IEmpDao dao = new EmpDaoImpl();
		IDeptDao deptDao = new DeptDaoImpl();
		IJob2Dao jobDao = new Job2DaoImpl();
		
		List<Emp_DTO> lists001 = dao.emp_selectAll();
		req.setAttribute("lists001", lists001);
		
		List<Dept_DTO> dept = deptDao.dept_selectAll();
		req.setAttribute("deptAll", dept);
		
		List<Job2_DTO> job = jobDao.job_selectAll();
		req.setAttribute("jobAll", job);
		
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
		
		if(minDate != null && maxDate != null && !minDate.isEmpty() && !maxDate.isEmpty()) {
			Map<String, Object> mapDate = new HashMap<String, Object>();
			mapDate.put("minDate", minDate);
			mapDate.put("maxDate", maxDate);
			List<Emp_DTO> lists006 = dao.emp_date_select(mapDate);
			req.setAttribute("lists006", lists006);
		}
		
		if(minSalary != null && maxSalary != null && !minSalary.isEmpty() && !maxSalary.isEmpty()) {
			Map<String, Object> mapSalary = new HashMap<String, Object>();
			mapSalary.put("minSalary", minSalary);
			mapSalary.put("maxSalary", maxSalary);
			List<Emp_DTO> lists007 = dao.emp_salary_select(mapSalary);
			req.setAttribute("lists007", lists007);
		}
		
		req.getRequestDispatcher("/WEB-INF/views/emp_summary.jsp").forward(req, resp);
	}
}
