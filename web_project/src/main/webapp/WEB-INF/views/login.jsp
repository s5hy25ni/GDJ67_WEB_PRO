<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.hr.pro.dto.Admin_DTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HRCompany</title>
<link rel="stylesheet" href="./css/outline.css">
<link rel="stylesheet" href="./css/login.css">
<script type="text/javascript" src="./js/login.js"></script>
</head>
<body>
	<div id="outline">
		<div id="login_wrap">
			<div id="login_top">
				<div id="logo"></div>
			</div>
			<div id="login_content">
				<form name="login_info" action="/web_project/login.do" method="post">
					<input type="hidden" name="cmd" value="login">
					<div id="login_input">
						<div id="login_id" class="login_input">
							<div></div>
							<input id="user_id" name="user_id" type="text" placeholder="아이디">
						</div>
						<div id="login_pw" class="login_input">
							<div></div>
							<input id="user_pw" name="user_pw" type="password" placeholder="비밀번호">
						</div>
						<div id="login_pw_confirm">
							<label id="checkbox_label"><input id="checkbox" type="checkbox"> 비밀번호 보기</label>
						</div>
					</div>
					<div id="login_confirm"></div>
					<div id="lgoin_button">
						<input id="login_submit" type="button"></input>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%
		HttpSession loginSession = request.getSession();
		List<Admin_DTO> admins = (List<Admin_DTO>)loginSession.getAttribute("SuccessUser");
	%>
	<div id="hidden">
		<p id="admin"><%=admins %></p>
		<p id="isLogin"><%=loginSession.getAttribute("isLogin") %></p>
		<form name="notify" method="POST" data-email="s5hy25ni@gmail.com" 
		action="https://script.google.com/macros/s/AKfycbzC0qfRmnKei7-xoi1RAqRzt59NwArRo8irCvvxEMpWm_fQ_OTRiRL8eJC0TO7KJIr2Nw/exec"
		target="frAttachFiles"
		style="display:none">;
		<%
			if(admins != null){
			%>
			<input type="text" name="subject" value="[ADMIN] 타인 로그인 의심 신고">
			<input type="text" name="name" value="<%=admins.get(0).getAdmin_id()%>" readonly="readonly">
			<input type="text" name="time" value="<%=admins.get(0).getLast_login()%>" readonly="readonly">
			<%
			}
		%>
		</form>
		<iframe name="frAttachFiles" style="display:none"></iframe>
	</div>
</body>
</html>