package com.hr.pro.ctrl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
		String selectedJobId = req.getParameter("selectedJobId");
		
		IJob2Dao dao = new Job2DaoImpl();
		
		//TODO WP018
		List<Job2_DTO> lists = dao.job_selectAll();
		req.setAttribute("lists018", lists);
		
		if(selectedJobId != null && !selectedJobId.equals("all")) {
			List<Job2_DTO> filteredLists = filterByJobId(lists, selectedJobId);
	        req.setAttribute("filteredLists", filteredLists);
		}
		
		req.getRequestDispatcher("/job_summary.jsp").forward(req, resp);
	}
	
	private List<Job2_DTO> filterByJobId(List<Job2_DTO> lists, String selectedJobId) {
	    List<Job2_DTO> filteredLists = new ArrayList<Job2_DTO>();
	    for (Job2_DTO job : lists) {
	        if (job.getJob_id().equals(selectedJobId)) {
	            filteredLists.add(job);
	        }
	    }
	    return filteredLists;
	}
	

}
