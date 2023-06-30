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
<script type="text/javascript" src="./js/job_summary.js"></script>
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
							List<Job2_DTO> lists019 = (List<Job2_DTO>) request.getAttribute("lists019");
							if (lists != null) {
							%>
							<select id="jobIdSelect" name="jobIdSelect">
								<%if(lists019 != null){%>
								<option value="<%=lists019.get(0).getJob_id()%>"><%=lists019.get(0).getJob_id()%></option>
								<%	
								} else {%>
								<option value="all">전체</option>
								<%
								}
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
					<input id="view_sal" type="button" value="직무별 연봉정보 보기	">
					<input id="download" type="button" value="엑셀 다운로드">
				</div>
				<div id="summary">
					<table>
						<col width="10%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
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
							int currentPage = 1; // 현재 페이지 초기화
							
							if(lists019 != null){
								for (int i =0; i<10; i++) {
									if(i == 0){%>
									<tr name="clikedRow">
										<td><%=String.format("%03d", count)%></td>
										<td><%=lists019.get(0).getJob_id()%></td>
										<td><%=lists019.get(0).getJob_title()%></td>
										<td><%=lists019.get(0).getMin_salary()%></td>
										<td><%=lists019.get(0).getMax_salary()%></td>
									</tr>
									<%} else { %>
										<tr>
										<td style="color: white"><%=String.format("%03d", count)%></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										</tr>
									<% }
									count++;
								}
							}
							
							if (lists != null) {
							    int totalRows = (int) Math.ceil((double) lists.size() / 10) * 10; // 전체 행 수를 10의 배수로 계산
							    
							    for (int i = 0; i < totalRows; i++) {
							        if (i < lists.size()) {
							            Job2_DTO job = lists.get(i);
							            
							            if (jobIdSelect == null || jobIdSelect.equals("all")) {
							                if (i >= 10 && i < 20) { // 두 번째 페이지에 행 추가
							                    %>
							                    <tr id="secondPage" style="display: none;" name="clikedRow">
							                        <td><%=String.format("%03d", i + 1)%></td>
							                        <td><%=job.getJob_id()%></td>
							                        <td><%=job.getJob_title()%></td>
							                        <td><%=job.getMin_salary()%></td>
							                        <td><%=job.getMax_salary()%></td>
							                    </tr>
							                    <%
							                } else { // 첫 번째 페이지에 행 출력
							                    %>
							                    <tr id="firstPage" name="clikedRow">
							                        <td><%=String.format("%03d", i + 1)%></td>
							                        <td><%=job.getJob_id()%></td>
							                        <td><%=job.getJob_title()%></td>
							                        <td><%=job.getMin_salary()%></td>
							                        <td><%=job.getMax_salary()%></td>
							                    </tr>
							                    <%
							                }
							            }
							        } else if (i >= 10 && i < 20) { // lists의 크기를 넘어가는 경우 빈 행 추가 (두 번째 페이지)// 작동 안됨..?
							            %>
							            <tr id="secondPage" style="display: none;">
							                <td><%=String.format("%03d", i + 1)%></td>
							                <td></td>
							                <td></td>
							                <td></td>
							                <td></td>
							            </tr>
							            <%
							        }
							    }
							}
							%>
						</tbody>
					</table>
				</div>
			</section>
			<section id="page">
				<input class="page" type="button" value="&lt;" onclick="prevPage()">
				<!-- 행에 따라 늘어남 -->
				<% if (lists019 == null) {
				for (int i = 1; i <= Math.ceil((double) lists.size() / 10); i++) {
				%>
				<input class="page" type="button" id="curPage" value="<%=i%>"
					onclick="viewPage('<%=i%>')">
				<%
				}} else {
					%>
					<input class="page" type="button" value="1">
					<%
				}
				%>
				<input class="page" type="button" value="&gt;" onclick="nextPage()">
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
								if (i >= 10 && i < 20) {
									row.style.display = "table-row";
								} else {
									row.style.display = "none";
								}
							} else {
								row.style.display = "none";
							}
						}
					}

					// 페이지 버튼 스타일 변경
					var pageButtons = document.getElementsByClassName("page");
					for (var j = 0; j < pageButtons.length; j++) {
						var button = pageButtons[j];
						if (button.value == pageId) {
							button.classList.add("active");
						} else {
							button.classList.remove("active");
						}
					}
				}
				
				 function prevPage() {
					 var currentPage = document.querySelector('.page.active').value;
				        if (currentPage > 1) {
				            viewPage(parseInt(currentPage) - 1);
				        }
				    }

				   function nextPage() {
				    	var currentPage2 = document.getElementById("curPage").value;
				        var totalPages = 2<%-- <%=Math.ceil((double) lists.size() / 10)%> --%>;  
				        if (currentPage2 < totalPages) {
				            viewPage(parseInt(currentPage2) + 1);
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