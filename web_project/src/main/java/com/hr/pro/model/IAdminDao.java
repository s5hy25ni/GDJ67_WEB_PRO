package com.hr.pro.model;

import java.util.List;

import com.hr.pro.dto.Admin_DTO;

public interface IAdminDao {
	public List<Admin_DTO> getAdminList();
}
