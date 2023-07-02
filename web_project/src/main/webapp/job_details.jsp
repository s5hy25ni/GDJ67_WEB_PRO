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
                    %>
                        <div class="column"><h5>JOB_ID</h5></div>
                        <input class="non_change long" value="<%=lists019.get(0).getJob_id()%>" disabled>
                    </div>
                    <div class="detail_line">
                        <div class="column"><h5>JOB_TITLE</h5></div>
                        <input class="non_change long" value="<%=lists019.get(0).getJob_title()%>" disabled>
                    </div>
                    <div class="detail_line">
                        <div class="column"><h5>MIN_SALARY</h5></div>
                        <input class="change long" type="text" value="<%=lists019.get(0).getMin_salary()%>">
                    </div>
                    <div class="detail_line">
                        <div class="column"><h5>MAX_SALARY</h5></div>
                        <input class="change long" type="text" value="<%=lists019.get(0).getMax_salary()%>">
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
            <input id="modify_btn" type="button" value="수정">
            <input id="delete_btn" type="button" value="삭제">
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