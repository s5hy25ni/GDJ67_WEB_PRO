package com.hr.pro.ctrl;

import java.io.IOException;
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
		
		IJob2Dao dao = new Job2DaoImpl();
		
		//TODO WP018
		List<Job2_DTO> lists = dao.job_selectAll();
		req.setAttribute("lists018", lists);
		
		req.getRequestDispatcher("/job_summary.jsp").forward(req, resp);
	}

}
