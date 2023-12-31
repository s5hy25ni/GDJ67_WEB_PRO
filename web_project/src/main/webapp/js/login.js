/**
 * 
 */
onload = function(){
    this.document.getElementById("user_id").onfocus = inputFocus;
    this.document.getElementById("user_pw").onfocus = inputFocus;
    this.document.getElementById("user_id").onblur = inputBlur;
    this.document.getElementById("user_pw").onblur = inputBlur;
    this.document.getElementById("checkbox_label").onclick = view_pw;
    this.document.getElementById("login_submit").onclick = check_login_info;
    this.document.addEventListener("keyup", check_key);
    
    document.getElementById("logo").addEventListener("click", home);
    
	var isLogin = document.querySelector("#hidden>#isLogin").textContent;
	
    if(isLogin == "success"){
		failureCnt = 0;
		location.href="/web_project"
	} else if(failureCnt==5){
		alert("로그인 시도 횟수가 너무 많습니다. 5분 후 다시 시도해주세요.");
	} else if(isLogin == "failure"){
		document.getElementById("login_confirm").style.display="block";
        document.getElementById("login_confirm").textContent = "※ 아이디와 비빌번호를 확인해주세요."
       	document.getElementById("user_pw").focus();
	}

}

function noBack(){window.history.forward();}

function inputFocus(e){
    if(e.target.id == "user_id"){
        document.getElementById("login_id").className = "login_input login_input_sel";
    } else {
        document.getElementById("login_pw").className = "login_input login_input_sel";
    }
}

function inputBlur(e){
    if(e.target.id == "user_id"){
        document.getElementById("login_id").className = "login_input";
    } else {
        document.getElementById("login_pw").className = "login_input";
    } 
}

function view_pw(){
    if(document.getElementById("checkbox").checked){
        document.getElementById("user_pw").type="text";
    } else {
        document.getElementById("user_pw").type="password";
    }
}

function check_login_info(){		
    if(document.getElementById("user_id").value==""){
        document.getElementById("login_confirm").style.display="block";
        document.getElementById("login_confirm").textContent = "※ 아이디를 입력해주세요."
        document.getElementById("user_id").focus();
    } else if(document.getElementById("user_pw").value==""){
        document.getElementById("login_confirm").style.display="block";
        document.getElementById("login_confirm").textContent = "※ 비밀번호를 입력해주세요."
        document.getElementById("user_pw").focus();
    } else {
        document.getElementById("login_confirm").style.display="none";
        document.login_info.submit();
    }
}

function check_key(e){
	if (e.keyCode === 13){
		check_login_info();
	}
}

function home(){
	location.href="http://localhost:8080/web_project";
}
