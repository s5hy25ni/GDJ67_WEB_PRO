<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.hr.pro.dto.Job2_DTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test</title>
</head>
<body>
	<button onclick="javascript:location.href='./jobCtrl.do'">결과 확인</button>
	<%
		List<Job2_DTO> lists = (List<Job2_DTO>)request.getAttribute("lists018");
		
		if(lists != null){
	%>
	<fieldset>
		<legend>전체 조회</legend>
		<div>
			<div>총개수 : <%=lists.size() %></div>
			<div>
			<select>
			<%
			for(int i=0; i<lists.size(); i++){
			%>
				<option><%=lists.get(i).getJob_title() %></option>
			<% } %>
			</select>
			</div>
		</div>
	</fieldset>
		<%
						}
					%>
</body>
</html>