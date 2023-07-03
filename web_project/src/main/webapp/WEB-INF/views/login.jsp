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
		HttpSession loginSession = request.getSession(false);
	%>
	<div id="hidden">
		<p id="isLogin"><%=loginSession.getAttribute("isLogin") %></p>
	</div>
</body>
</html>