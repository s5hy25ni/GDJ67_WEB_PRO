package com.hr.pro.dto;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
@NoArgsConstructor
public class Admin_DTO {
	private String admin_id;
	private String admin_pw;
	private String last_login;
}
