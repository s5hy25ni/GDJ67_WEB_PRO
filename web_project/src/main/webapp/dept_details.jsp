<%@page import="com.hr.pro.dto.Dept_DTO"%>
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
						List<Dept_DTO> lists027 = (List<Dept_DTO>) request.getAttribute("lists027");
						%>
						<div class="column">
							<h5>DEPT_ID</h5>
						</div>
						<input class="non_change long"
							value="<%=lists027.get(0).getDepartment_id()%>" disabled>
					</div>
					<div class="detail_line">
						<div class="column">
							<h5>DEPT_NAME</h5>
						</div>
						<input class="change long" type="text"
							value="<%=lists027.get(0).getDepartment_name()%>">
					</div>
					<div class="detail_line">
						<div class="column">
							<h5>MANIGER</h5>
						</div>
						<input class="change long" type="number"
							value="<%=lists027.get(0).getManager_id()%>">
					</div>
					<div class="detail_line">
						<div class="column">
							<h5>LOCATION</h5>
						</div>
						<input class="change long" type="text"
							value="<%=lists027.get(0).getLocation()%>">
					</div>
				</div>
			</div>

			<div id="summary">
				<table>
					<thead>
						<tr>
							<td>EMP</td>
							<td>START_DATE</td>
							<td>END_DATE</td>
							<td>JOB</td>
							<td>DEPT</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
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