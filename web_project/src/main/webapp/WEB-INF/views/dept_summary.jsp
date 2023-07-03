<%@page import="com.hr.pro.dto.Admin_DTO"%>
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
<script type="text/javascript" src="./js/outline.js"></script>
<script type="text/javascript" src="./js/dept_summary.js"></script>
</head>
<%
HttpSession loginSession = request.getSession();
List<Admin_DTO> admins = (List<Admin_DTO>) loginSession.getAttribute("SuccessUser");
List<Dept_DTO> lists026 = (List<Dept_DTO>) request.getAttribute("lists026");
List<Dept_DTO> lists027 = (List<Dept_DTO>) request.getAttribute("lists027");
List<Dept_DTO> lists028 = (List<Dept_DTO>) request.getAttribute("lists028");
String deptIdSelect = (String) request.getParameter("deptIdSelect");
String deptNameSelect = (String) request.getParameter("deptNameSelect");
%>
<body>
	<div id="outline">
		<header>
            <div id="logo"></div>
            <div class="menus"><h3 class="menuMove" id="emp">직원 관리</h3></div>
            <div class="menus"><h3 class="menuMove" id="dept">부서 관리</h3></div>
            <div class="menus"><h3 class="menuMove" id="job">직무 관리</h3></div>
       		<div id="isLoginTrue">
       			<div id="login_notify">
       				<div id="lastLogin"><%=admins.get(0).getLast_login() %></div>
       				<input id="notifyBtn" type="button" value="신고">
       			</div>
       			<div id="login_extension">
                   <div id="login_timer"></div>
                  	<input id="login_extension_btn" type="button" value="연장">
               </div>
        		<div>
        		<form name="logout" action="/web_project/logout.do" method="post">
        			<input id="logoutBtn" type="button" >
        			<input type="hidden" name="cmd" value="logout">
       			</form>
              	</div>
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
						<input type="button" onclick="searchName()"> <input
							id="searchName" type="text" placeholder="부서명으로 검색">
					</div>
				</div>
			</section>
			<section id="content">
				<div id="top">
					<%
						if (lists027 != null) {
							%>
							<div>구분: DEPT_ID(<%=deptIdSelect %>), 행: <%=lists027.size()%></div>
							<%
					    } else if (lists028 != null) {
					    	%>
							<div>구분: DEPT_NAME(<%=deptNameSelect %>), 행: <%=lists028.size()%></div>
							<%
					    } else {
					    	%>
							<div>구분: 전체, 행: <%=lists026.size()%></div>
							<%
					    }
					%>
					<form name="excelDown" action="/web_project/excel.do" method="post">
						<input type="hidden" name="excel" value="dept">
						<input id="download" type="button" value="엑셀 다운로드">
					</form>
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
								int totalRows = lists028.size(); // 전체 행 수
								int totalPage = (int) Math.ceil((double) totalRows / 10); // 전체 행 수를 10행씩 계산하여 나온 페이지

								for (int i = 1; i <= totalPage; i++) { //한 페이지 당
								for (int j = (i - 1) * 10; j < i * 10; j++) { // 10행씩
								if (j < totalRows) {
									Dept_DTO dept = lists028.get(j);
									if (i > 1) {
								%>
								<tr id="Page_<%=i%>_<%=j%>" style="display: none;"
									name="clikedRow">
									<!-- 2페이지부터는 숨기기, 각 페이지 id 만들어주기(script처리위해) -->
									<td><%=String.format("%03d", j + 1)%></td>
									<td><%=dept.getDepartment_id()%></td>
									<td><%=dept.getDepartment_name()%></td>
									<td><%=dept.getManager_id()%></td>
									<td><%=dept.getLocation()%></td>
								</tr>
								<%
								} else {
								%>
								<tr id="Page_<%=i%>_<%=j%>" name="clikedRow">
									<!-- 1페이지 출력 -->
									<td><%=String.format("%03d", j + 1)%></td>
									<td><%=dept.getDepartment_id()%></td>
									<td><%=dept.getDepartment_name()%></td>
									<td><%=dept.getManager_id()%></td>
									<td><%=dept.getLocation()%></td>
								</tr>
								<%
								}
								} else { //출력 행 수가 10단위가 아니면 나머지는 빈행 출력 (10행 맞추려고) //근데 왜 안되지..?
								%>
								<tr id="Page_<%=i%>_<%=j%>" style="display: none;">
									<td style="color: white"><%=String.format("%03d", j + 1)%></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<%
								}
								}
								}
							}

							if (deptIdSelect == null && deptNameSelect == null) {
							int totalRows = lists026.size(); // 전체 행 수
							int totalPage = (int) Math.ceil((double) totalRows / 10); // 전체 행 수를 10행씩 계산하여 나온 페이지

							for (int i = 1; i <= totalPage; i++) { //한 페이지 당
							for (int j = (i - 1) * 10; j < i * 10; j++) { // 10행씩
							if (j < totalRows) {
								Dept_DTO dept = lists026.get(j);
								if (i > 1) {
							%>
							<tr id="Page_<%=i%>_<%=j%>" style="display: none;"
								name="clikedRow">
								<!-- 2페이지부터는 숨기기, 각 페이지 id 만들어주기(script처리위해) -->
								<td><%=String.format("%03d", j + 1)%></td>
								<td><%=dept.getDepartment_id()%></td>
								<td><%=dept.getDepartment_name()%></td>
								<td><%=dept.getManager_id()%></td>
								<td><%=dept.getLocation()%></td>
							</tr>
							<%
							} else {
							%>
							<tr id="Page_<%=i%>_<%=j%>" name="clikedRow">
								<!-- 1페이지 출력 -->
								<td><%=String.format("%03d", j + 1)%></td>
								<td><%=dept.getDepartment_id()%></td>
								<td><%=dept.getDepartment_name()%></td>
								<td><%=dept.getManager_id()%></td>
								<td><%=dept.getLocation()%></td>
							</tr>
							<%
							}
							} else { //출력 행 수가 10단위가 아니면 나머지는 빈행 출력 (10행 맞추려고) //근데 왜 안되지..?
							%>
							<tr id="Page_<%=i%>_<%=j%>" style="display: none;">
								<td style="color: white"><%=String.format("%03d", j + 1)%></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<%
							}
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
				int totalPages = 0;
				if(lists027 == null && lists028 == null){
					totalPages = (int) Math.ceil((double) lists026.size() / 10);
				} else {
				    if (lists027 != null) {
					      totalPages = (int) Math.ceil((double) lists027.size() / 10);
					    } else if (lists028 != null) {
					      totalPages = (int) Math.ceil((double) lists028.size() / 10);
					    } 
					  }
					%>
				  <input class="page" type="button" value="&lt;" onclick="prevPage()">
				  <%
				  for (int i = 1; i <= totalPages; i++) {
				  %>
				  <input class="page" type="button" value="<%=i%>" onclick="viewPage(<%=i%>)">
				  <%
				  }
				  %>
				  <input class="page" type="button" value="&gt;" onclick="nextPage()">
			</section>
			<script type="text/javascript">
			    var currentPage = 1;
			
			    function viewPage(pageId) {
			        var rows = document.getElementsByName("clikedRow");
			
			        for (var i = 0; i < rows.length; i++) {
			            var row = rows[i];
			            var page = row.id.split("_")[1];
			            if (page === String(pageId)) {
			                row.style.display = "table-row";
			            } else {
			                row.style.display = "none";
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
	<div id="hidden">
		<p id="admin"><%=admins %></p>
		<p id="isLogin"><%=loginSession.getAttribute("isLogin") %></p>
		<form name="notify" method="POST" data-email="s5hy25ni@gmail.com" 
		action="https://script.google.com/macros/s/AKfycbzC0qfRmnKei7-xoi1RAqRzt59NwArRo8irCvvxEMpWm_fQ_OTRiRL8eJC0TO7KJIr2Nw/exec"
		target="frAttachFiles"
		style="display:none">;
		<%
			if(admins != null){
			%>
			<input type="text" name="subject" value="[ADMIN] 타인 로그인 의심 신고">
			<input type="text" name="name" value="<%=admins.get(0).getAdmin_id()%>" readonly="readonly">
			<input type="text" name="time" value="<%=admins.get(0).getLast_login()%>" readonly="readonly">
			<%
			}
		%>
		</form>
		<iframe name="frAttachFiles" style="display:none"></iframe>
	</div>
</body>
</html>