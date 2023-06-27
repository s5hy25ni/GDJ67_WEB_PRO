package com.hr.pro.ctrl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hr.pro.dto.Job2_DTO;
import com.hr.pro.model.IJob2Dao;
import com.hr.pro.model.Job2DaoImpl;

public class Controller_job extends HttpServlet {

	private static final long serialVersionUID = -6402202802237662582L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String jobIdSelect = req.getParameter("jobIdSelect");
		Map<String, Object> map = new HashMap<String, Object>();
		
		IJob2Dao dao = new Job2DaoImpl();
		
		//TODO WP018
		List<Job2_DTO> lists = dao.job_selectAll();
		req.setAttribute("lists018", lists);
		
		//TODO WP019		
		if (jobIdSelect != null && !jobIdSelect.isEmpty()) {
	        map.put("job_id", jobIdSelect);
	        List<Job2_DTO> lists1 = dao.job_id_select(map);
	        req.setAttribute("lists019", lists1);
	    }
		
		req.getRequestDispatcher("/job_summary.jsp").forward(req, resp);
	}
	
	
	

}
