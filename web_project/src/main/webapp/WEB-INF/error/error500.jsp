<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/outline.css">
<link rel="stylesheet" href="./css/error.css">
<script type="text/javascript" src="./js/error.js"></script>
<title>[ERROR] 500</title>
</head>
<%
	response.setStatus(HttpServletResponse.SC_OK);
%>
<body>
	<div id="outline">
		<div id="error">
			<div id="txt">Error 500<br>Internal Server Error</div>
			<div id="img500"></div>
			<div id="btn">GO TO HOME?</div>
		</div>
	</div>
</body>
</html>