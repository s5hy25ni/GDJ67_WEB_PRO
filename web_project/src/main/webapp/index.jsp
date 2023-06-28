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
<link rel="stylesheet" href="./css/index.css">
<script type="text/javascript" src="./js/index.js"></script>
</head>
<body>
	<div id="outline">
		<div id="login_wrap">
			<div id="login_top">
				<div id="logo"></div>
			</div>
			<div id="login_content">
				<form name="login_info" action="/web_project/login.do" method="post">
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
		String loginSuccess = (String)request.getAttribute("loginSuccess");
		HttpSession loginSession = request.getSession();
		if(loginSuccess=="true"){
			%>
			<p><%=loginSuccess %></p>
			<p><%=loginSession.getAttribute("id") %></p>
			<p><%=loginSession.getAttribute("lastLogin") %></p>
			<%
		} else {
			%>
			<script>
				window.onload=function(){
					document.getElementById("login_confirm").style.display="block";
			        document.getElementById("login_confirm").textContent = "※ 아이디와 비빌번호를 확인해주세요."
			        	document.getElementById("user_pw").focus();
				}
			</script>
			<%
		}
	%>
</body>
</html>