package com.hr.pro.ctrl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.hr.pro.dto.Dept_DTO;
import com.hr.pro.dto.Emp_DTO;
import com.hr.pro.dto.Job2_DTO;
import com.hr.pro.model.DeptDaoImpl;
import com.hr.pro.model.EmpDaoImpl;
import com.hr.pro.model.IDeptDao;
import com.hr.pro.model.IEmpDao;
import com.hr.pro.model.IJob2Dao;
import com.hr.pro.model.Job2DaoImpl;

public class Controller_Excel extends HttpServlet{

	private static final long serialVersionUID = 3466465072643031370L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String excel = req.getParameter("excel");
		
		if(excel.equals("emp")) {
			IEmpDao dao = new EmpDaoImpl();
			List<Emp_DTO> lists = dao.emp_selectAll();
			
			Workbook workbook = new HSSFWorkbook();
			Sheet sheet = workbook.createSheet("직원 명단");
			int rowNo = 0;
			
			Row headerRow = sheet.createRow(rowNo++);
			headerRow.createCell(0).setCellValue("EMP_ID");
			headerRow.createCell(1).setCellValue("FIRST_NAME");
			headerRow.createCell(2).setCellValue("LAST_NAME");
			headerRow.createCell(3).setCellValue("EMAIL");
			headerRow.createCell(4).setCellValue("PHONE");
			headerRow.createCell(5).setCellValue("HIRE_DATE");
			headerRow.createCell(6).setCellValue("SALARY");
			headerRow.createCell(7).setCellValue("JOB_ID");
			headerRow.createCell(8).setCellValue("JOB_TITLE");
			headerRow.createCell(9).setCellValue("DEPARTMENT_ID");
			headerRow.createCell(10).setCellValue("DEPARTMENT_NAME");
			headerRow.createCell(11).setCellValue("MANAGER_ID");
			
			for(Emp_DTO emp : lists) {
				Row row = sheet.createRow(rowNo++);
				row.createCell(0).setCellValue(emp.getEmployee_id());
				row.createCell(1).setCellValue(emp.getFirst_name());
				row.createCell(2).setCellValue(emp.getLast_name());
				row.createCell(3).setCellValue(emp.getEmail());
				row.createCell(4).setCellValue(emp.getPhone_number());
				row.createCell(5).setCellValue(emp.getHire_date());
				row.createCell(6).setCellValue(emp.getSalary());
				row.createCell(7).setCellValue(emp.getJob_id());
				row.createCell(8).setCellValue(emp.getJob_title());
				row.createCell(9).setCellValue(emp.getDepartment_id());
				row.createCell(10).setCellValue(emp.getDepartment_name());
				row.createCell(11).setCellValue(emp.getManager_id());				
			}
			resp.setContentType("ms-vnd/excel");
			resp.setHeader("Content-Disposition", "attachment;filename=empList.xls");
			
			workbook.write(resp.getOutputStream());
		} else if(excel.equals("dept")) {
			IDeptDao dao = new DeptDaoImpl();
			List<Dept_DTO> lists = dao.dept_selectAll();
			
			Workbook workbook = new HSSFWorkbook();
			Sheet sheet = workbook.createSheet("부서 명단");
			int rowNo = 0;
			
			Row headerRow = sheet.createRow(rowNo++);
			headerRow.createCell(0).setCellValue("DEPARTMENT_ID");
			headerRow.createCell(1).setCellValue("DEPARTMENT_NAME");
			headerRow.createCell(2).setCellValue("MANAGER_ID");
			headerRow.createCell(3).setCellValue("LOCATION");
			
			for(Dept_DTO dept : lists) {
				Row row = sheet.createRow(rowNo++);
				row.createCell(0).setCellValue(dept.getDepartment_id());
				row.createCell(1).setCellValue(dept.getDepartment_name());
				row.createCell(2).setCellValue(dept.getManager_id());
				row.createCell(3).setCellValue(dept.getLocation());		
			}
			resp.setContentType("ms-vnd/excel");
			resp.setHeader("Content-Disposition", "attachment;filename=deptList.xls");
			
			workbook.write(resp.getOutputStream());
		} else if(excel.equals("job")) {
			IJob2Dao dao = new Job2DaoImpl();
			List<Job2_DTO> lists = dao.job_selectAll();
			
			Workbook workbook = new HSSFWorkbook();
			Sheet sheet = workbook.createSheet("직무 명단");
			int rowNo = 0;
			
			Row headerRow = sheet.createRow(rowNo++);
			headerRow.createCell(0).setCellValue("JOB_ID");
			headerRow.createCell(1).setCellValue("JOB_TITLE");
			headerRow.createCell(2).setCellValue("MIN_SALARY");
			headerRow.createCell(3).setCellValue("MAX_SALARY");
			
			for(Job2_DTO job : lists) {
				Row row = sheet.createRow(rowNo++);
				row.createCell(0).setCellValue(job.getJob_id());
				row.createCell(1).setCellValue(job.getJob_title());
				row.createCell(2).setCellValue(job.getMin_salary());
				row.createCell(3).setCellValue(job.getMax_salary());		
			}
			resp.setContentType("ms-vnd/excel");
			resp.setHeader("Content-Disposition", "attachment;filename=jobList.xls");
			
			workbook.write(resp.getOutputStream());
		}
		
	}
	
	

}
