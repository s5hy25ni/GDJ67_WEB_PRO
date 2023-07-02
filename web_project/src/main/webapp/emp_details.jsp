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
<link rel="stylesheet" href="./css/emp_details.css">
<link rel="stylesheet" href="./css/modal.css">
</head>
<body>
    <form id="details_outline">
        <div id="detail_info">
            <div id="detail_info_top">
                <div id="detail_left"></div>
                <div id="detail_right">
                    <div class="detail_line">
                    <%
                    	List<Emp_DTO> lists005 = (List<Emp_DTO>) request.getAttribute("lists005");
                    %>
                        <div class="column"><h5>EMP_ID</h5></div>
                        <input class="non_change long" 
                        	value="<%=lists005.get(0).getEmployee_id()%>" disabled>
                    </div>
                    <div class="detail_line">
                        <div class="column"><h5>FIRST_NAME</h5></div>
                        <input class="change short" type="text"
                        	value="<%=lists005.get(0).getFirst_name()%>">
                        <div class="column"><h5>LAST_NAME</h5></div>
                        <input class="change short" type="text"
                        	value="<%=lists005.get(0).getLast_name()%>">>
                    </div>
                    <div class="detail_line">
                        <div class="column"><h5>EMAIL</h5></div>
                        <input class="non_change long" 
                        	value="<%=lists005.get(0).getEmail()%>" disabled>
                    </div>
                    <div class="detail_line">
                        <div class="column"><h5>PHONE</h5></div>
                        <input class="change long" 
                        	value="<%=lists005.get(0).getPhone_number()%>" type="text">
                    </div>
                </div>
            </div>
            <div id="detail_info_bot">
                <div class="detail_line">
                    <div class="column"><h5>DEPT</h5></div>
                    <input class="change middle" type="text"
                    	value="<%=lists005.get(0).getDepartment_id()%>">
                    <div class="column"><h5>MANAGER</h5></div>
                    <input class="non_change middle" type="text"
                    	value="<%=lists005.get(0).getManager_id()%>" disabled>
                </div>
                <div class="detail_line">
                    <div class="column"><h5>JOB</h5></div>
                    <input class="change longlong" type="text"
                    	value="<%=lists005.get(0).getJob_id()%>">
                </div>
                <div class="detail_line">
                    <div class="column"><h5>SALARY</h5></div>
                    <input class="change middle" type="text"
                    	value="<%=lists005.get(0).getSalary()%>">
                    <div class="column"><h5>COMM</h5></div>
                    <input class="change middle" type="text"
                    	value="<%=lists005.get(0).getCommission_pct()%>">
                </div>
            </div>
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