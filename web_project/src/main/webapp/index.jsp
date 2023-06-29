<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/outline.css">
<link rel="stylesheet" href="./css/index.css">
</head>
<body>
	<div id="outline">
        <header>
            <div id="logo"></div>
            <div class="menus"><h3><a href="#">직원 관리</a></h3></div>
            <div class="menus"><h3><a href="#">부서 관리</a></h3></div>
            <div class="menus"><h3><a href="#">직무 관리</a></h3></div>
            <input id="logout" type="button" onclick="">
            <div id="login_extension">
                <div id="login_time"></div>
                <input id="login_extension_btn" type="button" value="연장">
            </div>
        </header>
        <main>
            <section id="info">
            	<div id="isLoginTrue">
            		<div>모든 메뉴는 로그인 후 이용 가능합니다.</div>
            		<input id="loginBtn" type="button" value="로그인">
            	</div>
            	<div id="isLoginFalse"></div>
 			</section>
 			<section id="notify">
 				<div>
 				</div>
 			</section>
        </main>
        <footer>
            <div>&copy; Developer heeae&hyeon</div>
            <div>(구디아카데미) 서울시 금천구 가산디지털2로 95, 3층 ORANGE</div>
        </footer>
    </div>
</body>
</html>