package com.hr.pro.ctrl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hr.pro.dto.Dept_DTO;
import com.hr.pro.dto.Emp_DTO2;
import com.hr.pro.dto.Job2_DTO;
import com.hr.pro.model.EmpDaoImpl2;
import com.hr.pro.model.IEmpDao2;
import com.hr.pro.model.IJob2Dao;
import com.hr.pro.model.Job2DaoImpl;

public class Controller_job extends HttpServlet {

	private static final long serialVersionUID = -6402202802237662582L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IJob2Dao dao = new Job2DaoImpl();
		IEmpDao2 dao2 = new EmpDaoImpl2();
		String jobIdClicked = req.getParameter("jobIdClicked");
		Map<String, Object> map = new HashMap<String, Object>();
		
		//TODO WP018
		List<Job2_DTO> lists = dao.job_selectAll();
		req.setAttribute("lists018", lists);
		
		if(jobIdClicked != null && !jobIdClicked.isEmpty()) {
			map.put("job_id", jobIdClicked);
			List<Job2_DTO> lists3 = dao.job_id_select(map);
			List<Emp_DTO2> lists4 = dao2.emp_job_details(map);
			req.setAttribute("lists019", lists3);
			req.setAttribute("lists037", lists4);
			req.getRequestDispatcher("/WEB-INF/views/job_details.jsp").forward(req, resp);
			return;
		}
		
		req.getRequestDispatcher("/WEB-INF/views/job_summary.jsp").forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String jobIdSelect = req.getParameter("jobIdSelect");
		String jobTitleSelect = req.getParameter("jobTitleSelect");
		Map<String, Object> map = new HashMap<String, Object>();
		
		IJob2Dao dao = new Job2DaoImpl();
		
		List<Job2_DTO> lists = dao.job_selectAll();
		req.setAttribute("lists018", lists);
		
		//TODO WP019		
				if (jobIdSelect != null && !jobIdSelect.isEmpty()) {
			        map.put("job_id", jobIdSelect);
			        List<Job2_DTO> lists1 = dao.job_id_select(map);
			        req.setAttribute("lists019", lists1);
			    }
		//TODO WP020
			if(jobTitleSelect != null && !jobTitleSelect.isEmpty()) {
					List<Job2_DTO> lists2 = dao.job_search_name(jobTitleSelect);
					req.setAttribute("lists020", lists2);
				}
				
				
		req.getRequestDispatcher("/WEB-INF/views/job_summary.jsp").forward(req, resp);
		
	}
	

}








