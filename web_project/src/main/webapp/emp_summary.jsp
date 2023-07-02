<%@page import="com.hr.pro.dto.Emp_DTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HRCompany</title>
<link rel="stylesheet" href="./css/outline.css">
<link rel="stylesheet" href="./css/emp_summary.css">
<script type="text/javascript" src="./js/emp_summary.js"></script>
</head>
<body>
	<div id="outline">
		<header>
			<div id="logo"></div>
			<div class="menus">
				<h3>
					<a href="./empCtrl.do">직원 관리</a>
				</h3>
			</div>
			<div class="menus">
				<h3>
					<a href="./deptCtrl.do">부서 관리</a>
				</h3>
			</div>
			<div class="menus">
				<h3>
					<a href="./jobCtrl.do">직무 관리</a>
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
					<div class="search_left">
						<div class="search_culomn">
							<h5>HIRE_DATE</h5>
						</div>
						<div class="search_left_value">
							<input type=date>
						</div>
						<div class="search_left_value">
							<input type=date>
						</div>
					</div>
					<div class="search_center">
						<div class="search_culomn">
							<h5>DEPT</h5>
						</div>
						<div class="search_center_value">
							<%
							List<Emp_DTO> lists001 = (List<Emp_DTO>) request.getAttribute("lists001");
							List<Emp_DTO> lists002 = (List<Emp_DTO>) request.getAttribute("lists002");
							List<Emp_DTO> lists003 = (List<Emp_DTO>) request.getAttribute("lists003");
							List<Emp_DTO> lists004 = (List<Emp_DTO>) request.getAttribute("lists004");
							%>
							<select id="deptIdSelect" name="deptIdSelect">
								<option value="all">전체</option>
								<%
								for (int i = 0; i < lists001.size(); i++) {
								%>
								<option value="<%=lists001.get(i).getDepartment_id()%>"><%=lists001.get(i).getDepartment_id()%></option>
								<%
								}
								%>
							</select>
						</div>
						<input type="button" onclick="submitForm()">
					</div>
					<div class="search_right">
						<div id="current_menu">
							<h5>직원관리</h5>
						</div>
					</div>
				</div>
				<div>
					<div class="search_left">
						<div class="search_culomn">
							<h5>SALARY</h5>
						</div>
						<div class="search_left_value">
							<input type=text placeholder="min value">
						</div>
						<div class="search_left_value">
							<input type=text placeholder="max value">
						</div>
					</div>
					<div class="search_center">
						<div class="search_culomn">
							<h5>JOB</h5>
						</div>
						<div class="search_center_value">
							<select id="jobIdSelect" name="jobIdSelect">
								<option value="all">전체</option>
								<%
								for (int i = 0; i < lists001.size(); i++) {
								%>
								<option value="<%=lists001.get(i).getJob_id()%>"><%=lists001.get(i).getJob_id()%></option>
								<%
								}
								%>
							</select>
						</div>
						<input type="button" onclick="submitForm()">
					</div>
					<div class="search_right">
						<div id="search_input">
							<input type="button" onclick="searchName()"> <input
								id="searchName" type="text" placeholder="ID 또는 이름 검색">
						</div>
					</div>
				</div>
			</section>
			<section id="content">
				<div id="top">
					<div>구분: 전체, 행: 107</div>
					<input id="download" type="button" value="엑셀 다운로드">
				</div>
				<div id="summary">
					<table>
						<thead>
							<tr>
								<td>NO</td>
								<td>EMP_ID</td>
								<!-- firstName+listName -->
								<td>NAME</td>
								<!-- yyyy-mm-dd -->
								<td>HIRE_DATE</td>
								<!-- 3자리씩 끊어서(,) -->
								<td>SALARY</td>
								<!-- jobName(jobId) -->
								<td>JOB</td>
								<!-- deptName(deptId) -->
								<td>DEPT</td>
							</tr>
						</thead>
						<tbody>
							<!-- for문으로 행 갯수만큼만 출력(최대 10개) -->
							<%
							String deptIdSelect = (String) request.getParameter("deptIdSelect");
							String jobIdSelect = (String) request.getParameter("jobIdSelect");
							String empNameSelect = (String) request.getParameter("empNameSelect");
							int count = 1;
							int currentPage = 1; // 현재 페이지 초기화

							if (lists003 != null || lists004 != null) {
								for (int i = 0; i < 10; i++) {
									if (i == 0) {
							%>
							<tr name="clickedRow">
								<td><%=String.format("%03d", count)%></td>
								<td><%=lists003.get(0).getEmployee_id()%></td>
								<td><%=lists003.get(0).getFirst_name() + " " + lists003.get(0).getLast_name()%></td>
								<td><%=lists003.get(0).getHire_date()%></td>
								<td><%=lists003.get(0).getSalary()%></td>
								<td><%=lists003.get(0).getJob_title() + "(" + lists003.get(0).getJob_id() + ")"%></td>
								<td><%=lists003.get(0).getDepartment_name() + "(" + lists003.get(0).getDepartment_id() + ")"%></td>
							</tr>
							<%
							} else {
							%>
							<tr>
								<td style="color: white"><%=String.format("%03d", count)%></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<%
							}
							count++;
							}
							}
							if (lists002 != null) {
							int size = Math.min(lists002.size(), 10); // 최대 10개까지만 반복
							for (int i = 0; i < 10; i++) {
							String name = lists002.get(i).getFirst_name() + " " + lists002.get(i).getLast_name();
							if (i < size && !lists002.isEmpty()) {
							%>
							<tr name="clickedRow">
								<td><%=String.format("%03d", count)%></td>
								<td><%=lists002.get(0).getEmployee_id()%></td>
								<td><%=name%></td>
								<td><%=lists002.get(0).getHire_date()%></td>
								<td><%=lists002.get(0).getSalary()%></td>
								<td><%=lists002.get(0).getJob_title() + "(" + lists002.get(0).getJob_id() + ")"%></td>
								<td><%=lists002.get(0).getDepartment_name() + "(" + lists002.get(0).getDepartment_id() + ")"%></td>
							</tr>
							<%
							} else {
							%>
							<tr>
								<td style="color: white"><%=String.format("%03d", count)%></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<%
							}
							count++;
							}
							}
							if (lists001 != null) {
								int totalRows = (int) Math.ceil((double) lists001.size() / 10) * 10; // 전체 행 수를 10행씩 계산
							    
							    for (int i = 0; i < totalRows; i++) {
							        if (i < lists001.size()) {
							            Emp_DTO empDto = lists001.get(i);
							            String name = lists001.get(i).getFirst_name() + " " + lists001.get(i).getLast_name();
							            if ((deptIdSelect == null || deptIdSelect.equals("all")) && (jobIdSelect == null || jobIdSelect.equals("all"))) {
							                if (i >= 10 && i < 20) { // 두 번째 페이지에 행 추가
							                    %>
							                    <tr id="secondPage" style="display: none;" name="clickedRow">
							                        <td><%=String.format("%03d", i + 1)%></td>
							                        <td><%=empDto.getEmployee_id()%></td>
													<td><%=name%></td>
													<td><%=empDto.getHire_date()%></td>
													<td><%=empDto.getSalary()%></td>
													<td><%=empDto.getJob_title() + "(" + empDto.getJob_id() + ")"%></td>
													<td><%=empDto.getDepartment_name() + "(" + empDto.getDepartment_id() + ")"%></td>
							                    </tr>
							                    <%
							                } else { // 첫 번째 페이지에 행 출력
							                    %>
							                    <tr id="firstPage" name="clickedRow">
							                        <td><%=String.format("%03d", i + 1)%></td>
							                        <td><%=empDto.getEmployee_id()%></td>
													<td><%=name%></td>
													<td><%=empDto.getHire_date()%></td>
													<td><%=empDto.getSalary()%></td>
													<td><%=empDto.getJob_title() + "(" + empDto.getJob_id() + ")"%></td>
													<td><%=empDto.getDepartment_name() + "(" + empDto.getDepartment_id() + ")"%></td>
							                    </tr>
							                    <%
							                }
							            }
							        } else if (i >= lists001.size() && i < totalRows) { // lists의 크기를 넘어가는 경우 빈 행 추가 (두 번째 페이지)
							            %>
							            <tr id="secondPage" style="display: none; color: white;">
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
				<%
				if(lists002 == null && lists003 == null && lists004 == null){
				int totalPages = (int) Math.ceil((double) lists001.size() / 10);
				%>
				<input class="page" type="button" value="&lt;" onclick="prevPage()">
				<%
				for (int i = 1; i <= totalPages; i++) {
				%>
				<input class="page" type="button" value="<%=i%>"
					onclick="viewPage(<%=i%>)">
				<%
				}%>
				<input class="page" type="button" value="&gt;" onclick="nextPage()">
				<%
				} else {
					%>
					<input class="page" type="button" value="1">
					<%
				}
				%>
			</section>
			<script type="text/javascript">
				var currentPage = 1;
				
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
				        var totalPages = <%=Math.ceil((double) lists001.size() / 10)%>;  
				        if (currentPage < totalPages) {
				            viewPage(currentPage + 1);
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