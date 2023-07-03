<%@page import="com.hr.pro.dto.Dept_DTO"%>
<%@page import="com.hr.pro.dto.Job2_DTO"%>
<%@page import="com.hr.pro.dto.Admin_DTO"%>
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
<script type="text/javascript" src="./js/outline.js"></script>
<script type="text/javascript" src="./js/emp_summary.js"></script>
</head>
<%
HttpSession loginSession = request.getSession();
List<Admin_DTO> admins = (List<Admin_DTO>)loginSession.getAttribute("SuccessUser");
List<Emp_DTO> lists001 = (List<Emp_DTO>) request.getAttribute("lists001");
List<Dept_DTO> deptAll = (List<Dept_DTO>) request.getAttribute("deptAll");
List<Job2_DTO> jobAll = (List<Job2_DTO>)request.getAttribute("jobAll");
List<Emp_DTO> lists002 = (List<Emp_DTO>) request.getAttribute("lists002");
List<Emp_DTO> lists003 = (List<Emp_DTO>) request.getAttribute("lists003");
List<Emp_DTO> lists004 = (List<Emp_DTO>) request.getAttribute("lists004");
List<Emp_DTO> lists006 = (List<Emp_DTO>) request.getAttribute("lists006");
List<Emp_DTO> lists007 = (List<Emp_DTO>) request.getAttribute("lists007");
String deptIdSelect = (String) request.getParameter("deptIdSelect");
String jobIdSelect = (String) request.getParameter("jobIdSelect");
String empNameSelect = (String) request.getParameter("empNameSelect");
String minDate = (String) request.getParameter("minDate");
String maxDate = (String) request.getParameter("maxDate");
String minSalary = (String) request.getParameter("minSalary");
String maxSalary = (String) request.getParameter("maxSalary");
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
					<div class="search_left">
						<div class="search_culomn">
							<h5>HIRE_DATE</h5>
						</div>
						<div class="search_left_value">
							<input id="minDate" type=date value="2001-01-01">
						</div>
						<div class="search_left_value">
							<input id="maxDate" type=date>
						</div>
						<input type="button" onclick="dateSubmitForm()">
					</div>
					<div class="search_center">
						<div class="search_culomn">
							<h5>DEPT</h5>
						</div>
						<div class="search_center_value">
							<%
							if (lists001 != null) {
							%>
							<select id="deptIdSelect" name="deptIdSelect">
								<%
								if (lists003 != null) {
									String value=lists003.get(0).getDepartment_name()+"("+lists003.get(0).getDepartment_id()+")";
								%>
								<option value="<%=lists003.get(0).getDepartment_id()%>"><%=value%></option>
								<option value="all">전체</option>
								<%
								} else {
								%>
								<option value="all">전체</option>
								<%								}
								for (int i = 0; i < deptAll.size(); i++) {
									String value=deptAll.get(i).getDepartment_name()+"("+deptAll.get(i).getDepartment_id()+")";
								%>
								<option value="<%=deptAll.get(i).getDepartment_id()%>"><%=value%></option>
								<%
								}
								}
								%>
							</select>
						</div>
						<input type="button" onclick="deptSubmitForm()">
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
							<input id="minSalary" type=text placeholder="min value">
						</div>
						<div class="search_left_value">
							<input id="maxSalary"  type=text placeholder="max value">
						</div>
						<input type="button" onclick="salarySubmitForm()">
					</div>
					<div class="search_center">
						<div class="search_culomn">
							<h5>JOB</h5>
						</div>
						<div class="search_center_value">
							<%
							if (lists001 != null) {
							%>
							<select id="jobIdSelect" name="jobIdSelect">
								<%
								if (lists004 != null) {
									String value=lists004.get(0).getJob_title()+"("+lists004.get(0).getJob_id()+")";
								%>
								<option value="<%=lists004.get(0).getJob_id()%>"><%=value%></option>
								<option value="all">전체</option>
								<%
								} else {
								%>
								<option value="all">전체</option>
								<%
								}
								for (int i = 0; i < jobAll.size(); i++) {
									String value=jobAll.get(i).getJob_title()+"("+jobAll.get(0).getJob_id()+")";
								%>
								<option value="<%=jobAll.get(0).getJob_id()%>"><%=value%></option>
								<%
								}
								}
								%>
							</select>
						</div>
						<input type="button" onclick="jobSubmitForm()">
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
					<%
						if (lists002 != null) {
							%>
							<div>구분: ID/NAME(<%=empNameSelect%>), 행: <%=lists002.size()%></div>
							<%
					    } else if (lists003 != null) {
							%>
							<div>구분: DEPT(<%=deptIdSelect%>), 행: <%=lists003.size()%></div>
							<%
					    } else if (lists004 != null) {
							%>
							<div>구분: JOB(<%=jobIdSelect%>), 행: <%=lists004.size()%></div>
							<%
					    } else if (lists006 != null) {
							%>
							<div>구분: HIRE_DATE(<%=minDate%>~<%=maxDate%>), 행: <%=lists006.size()%></div>
							<%
					    } else if (lists007 != null) {
							%>
							<div>구분: SALARY(<%=minSalary%>~<%=maxSalary %>), 행: <%=lists007.size()%></div>
							<%
					    } else {
							%>
							<div>구분: 전체, 행: <%=lists001.size()%></div>
							<%
					    }
					%>
					<input id="download" type="button" value="엑셀 다운로드">
				</div>
				<div id="summary">
					<table>
						<col width="6%">
						<col width="6%">
						<col width="20%">
						<col width="16%">
						<col width="10%">
						<col width="29%">
						<col width="13%">
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
							int count = 1;
							int currentPage = 1; // 현재 페이지 초기화

							if (lists003 != null) {
								int totalRows = lists003.size();
								int totalPage = (int) Math.ceil((double) totalRows / 10);  // 전체 행 수를 10행씩 계산
							    
							    for (int i = 1; i <= totalPage; i++) {
							    	for(int j =(i-1)*10; j<i*10; j++){
							    		if(j<totalRows){
								            Emp_DTO empDto = lists003.get(j);
								            String name = empDto.getFirst_name() + " " + empDto.getLast_name();
							    			if(i>1){
							    				%>
							                     <tr id="Page_<%=i%>_<%=j%>" style="display: none;" name="clikedRow">
							                        <td><%=String.format("%03d", j + 1)%></td>
							                        <td><%=empDto.getEmployee_id()%></td>
													<td><%=name%></td>
													<td><%=empDto.getHire_date()%></td>
													<td><%=empDto.getSalary()%></td>
													<td><%=empDto.getJob_title() + "(" + empDto.getJob_id() + ")"%></td>
													<td><%=empDto.getDepartment_name() + "(" + empDto.getDepartment_id() + ")"%></td>
							                    </tr>
							                    <%
							    			} else {
							    				%>
							                    <tr id="Page_<%=i%>_<%=j%>" name="clikedRow">
							                        <td><%=String.format("%03d", j + 1)%></td>
							                        <td><%=empDto.getEmployee_id()%></td>
													<td><%=name%></td>
													<td><%=empDto.getHire_date()%></td>
													<td><%=empDto.getSalary()%></td>
													<td><%=empDto.getJob_title() + "(" + empDto.getJob_id() + ")"%></td>
													<td><%=empDto.getDepartment_name() + "(" + empDto.getDepartment_id() + ")"%></td>
							                    </tr>
							                    <%
							    			}
							    		} else {
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
							if(lists004 != null){
								int totalRows = lists004.size();
								int totalPage = (int) Math.ceil((double) totalRows / 10);  // 전체 행 수를 10행씩 계산
							    
							    for (int i = 1; i <= totalPage; i++) {
							    	for(int j =(i-1)*10; j<i*10; j++){
							    		if(j<totalRows){
								            Emp_DTO empDto = lists004.get(j);
								            String name = empDto.getFirst_name() + " " + empDto.getLast_name();
							    			if(i>1){
							    				%>
							                     <tr id="Page_<%=i%>_<%=j%>" style="display: none;" name="clikedRow">
							                        <td><%=String.format("%03d", j + 1)%></td>
							                        <td><%=empDto.getEmployee_id()%></td>
													<td><%=name%></td>
													<td><%=empDto.getHire_date()%></td>
													<td><%=empDto.getSalary()%></td>
													<td><%=empDto.getJob_title() + "(" + empDto.getJob_id() + ")"%></td>
													<td><%=empDto.getDepartment_name() + "(" + empDto.getDepartment_id() + ")"%></td>
							                    </tr>
							                    <%
							    			} else {
							    				%>
							                    <tr id="Page_<%=i%>_<%=j%>" name="clikedRow">
							                        <td><%=String.format("%03d", j + 1)%></td>
							                        <td><%=empDto.getEmployee_id()%></td>
													<td><%=name%></td>
													<td><%=empDto.getHire_date()%></td>
													<td><%=empDto.getSalary()%></td>
													<td><%=empDto.getJob_title() + "(" + empDto.getJob_id() + ")"%></td>
													<td><%=empDto.getDepartment_name() + "(" + empDto.getDepartment_id() + ")"%></td>
							                    </tr>
							                    <%
							    			}
							    		} else {
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
							if (lists002 != null) {
								int totalRows = lists002.size();
								int totalPage = (int) Math.ceil((double) totalRows / 10);  // 전체 행 수를 10행씩 계산
							    
							    for (int i = 1; i <= totalPage; i++) {
							    	for(int j =(i-1)*10; j<i*10; j++){
							    		if(j<totalRows){
								            Emp_DTO empDto = lists002.get(j);
								            String name = empDto.getFirst_name() + " " + empDto.getLast_name();
							    			if(i>1){
							    				%>
							                     <tr id="Page_<%=i%>_<%=j%>" style="display: none;" name="clikedRow">
							                        <td><%=String.format("%03d", j + 1)%></td>
							                        <td><%=empDto.getEmployee_id()%></td>
													<td><%=name%></td>
													<td><%=empDto.getHire_date()%></td>
													<td><%=empDto.getSalary()%></td>
													<td><%=empDto.getJob_title() + "(" + empDto.getJob_id() + ")"%></td>
													<td><%=empDto.getDepartment_name() + "(" + empDto.getDepartment_id() + ")"%></td>
							                    </tr>
							                    <%
							    			} else {
							    				%>
							                    <tr id="Page_<%=i%>_<%=j%>" name="clikedRow">
							                        <td><%=String.format("%03d", j + 1)%></td>
							                        <td><%=empDto.getEmployee_id()%></td>
													<td><%=name%></td>
													<td><%=empDto.getHire_date()%></td>
													<td><%=empDto.getSalary()%></td>
													<td><%=empDto.getJob_title() + "(" + empDto.getJob_id() + ")"%></td>
													<td><%=empDto.getDepartment_name() + "(" + empDto.getDepartment_id() + ")"%></td>
							                    </tr>
							                    <%
							    			}
							    		} else {
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
							if (lists007 != null) {
								int totalRows = lists007.size();
								int totalPage = (int) Math.ceil((double) totalRows / 10);  // 전체 행 수를 10행씩 계산
							    
							    for (int i = 1; i <= totalPage; i++) {
							    	for(int j =(i-1)*10; j<i*10; j++){
							    		if(j<totalRows){
								            Emp_DTO empDto = lists007.get(j);
								            String name = empDto.getFirst_name() + " " + empDto.getLast_name();
							    			if(i>1){
							    				%>
							                     <tr id="Page_<%=i%>_<%=j%>" style="display: none;" name="clikedRow">
							                        <td><%=String.format("%03d", j + 1)%></td>
							                        <td><%=empDto.getEmployee_id()%></td>
													<td><%=name%></td>
													<td><%=empDto.getHire_date()%></td>
													<td><%=empDto.getSalary()%></td>
													<td><%=empDto.getJob_title() + "(" + empDto.getJob_id() + ")"%></td>
													<td><%=empDto.getDepartment_name() + "(" + empDto.getDepartment_id() + ")"%></td>
							                    </tr>
							                    <%
							    			} else {
							    				%>
							                    <tr id="Page_<%=i%>_<%=j%>" name="clikedRow">
							                        <td><%=String.format("%03d", j + 1)%></td>
							                        <td><%=empDto.getEmployee_id()%></td>
													<td><%=name%></td>
													<td><%=empDto.getHire_date()%></td>
													<td><%=empDto.getSalary()%></td>
													<td><%=empDto.getJob_title() + "(" + empDto.getJob_id() + ")"%></td>
													<td><%=empDto.getDepartment_name() + "(" + empDto.getDepartment_id() + ")"%></td>
							                    </tr>
							                    <%
							    			}
							    		} else {
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
							if(lists006 != null){
								int totalRows = lists006.size();
								int totalPage = (int) Math.ceil((double) totalRows / 10);  // 전체 행 수를 10행씩 계산
							    
							    for (int i = 1; i <= totalPage; i++) {
							    	for(int j =(i-1)*10; j<i*10; j++){
							    		if(j<totalRows){
								            Emp_DTO empDto = lists006.get(j);
								            String name = empDto.getFirst_name() + " " + empDto.getLast_name();
							    			if(i>1){
							    				%>
							                     <tr id="Page_<%=i%>_<%=j%>" style="display: none;" name="clikedRow">
							                        <td><%=String.format("%03d", j + 1)%></td>
							                        <td><%=empDto.getEmployee_id()%></td>
													<td><%=name%></td>
													<td><%=empDto.getHire_date()%></td>
													<td><%=empDto.getSalary()%></td>
													<td><%=empDto.getJob_title() + "(" + empDto.getJob_id() + ")"%></td>
													<td><%=empDto.getDepartment_name() + "(" + empDto.getDepartment_id() + ")"%></td>
							                    </tr>
							                    <%
							    			} else {
							    				%>
							                    <tr id="Page_<%=i%>_<%=j%>" name="clikedRow">
							                        <td><%=String.format("%03d", j + 1)%></td>
							                        <td><%=empDto.getEmployee_id()%></td>
													<td><%=name%></td>
													<td><%=empDto.getHire_date()%></td>
													<td><%=empDto.getSalary()%></td>
													<td><%=empDto.getJob_title() + "(" + empDto.getJob_id() + ")"%></td>
													<td><%=empDto.getDepartment_name() + "(" + empDto.getDepartment_id() + ")"%></td>
							                    </tr>
							                    <%
							    			}
							    		} else {
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
							if (deptIdSelect==null && jobIdSelect==null && empNameSelect==null && minDate==null && maxDate==null && minSalary==null && maxSalary==null) {
								int totalRows = lists001.size();
								int totalPage = (int) Math.ceil((double) totalRows / 10);  // 전체 행 수를 10행씩 계산
							    
							    for (int i = 1; i <= totalPage; i++) {
							    	for(int j =(i-1)*10; j<i*10; j++){
							    		if(j<totalRows){
								            Emp_DTO empDto = lists001.get(j);
								            String name = empDto.getFirst_name() + " " + empDto.getLast_name();
							    			if(i>1){
							    				%>
							                     <tr id="Page_<%=i%>_<%=j%>" style="display: none;" name="clikedRow">
							                        <td><%=String.format("%03d", j + 1)%></td>
							                        <td><%=empDto.getEmployee_id()%></td>
													<td><%=name%></td>
													<td><%=empDto.getHire_date()%></td>
													<td><%=empDto.getSalary()%></td>
													<td><%=empDto.getJob_title() + "(" + empDto.getJob_id() + ")"%></td>
													<td><%=empDto.getDepartment_name() + "(" + empDto.getDepartment_id() + ")"%></td>
							                    </tr>
							                    <%
							    			} else {
							    				%>
							                    <tr id="Page_<%=i%>_<%=j%>" name="clikedRow">
							                        <td><%=String.format("%03d", j + 1)%></td>
							                        <td><%=empDto.getEmployee_id()%></td>
													<td><%=name%></td>
													<td><%=empDto.getHire_date()%></td>
													<td><%=empDto.getSalary()%></td>
													<td><%=empDto.getJob_title() + "(" + empDto.getJob_id() + ")"%></td>
													<td><%=empDto.getDepartment_name() + "(" + empDto.getDepartment_id() + ")"%></td>
							                    </tr>
							                    <%
							    			}
							    		} else {
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
			  if (lists002 == null && lists003 == null && lists004 == null && lists006 == null &&lists007==null) {
			    totalPages = (int) Math.ceil((double) lists001.size() / 10);
			  } else {
			    if (lists002 != null) {
			      totalPages = (int) Math.ceil((double) lists002.size() / 10);
			    } else if (lists003 != null) {
			      totalPages = (int) Math.ceil((double) lists003.size() / 10);
			    } else if (lists004 != null) {
			      totalPages = (int) Math.ceil((double) lists004.size() / 10);
			    } else if (lists006 != null) {
				      totalPages = (int) Math.ceil((double) lists006.size() / 10);
			    } else if (lists007 != null) {
				      totalPages = (int) Math.ceil((double) lists007.size() / 10);
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