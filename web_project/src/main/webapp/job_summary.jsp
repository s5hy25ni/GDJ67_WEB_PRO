<%@page import="com.hr.pro.dto.Job2_DTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HRCompany</title>
<link rel="stylesheet" href="./css/outline.css">
<link rel="stylesheet" href="./css/job_summary.css">
<script type="text/javascript" src="./js/js_job.js"></script>
</head>
<body>
	<div id="outline">
		<header>
			<div id="logo"></div>
			<div class="menus">
				<h3>
					<a href="#">직원 관리</a>
				</h3>
			</div>
			<div class="menus">
				<h3>
					<a href="#">부서 관리</a>
				</h3>
			</div>
			<div class="menus">
				<h3>
					<a href="#">직무 관리</a>
				</h3>
			</div>
			<input id="logout" type="button" onclick="">
			<div id="login_extension">
				<div id="login_time"></div>
				<input id="login_extension_btn" type="button" value="연장">
			</div>
		</header>
		<main>
			<section id="search">
				<div>
					<div class="search_center">
						<div class="search_culomn">
							<h5>JOB ID</h5>
						</div>
						<div class="search_center_value">
							<%
							List<Job2_DTO> lists = (List<Job2_DTO>) request.getAttribute("lists018");

							if (lists != null) {
							%>
							<select id="jobIdSelect" name="jobIdSelect">
								<option value="all">전체</option>
								<%
								for (int i = 0; i < lists.size(); i++) {
								%>
								<option value="<%=lists.get(i).getJob_id()%>"><%=lists.get(i).getJob_id()%></option>
								<%
								}
								%>
								<%
								}
								%>
							</select>
						</div>
						<input type="button" onclick="submitForm()">
						<script type="text/javascript">
							function submitForm() {
								var selectElement = document
										.getElementById("jobIdSelect");
								var selectedJobId = selectElement.options[selectElement.selectedIndex].value;

								// Create a form element
								var form = document.createElement("form");
								form.method = "GET";
								form.action = "/jobCtrl.do";

								// Create a hidden input field
								var hiddenField = document
										.createElement("input");
								hiddenField.type = "hidden";
								hiddenField.name = "jobIdSelect"; // Changed the name to match the parameter name
								hiddenField.value = selectedJobId;

								// Append the hidden field to the form
								form.appendChild(hiddenField);

								// Append the form to the document body and submit it
								document.body.appendChild(form);
								form.submit();
							}
						</script>
					</div>
					<div class="search_right">
						<div id="current_menu">
							<h5>직무관리</h5>
						</div>
					</div>
				</div>
				<div class="search_right">
					<div id="search_input">
						<input type="button"> <input type="text"
							placeholder="직무명으로 검색">
					</div>
				</div>
			</section>
			<section id="content">
				<div id="top">
					<div>구분: 전체, 행: 19</div>
					<input id="download" type="button" value="엑셀 다운로드">
				</div>
				<div id="summary">
					<table>
						<thead>
							<tr>
								<td id="no">NO</td>
								<td>JOB_ID</td>
								<td>JOB_TITLE</td>
								<td>MIN_SALARY</td>
								<td>MAX_SALARY</td>
							</tr>
						</thead>
						<tbody>
							<!-- for문으로 행 갯수만큼만 출력(최대 10개) -->
							<%
							    String jobIdSelect = (String) request.getParameter("jobIdSelect");
							    int count = 1;
							
							    if (lists != null) {
							        for (Job2_DTO job : lists) {
							            if (jobIdSelect == null || jobIdSelect.equals("all")) {
							    %>
							<tr <%if (count <= 10) {%> id="firstPage"
								<%} else if (count > 10 && count <= 20) {%> id="secondPage"
								style="display: none;" <%}%>>
								<td><%=String.format("%03d", count)%></td>
								<td><%=job.getJob_id()%></td>
								<td><%=job.getJob_title()%></td>
								<td><%=job.getMin_salary()%></td>
								<td><%=job.getMax_salary()%></td>
							</tr>
							<%
				            count++;
							        }
							    }
		  					  %>
							<%
							    List<Job2_DTO> lists019 = (List<Job2_DTO>) request.getAttribute("lists019");
							    if (lists019 != null && !lists019.isEmpty()) {
							        for (Job2_DTO job : lists019) {
							%>
							        <tr>
							            <td><%= String.format("%03d", 1) %></td>
							            <td><%= job.getJob_id() %></td>
							            <td><%= job.getJob_title() %></td>
							            <td><%= job.getMin_salary() %></td>
							            <td><%= job.getMax_salary() %></td>
							        </tr>
							<%
							        }
							    }
							%>
						</tbody>
					</table>
				</div>
			</section>
			<section id="page">
				<input class="page" type="button" value="&lt;">
				<!-- 행에 따라 늘어남 -->
				<%
				for (int i = 1; i <= Math.ceil((double) lists.size() / 10); i++) {
				%>
				<input class="page" type="button" value="<%=i%>"
					onclick="viewPage('<%=i%>')">
				<%
				}
				%>
				<%
				}
				%>
				<input class="page" type="button" value="&gt;">
			</section>
			<script type="text/javascript">
				function viewPage(pageId) {
					var rows = document.getElementsByTagName("tr");

					for (var i = 0; i < rows.length; i++) {
						var row = rows[i];
						if (row.id === "firstPage" || row.id === "secondPage") {
							if (row.id === "firstPage" && pageId == 1) {
								row.style.display = "table-row";
							} else if (row.id === "secondPage" && pageId == 2) {
								row.style.display = "table-row";
							} else {
								row.style.display = "none";
							}
						}
					}
				}
			</script>
		</main>
		<footer>
			<div>&copy; Developer heeae&hyeon</div>
			<div>(구디아카데미) 서울시 금천구 가산디지털2로 95, 3층 ORANGE</div>
		</footer>
	</div>
</body>
</html>