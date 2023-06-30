<%@page import="com.hr.pro.dto.Dept_DTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HRCompany</title>
<link rel="stylesheet" href="./css/outline.css">
<link rel="stylesheet" href="./css/jobDept_summary.css">
<script type="text/javascript" src="./js/dept_summary.js"></script>
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
					<div class="search_center">
						<div class="search_culomn">
							<h5>DEPT ID</h5>
						</div>
						<div class="search_center_value">
							<%
							List<Dept_DTO> lists026 = (List<Dept_DTO>) request.getAttribute("lists026");
							List<Dept_DTO> lists027 = (List<Dept_DTO>) request.getAttribute("lists027");
							List<Dept_DTO> lists028 = (List<Dept_DTO>) request.getAttribute("lists028");
							if (lists026 != null) {
							%>
							<select id="deptIdSelect" name="deptIdSelect">
								<%
								if (lists027 != null) {
								%>
								<option value="<%=lists027.get(0).getDepartment_id()%>"><%=lists027.get(0).getDepartment_id()%></option>
								<option value="all">전체</option>
								<%
								} else {
								%>
								<option value="all">전체</option>
								<%
								}
								for (int i = 0; i < lists026.size(); i++) {
								%>
								<option value="<%=lists026.get(i).getDepartment_id()%>"><%=lists026.get(i).getDepartment_id()%></option>
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
							<h5>부서관리</h5>
						</div>
					</div>
				</div>
				<div class="search_right">
					<div id="search_input">
						<input type="button" onclick="searchName()"> 
						<input id="searchName" type="text"
							placeholder="부서명으로 검색">
					</div>
				</div>
			</section>
			<section id="content">
				<div id="top">
					<div>
						구분: 전체, 행:
						<%=lists026.size()%></div>
					<input id="download" type="button" value="엑셀 다운로드">
				</div>
				<div id="summary">
					<table>
						<col width="10%">
						<col width="10%">
						<col width="20%">
						<col width="10%">
						<col width="30%">
						<thead>
							<tr>
								<td id="no">NO</td>
								<td>DEPT_ID</td>
								<td>DEPT_NAME</td>
								<td>MANAGER_ID</td>
								<td>LOCATION</td>
							</tr>
						</thead>
						<tbody>
							<!-- for문으로 행 갯수만큼만 출력(최대 10개) -->
							<%
							String deptIdSelect = (String) request.getParameter("deptIdSelect");
							String deptNameSelect = (String) request.getParameter("deptNameSelect");
							int count = 1;
							int currentPage = 1; // 현재 페이지 초기화

							if (lists027 != null) {
								for (int i = 0; i < 10; i++) {
									if (i == 0) {
							%>
							<tr name="clikedRow">
								<td><%=String.format("%03d", count)%></td>
								<td><%=lists027.get(0).getDepartment_id()%></td>
								<td><%=lists027.get(0).getDepartment_name()%></td>
								<td><%=lists027.get(0).getManager_id()%></td>
								<td><%=lists027.get(0).getLocation()%></td>
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
							</tr>
							<%
							}
							count++;
							}
							}
							
							if (lists028 != null) {
							    int size = Math.min(lists028.size(), 10); // 최대 10개까지만 반복
							    for (int i = 0; i < 10; i++) {
							        if (i < size && lists028.get(i).getDepartment_name() != null) {
							            %>
							            <tr name="clikedRow">
							                <td><%=String.format("%03d", count)%></td>
							                <td><%=lists028.get(i).getDepartment_id()%></td>
							                <td><%=lists028.get(i).getDepartment_name()%></td>
							                <td><%=lists028.get(i).getManager_id()%></td>
							                <td><%=lists028.get(i).getLocation()%></td>
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
							            </tr>
							            <%
							        }
							        count++;
							    }
							}
							
							if (lists026 != null) {
							int totalRows = (int) Math.ceil((double) lists026.size() / 10) * 10; // 전체 행 수를 10행씩 계산

							for (int i = 0; i < totalRows; i++) {
							if (i < lists026.size()) {
							Dept_DTO dept = lists026.get(i);

							if ((deptIdSelect == null || deptIdSelect.equals("all")) && deptNameSelect == null) {
								if (i >= 10 && i < 20) { // 두 번째 페이지에 행 추가
							%>
							<tr id="secondPage" style="display: none;" name="clikedRow">
								<td><%=String.format("%03d", i + 1)%></td>
								<td><%=dept.getDepartment_id()%></td>
								<td><%=dept.getDepartment_name()%></td>
								<td><%=dept.getManager_id()%></td>
								<td><%=dept.getLocation()%></td>
							</tr>
							<%
							} else if (i >= 20 && i < 30) { // 세 번째 페이지에 행 추가
							%>
							<tr id="thirdPage" style="display: none;" name="clikedRow">
								<td><%=String.format("%03d", i + 1)%></td>
								<td><%=dept.getDepartment_id()%></td>
								<td><%=dept.getDepartment_name()%></td>
								<td><%=dept.getManager_id()%></td>
								<td><%=dept.getLocation()%></td>
							</tr>
							<%
							} else { // 첫 번째 페이지에 행 출력
							%>
							<tr id="firstPage" name="clikedRow">
								<td><%=String.format("%03d", i + 1)%></td>
								<td><%=dept.getDepartment_id()%></td>
								<td><%=dept.getDepartment_name()%></td>
								<td><%=dept.getManager_id()%></td>
								<td><%=dept.getLocation()%></td>
							</tr>
							<%
							}
							}
							} else if (i >= 10 && i < 20) { // lists의 크기를 넘어가는 경우 빈 행 추가 (두 번째 페이지)
							%>
							<tr id="secondPage" style="display: none; color: white;">
								<td><%=String.format("%03d", i + 1)%></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<%
							} else if (i >= 20 && i < 30) { // lists의 크기를 넘어가는 경우 빈 행 추가 (세 번째 페이지)
							%>
							<tr id="thirdPage" style="display: none; color: white;">
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
				if(lists027 == null && lists028 == null){
				int totalPages = (int) Math.ceil((double) lists026.size() / 10);
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
			            if (row.id === "firstPage" || row.id === "secondPage" || row.id === "thirdPage") {
			                if (row.id === "firstPage" && pageId == 1) {
			                    row.style.display = "table-row";
			                } else if ((row.id === "secondPage" || row.id === "thirdPage")) {
			                    var rowIndex = parseInt(row.cells[0].innerText) - 1;
			                    if (rowIndex >= (pageId - 1) * 10 && rowIndex < pageId * 10) {
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
			
			        currentPage = pageId; // 현재 페이지 업데이트
			    }
			
			    function prevPage() {
			        if (currentPage > 1) {
			            viewPage(currentPage - 1);
			        }
			    }
			
			    function nextPage() {
			        var totalPages = <%=Math.ceil((double) lists026.size() / 10)%>;
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