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
    
    var session = this.document.querySelectorAll("#test>p")[0].textContent;
    
    if(session == "success"){
		location.href="/web_project/index.jsp"
	} else if(session == "failure"){
		document.getElementById("login_confirm").style.display="block";
        document.getElementById("login_confirm").textContent = "※ 아이디와 비빌번호를 확인해주세요."
       	document.getElementById("user_pw").focus();
	}
}

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