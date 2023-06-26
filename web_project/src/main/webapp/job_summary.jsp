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
</head>
<body>
	<div id="outline">
        <header>
            <div id="logo"></div>
            <div class="menus"><h3><a href="#">직원 관리</a></h3></div>
            <div class="menus"><h3><a href="#">부서 관리</a></h3></div>
            <div class="menus"><h3><a href="#">직무 관리</a></h3></div>
            <input id="logout" type="button" onclick="">
        </header>
        <main>
            <section id="search">
            	<div>
                    <div class="search_center">
                        <div class="search_culomn"><h5>JOB ID</h5></div>
                        <div class="search_center_value" >
                            <select name="JOB" onchange="selectAll()">
                                <option value="all" onclick="javascript:location.href='./jobCtrl.do'">전체</option>
                               <%
                               List<Job2_DTO> lists = (List<Job2_DTO>)request.getAttribute("lists018");
                       		
                       			if(lists != null){
                       				%>
                       			<%	
								for(int i=0; i<lists.size(); i++){
								%>
									<option><%=lists.get(i).getJob_title() %></option>
								<% } %> 
								<% } %> 
                            </select>
                             <button>검색</button>
                        </div>
                    </div>
           			<div class="search_right">
                        <div id="current_menu"><h5>직무관리</h5></div>
                    </div>
	            </div>
                    <div class="search_right">
                        <div id="search_input">
                            <input type="button">
                            <input type="text" placeholder="직무명으로 검색">
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
                            <tr>
                            	<td>001</td>
                                <td>IT_PROG</td>                                
                                <td>Programmer</td>
                                <td>4,000</td>
                                <td>10,000</td>
                            </tr>
                            <tr>
                            	<td>002</td>
                                <td></td>
                                <td></td>                                
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                            	<td>003</td>
                                <td></td>
                                <td></td>                                
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                            	<td>004</td>
                                <td></td>
                                <td></td>                                
                                <td></td>
                                <td></td>
                            </tr>
                           <tr>
                           		<td>005</td>
                                <td></td>
                                <td></td>                                
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                            	<td>006</td>
                                <td></td>
                                <td></td>                                
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                            	<td>007</td>
                                <td></td>
                                <td></td>                                
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                            	<td>008</td>
                                <td></td>
                                <td></td>                                
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                            	<td>009</td>
                                <td></td>
                                <td></td>                                
                                <td></td>
                                <td></td>
                            </tr>
                           <tr>
                           		<td>010</td>
                                <td></td>
                                <td></td>                                
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <section id="page">
                <input class="page" type="button" value="&lt;">
                <!-- 행에 따라 늘어남 -->
                <input class="page" type="button" value="1">
                <input class="page" type="button" value="&gt;">
            </section>
        </main>
        <footer>
            <div>&copy; Developer heeae&hyeon</div>
            <div>(구디아카데미) 서울시 금천구 가산디지털2로 95, 3층 ORANGE</div>
        </footer>
    </div>
</body>
</html>