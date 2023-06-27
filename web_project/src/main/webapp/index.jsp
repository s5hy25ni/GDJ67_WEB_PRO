<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="com.hr.pro.dto.Admin_DTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/outline.css">
<link rel="stylesheet" href="./css/index.css">
<script type="text/javascript" src="./js/index.js"></script>
</head>
<body>
	<% 
		String id=""; 
		String pw="";	
	%>
	<div id="outline">
		<div id="login_wrap">
			<div id="login_top">
				<div id="logo"></div>
			</div>
			<div id="login_content">
				<div id="login_input">
					<div id="login_id" class="login_input">
						<div></div>
						<input id="user_id" type="text" placeholder="아이디">
					</div>
					<div id="login_pw" class="login_input">
						<div></div>
						<input pw="user_pw" type="password" placeholder="비밀번호">
					</div>
					<div id="login_pw_confirm">
						<label><input type="checkbox"> 비밀번호 보기</label>
					</div>
				</div>
					<div id="login_confirm">※ 아이디 또는 비밀번호를 확인해주세요.</div>
					<div id="lgoin_button">
						<input type="button" onclick="login()"></input>
						<%
							List<Admin_DTO> lists = (List<Admin_DTO>)request.getAttribute("adminList");
							if(lists != null){
								List<String> idList = lists.stream().map(Admin_DTO::getAdmin_id).collect(Collectors.toList());
								for(int i=0; i<idList.size(); i++){
									if(idList.get(i)==id){
										System.out.println(idList.get(i)+" == "+id);
									} else {
										System.out.println(idList.get(i)+" != "+id);
									}
								}
							}
						%>
					</div>
			</div>
		</div>
	</div>
</body>
<script>
	function login() {
		location.href='/web_project/login.do';
		
	 }
</script>
</html>