<%@page import="java.util.List"%>
<%@page import="com.hr.pro.dto.Admin_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/outline.css">
<link rel="stylesheet" href="./css/index.css">
<script type="text/javascript" src="./js/index.js"></script>
</head>
<body>
    <%
		HttpSession loginSession = request.getSession();
	%>
	<div id="outline">
        <header>
            <div id="logo"></div>
            <div class="menus"><h3><a href="#">직원 관리</a></h3></div>
            <div class="menus"><h3><a href="#">부서 관리</a></h3></div>
            <div class="menus"><h3><a href="#">직무 관리</a></h3></div>
         <%
         	if(loginSession.getAttribute("isLogin") == "success"){
         	%>
         		<input id="logout" type="button" onclick="logout()">
                <div id="login_extension">
                    <div id="login_time"></div>
                    <input id="login_extension_btn" type="button" value="연장">
                </div>
         	<%
         	}
         %>
        </header>
        <main>
            <section id="index">
            <%
            	if(loginSession.isNew() == true || loginSession.getAttribute("isLogin") == null || loginSession.getAttribute("isLogin") == "failure"){
           	%>
            		<div id="isLoginFalse">
            			<input id="gologinBtn" type="button" value="로그인" onclick="goLogin()">
            		</div>
           	<%
            	}
        		List<Admin_DTO> admins = (List<Admin_DTO>)loginSession.getAttribute("SuccessUser");
            	if(loginSession.getAttribute("isLogin") == "success"){
           	%>
            		<div id="isLoginTrue">
	                    <div id="loginUser">
	                        <div id="photo"></div>
	                        <div id="info">
	                            <table>
	                                <col width="50%">
	                                <col width="50%">
	                                <tr>
	                                    <td>로그인 계정</td>
	                                    <td class="notifyTxt"><%=admins.get(0).getAdmin_id() %></td>
	                                </tr>
	                                <tr>
	                                    <td>마지막 로그인</td>
	                                    <td class="notifyTxt"><%=admins.get(0).getLast_login() %></td>
	                                </tr>
	                                <tr>
	                                    <td colspan="2" class="notifyTxt">마지막 로그인이 본인이 아닐 경우,<br> 정보보안팀에 알려주세요!</td>
	                                </tr>
	                                <tr>
	                                    <td colspan="2"><input id="notifyBtn" type="button" value="신고하기" onclick="notify()"></td>
	                                </tr>
	                            </table>
	                        </div>
	                    </div>
					</div>
           	<%
            	}
            %>
 			</section>
        </main>
        <footer>
            <div>&copy; Developer heeae&hyeon</div>
            <div>(구디아카데미) 서울시 금천구 가산디지털2로 95, 3층 ORANGE</div>
        </footer>
    </div>   	
	<div id="test">
		<p><%=loginSession %></p>
		<p><%=loginSession.getAttribute("isLogin") %></p>
	</div>
	<form method="POST" data-email="s5hy25ni@gmail.com" 
		action="https://script.google.com/macros/s/AKfycbzC0qfRmnKei7-xoi1RAqRzt59NwArRo8irCvvxEMpWm_fQ_OTRiRL8eJC0TO7KJIr2Nw/exec"
		target="frAttachFiles">
		<%
			if(admins != null){
				%>
				<input type="text" name="name" value="<%=admins.get(0).getAdmin_id()%>">
				<%
			}
		%>
		<input type="email" name="email" value="s5hy25ni@gmail.com">
		<input type="text" name="subject" value="[ADMIN] 타인 로그인 의심 신고">
	</form>
	<iframe name="frAttachFiles" style="display:none"></iframe>
</body>
</html>