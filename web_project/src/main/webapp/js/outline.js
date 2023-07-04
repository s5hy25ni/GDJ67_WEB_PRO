/**
 * 
 */

 var min;
 var sec;
 
document.addEventListener("DOMContentLoaded", function(){

	var admin = document.querySelector("#hidden>#admin").textContent;
	var isLogin = document.querySelector("#hidden>#isLogin").textContent;
	
	if(admin=="null" && isLogin=="success"){
		isLogin="failure";
	}
	
	if(isLogin == "success"){
		clearTime(10);
		setTimer();
		goMenus();
		document.getElementById("logoutBtn").addEventListener("click", logout);
		document.getElementById("notifyBtn").addEventListener("click", notify);
		document.getElementById("login_extension_btn").addEventListener("click", function(){
			alert("연장되었습니다.")	
			location.href="http://localhost:8080/web_project";
		});
	} else {
		if(window.location.href != "http://localhost:8080/web_project/"){
			location.href="http://localhost:8080/web_project";
		}
		alertLogin();
		document.getElementById("loginBtn").addEventListener("click", login);
	} 
	
	document.getElementById("logo").addEventListener("click", home);
	
	
})

function goMenus(){
	var menus = document.getElementsByClassName("menuMove");
	
	for(let i=0; i<menus.length; i++){
		menus[i].addEventListener("click", function(){
			location.href="./"+menus[i].id+"Ctrl.do";
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
		document.logout.submit();
	}
}

function lpad(str, len){
	return (""+str).length<len?"0"+str:str;
}

function home(){
	location.href="http://localhost:8080/web_project";
}

function logout(){
	document.logout.submit();
}

function login(){
	document.login.submit();
}

function notify(){
	clearTime(10);
	document.notify.submit();
	alert("신고가 완료되었습니다.");
}