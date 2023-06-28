<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login_Comfirm</title>
</head>
<body>
	<% HttpSession loginSession = request.getSession(); %>
	<div>
		<p>현재 로그인 된 ID = <%=loginSession.getAttribute("id") %></p>
		<p>마지막 로그인 시간 = <%=loginSession.getAttribute("lastLogin") %></p>
		<p>마지막 로그인이 본인이 아닐 경우 관리자에게 알려주세요.</p>
	</div>
</body>
</html>