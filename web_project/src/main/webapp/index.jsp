<%@page import="java.util.List"%>
<%@page import="com.hr.pro.dto.Admin_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HRCompany</title>
<link rel="stylesheet" href="./css/outline.css">
<link rel="stylesheet" href="./css/index.css">
<script type="text/javascript" src="./js/outline.js"></script>
<script type="text/javascript" src="./js/index.js"></script>
</head>
<body>
    <%
		HttpSession loginSession = request.getSession();
	%>
	<div id="outline">
        <header>
            <div id="logo"></div>
            <div class="menus"><h3 class="menuMove" id="emp">직원 관리</h3></div>
            <div class="menus"><h3 class="menuMove" id="dept">부서 관리</h3></div>
            <div class="menus"><h3 class="menuMove" id="job">직무 관리</h3></div>
            
         <%
         List<Admin_DTO> admins = (List<Admin_DTO>)loginSession.getAttribute("SuccessUser");
         if(loginSession.isNew() == true || loginSession.getAttribute("isLogin") == null || loginSession.getAttribute("isLogin") == "failure"){
       	%>
         		<div id="isLoginFalse">
         			<div id="login_notify"></div>
         			<div id="login_extension"></div>
         			<input id="loginBtn" type="button">
         		</div>
         	<%
         	} else {
         		%>
         		<div id="isLoginTrue">
         			<div id="login_notify">
         				<div id="lastLogin"><%=admins.get(0).getLast_login() %></div>
         				<input id="notifyBtn" type="button" value="신고">
         			</div>
         			<div id="login_extension">
	                    <div id="login_timer"></div>
	                    <input id="login_extension_btn" type="button" value="연장">
	                </div>
	         		<div>
	         			<input id="logoutBtn" type="button" >
                	</div>
                </div>
         		<%
         	}
         %>
        </header>
        <main>
            <section id="index">
            	<div id="left" onclick="cardNewsLeft()"></div>
            	<div id="center">
            	</div>
            	<div id="right" onclick="cardNewsRight()"></div>
 			</section>
        </main>
        <footer>
            <div>&copy; Developer heeae&hyeon</div>
            <div>(구디아카데미) 서울시 금천구 가산디지털2로 95, 3층 ORANGE</div>
        </footer>
    </div>   	
	<div id="hidden">
		<p id="isLogin"><%=loginSession.getAttribute("isLogin") %></p>
		<form method="POST" data-email="s5hy25ni@gmail.com" 
		action="https://script.google.com/macros/s/AKfycbzC0qfRmnKei7-xoi1RAqRzt59NwArRo8irCvvxEMpWm_fQ_OTRiRL8eJC0TO7KJIr2Nw/exec"
		target="frAttachFiles"
		style="display:none">;
		<%
			if(admins != null){
			%>
			<input type="text" name="name" value="<%=admins.get(0).getAdmin_id()%>" readonly="readonly">
			<%
			}
		%>
			<input type="email" name="email" value="s5hy25ni@gmail.com" readonly="readonly">
			<input type="text" name="subject" value="[ADMIN] 타인 로그인 의심 신고">
		</form>
		<iframe name="frAttachFiles" style="display:none"></iframe>
	</div>
</body>
</html>