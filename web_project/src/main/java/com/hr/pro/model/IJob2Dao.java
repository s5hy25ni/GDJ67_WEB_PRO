package com.hr.pro.model;

import java.util.List;
import java.util.Map;

import com.hr.pro.dto.Job2_DTO;

public interface IJob2Dao {

	//WP018
	public List<Job2_DTO> job_selectAll();
	//WP019
	public List<Job2_DTO> job_id_drop();
	//WP020
	public List<Job2_DTO> job_search_name(Job2_DTO dto);
	//WP021
	public int job_update_id(Map<String, Object> map);
	public int job_update_empJobId(Map<String, Object> map);
	//WP022
	public List<Job2_DTO> job_title_drop();
	public boolean job_update_title(Map<String, Object> map);
	//WP023
	public boolean job_update_minSal(Map<String, Object> map);
	public boolean job_update_maxSal(Map<String, Object> map);
	//WP024
	public int job_delete(Job2_DTO dto);
	public int job_delete_empJobId(Job2_DTO dto);
	//WP025
	public boolean job_insert(Map<String, Object> map);
}
