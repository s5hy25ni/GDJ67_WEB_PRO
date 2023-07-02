/**
 * 
 */

 var min;
 var sec;
 
document.addEventListener("DOMContentLoaded", function(){

	var isLogin = document.querySelector("#test>#isLogin").textContent;
	
	if(isLogin == "success"){
		clearTime(10);
		setTimer();
		goMenus();
		document.getElementById("logoutBtn").addEventListener("click", logout);
		document.getElementById("notifyBtn").addEventListener("click", notify);
		document.getElementById("login_extension_btn").addEventListener("click", function(){
			clearTime(10)
			alert("연장되었습니다.")		
		});
	} else {
		alertLogin();
		document.getElementById("loginBtn").addEventListener("click", login);
	}
	
	document.getElementById("logo").addEventListener("click", home);
	
})

function goMenus(){
	var menus = document.getElementsByClassName("menuMove");
	
	for(let i=0; i<menus.length; i++){
		menus[i].addEventListener("click", function(){
			clearTime(10);
			location.href="./"+menus[i].id+".jsp";
		})
	}
}

function alertLogin(){
	var menus = document.getElementsByClassName("menuMove");
	
	for(let i=0; i<menus.length; i++){
		menus[i].addEventListener("click", function(){
			alert("로그인 후 이용가능합니다.");
		})
	}
}

function clearTime(m){
	min = m;
	sec = min*60;
}

function setTimer(){
	let remainMin = parseInt(sec/60);
	let remainSec = sec%60;
	let timer = document.getElementById("login_timer");
		
	if(sec>0){
		timer.innerHTML =lpad(remainMin, 2)+":"+lpad(remainSec,2);
		sec--;
		setTimeout("setTimer()",1000);
	} else {
		location.href="./logout.jsp";
	}
}

function lpad(str, len){
	return (""+str).length<len?"0"+str:str;
}

function home(){
	clearTime(10);
	location.href="http://localhost:8080/web_project";
}

function logout(){
	location.href="./logout.jsp"
}

function login(){
	location.href="./login.jsp"
}

function notify(){
	clearTime(10);
	document.getElementsByTagName("form")[0].submit();
	alert("신고가 완료되었습니다.");
}