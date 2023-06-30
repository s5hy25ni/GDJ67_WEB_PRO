package com.hr.pro.model;

import java.util.List;
import java.util.Map;

import com.hr.pro.dto.Dept_DTO;

public interface IDeptDao {
	
	//WP026
	public List<Dept_DTO> dept_selectAll();
	//WP027
	public List<Dept_DTO> dept_id_select(Map<String, Object> map);
	//WP028
	public List<Dept_DTO> dept_search_name(Dept_DTO dto);
	//WP029
	public boolean dept_update_name(Map<String, Object> map);
	//WP030
	public List<Dept_DTO> dept_managerId_drop();
	public boolean dept_update_managerId(Map<String, Object> map);
	public int dept_update_empManagerId(Map<String, Object> map);
	//WP031
	public int dept_update_location(Map<String, Object> map);
	//WP032
	public boolean dept_delete(Dept_DTO dto);
	public int dept_delete_empDeptId(Dept_DTO dto);
	//WP033
	public int dept_insert_idName(Map<String, Object> map);
	//WP034
	public List<Dept_DTO> dept_empManagerId_drop();
	public boolean dept_insert_managerId(Map<String, Object> map);
	public int dept_insert_empManagerId(Map<String, Object> map);

}
