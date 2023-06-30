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
         		<input id="logout" type="button" onclick="">
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
            			<input id="gologinBtn" type="button" value="로그인">
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
	                                    <td colspan="2"><input id="notifyBtn" type="button" value="신고하기"></td>
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
		<p><%=loginSession.getAttribute("isLogin") %></p>
	</div>
</body>
<script type="text/javascript">
// document.getElementById("gologinBtn").onclick=goLogin();

// function goLogin(){
// 	location.href="./login.jsp"
// }
</script>
</html>