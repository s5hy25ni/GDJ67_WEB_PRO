<%@page import="com.hr.pro.dto.Emp_DTO2"%>
<%@page import="com.hr.pro.dto.Job2_DTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 및 삭제</title>
<link rel="stylesheet" href="./css/outline.css">
<link rel="stylesheet" href="./css/job_details.css">
<link rel="stylesheet" href="./css/modal.css">
</head>
<body>
	<form id="details_outline">
		<div id="detail_info">
			<div id="detail_info_top">
				<div id="detail_right">
					<div class="detail_line">
						<%
                    	List<Job2_DTO> lists019 = (List<Job2_DTO>) request.getAttribute("lists019");
                    	List<Emp_DTO2> lists037 = (List<Emp_DTO2>) request.getAttribute("lists037");
                    %>
						<div class="column">
							<h5>JOB_ID</h5>
						</div>
						<input class="non_change long"
							value="<%=lists019.get(0).getJob_id()%>" disabled>
					</div>
					<div class="detail_line">
						<div class="column">
							<h5>JOB_TITLE</h5>
						</div>
						<input class="non_change long"
							value="<%=lists019.get(0).getJob_title()%>" disabled>
					</div>
					<div class="detail_line">
						<div class="column">
							<h5>MIN_SALARY</h5>
						</div>
						<input class="change long" type="text"
							value="<%=lists019.get(0).getMin_salary()%>">
					</div>
					<div class="detail_line">
						<div class="column">
							<h5>MAX_SALARY</h5>
						</div>
						<input class="change long" type="text"
							value="<%=lists019.get(0).getMax_salary()%>">
					</div>
				</div>
			</div>
			<div id="summary">
				<table>
					<thead>
						<tr>
							<td>EMP_ID</td>
							<td>EMP_NAME</td>
							<td>HIREDATE</td>
							<td>SALARY</td>
							<td>DEPT_ID</td>
						</tr>
					</thead>
					<tbody>
						<%
						if (lists037 != null && !lists037.isEmpty()) {
							for (int i = 0; i < lists037.size(); i++) {
						%>
						<tr>
							<td><%=lists037.get(i).getEmployee_id()%></td>
							<td><%=lists037.get(i).getFirst_name() + " " + lists037.get(i).getLast_name()%></td>
							<td><%=lists037.get(i).getHire_date()%></td>
							<td><%=lists037.get(i).getSalary()%></td>
							<td><%=lists037.get(i).getDepartment_id()%></td>
						</tr>
						<%
						}
						} else {
						// 리스트가 null인 경우에 대한 처리
						%>
						<tr>
							<td colspan="5">데이터 없음</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
			<div id="detail_btns">
				<input id="modify_btn" type="button" value="수정"> <input
					id="delete_btn" type="button" value="삭제">
			</div>
			<!-- 수정 및 삭제 확인 모달 -->
			<div id="confirmationModal" class="modal">
				<div class="modal-content">
					<h4 id="confirmationAlert"></h4>
					<p id="confirmationMessage"></p>
					<div class="modal-buttons">
						<input id="cancelBtn" type="button" value="취소"> <input
							id="confirmBtn" type="button" value="">
					</div>
				</div>
			</div>
			<script type="text/javascript" src="./js/modal.js"></script>
	</form>
</body>
</html>