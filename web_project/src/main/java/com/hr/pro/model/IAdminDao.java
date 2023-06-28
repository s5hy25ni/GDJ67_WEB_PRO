package com.hr.pro.model;

import java.util.List;
import java.util.Map;

import com.hr.pro.dto.Admin_DTO;

public interface IAdminDao {
	public List<Admin_DTO> getLoginUser(Map<String, Object> map);
	public boolean setLastLogin(Map<String, Object> map);
}
