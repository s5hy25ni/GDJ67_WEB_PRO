/**
 * 
 */
 
/*onlaod=function(){
	document.getElementById("gologinBtn").onclick=goLogin();
}*/

function goLogin(){
	location.href="./login.jsp"
}

function logout(){
	location.href="./logout.jsp"
}

function notify(){
	document.getElementsByTagName("form")[0].submit();
	alert("신고가 완료되었습니다.");
}