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
<script type="text/javascript">
	window.onload=function(){
		if(window.location.href.substring(window.location.href.indexOf('do')) != 'do'){			
			javascript:location.href='/web_project/empCtrl.do'
		}
	}
</script>
</head>
<body>
    <div id="outline">
        <header>
            <div id="logo"></div>
            <div class="menus"><h3><a href="./empCtrl.do">직원 관리</a></h3></div>
            <div class="menus"><h3><a href="./deptCtrl.do">부서 관리</a></h3></div>
            <div class="menus"><h3><a href="./jobCtrl.do">직무 관리</a></h3></div>
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
                        <div class="search_culomn"><h5>HIRE_DATE</h5></div>
                        <div class="search_left_value">
                            <input type=date>
                        </div>
                        <div class="search_left_value">
                            <input type=date>
                        </div>
                    </div>
                    <div class="search_center">
                        <div class="search_culomn"><h5>DEPT</h5></div>
                        <div class="search_center_value">
                            <select name="DEPT">
                                <option value="all">전체</option>
                        
                    				<option value="dept"></option>
                    	
                            </select>
                        </div>
                    </div>
                    <div class="search_right">
                        <div id="current_menu"><h5>직원관리</h5></div>
                    </div>
                </div>
                <div>
                    <div class="search_left">
                        <div class="search_culomn"><h5>SALARY</h5></div>
                        <div class="search_left_value">
                            <input type=text placeholder="min value">
                        </div>
                        <div class="search_left_value">
                            <input type=text placeholder="max value">
                        </div>
                    </div>
                    <div class="search_center">
                        <div class="search_culomn"><h5>JOB</h5></div>
                        <div class="search_center_value">
                            <select name="JOB">
                                <option value="all">전체</option>
                            </select>
                        </div>
                    </div>
                    <div class="search_right">
                        <div id="search_input">
                            <input type="button">
                            <input type="text" placeholder="ID 또는 이름 검색">
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
                            <tr onclick="">
                                <td>001</td>
                                <td>103</td>                                
                                <td>Alexander Hunold</td>
                                <td>HIRE_DATE</td>
                                <td>9,000</td>
                                <td>Programmer(IT_PROG)</td>
                                <td>IT(60)</td>
                            </tr>
                            <tr>
                                <td>002</td>
                                <td></td>                                
                                <td></td>
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
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>004</td>
                                <td></td>                                
                                <td></td>
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
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>006</td>
                                <td></td>                                
                                <td></td>
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
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>008</td>
                                <td></td>                                
                                <td></td>
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
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>010</td>
                                <td></td>                                
                                <td></td>
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