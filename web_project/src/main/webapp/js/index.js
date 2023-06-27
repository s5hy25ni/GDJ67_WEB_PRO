/**
 * 
 */
 
onload = function(){
    document.querySelector("body").addEventListener("click", changeBorder);
    this.document.getElementById("user_id").onfocus = changeBorder;
    this.document.getElementById("user_pw").onfocus = changeBorder;
    this.document.getElementById("checkbox_label").onclick = view_pw;
    this.document.getElementById("login_submit").onclick = check_login_info;
}

function changeBorder(e){
    if(e.target.id == "user_id"){
        document.getElementById("login_id").style.borderColor="rgb(46,204,113)";
        document.getElementById("login_pw").style.borderColor="rgb(190,190,190)";
    } else if (e.target.id == "user_pw"){
        document.getElementById("login_id").style.borderColor="rgb(190,190,190)";
        document.getElementById("login_id").style.borderBottomColor="rgb(46,204,113)";
        document.getElementById("login_pw").style.borderColor="rgb(46,204,113)";
    } else {
        document.getElementById("login_id").style.borderColor="rgb(190,190,190)";
        document.getElementById("login_pw").style.borderColor="rgb(190,190,190)";
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
        document.getElementById("user_id").focus0();
    } else if(document.getElementById("user_pw").value==""){
        document.getElementById("login_confirm").style.display="block";
        document.getElementById("login_confirm").textContent = "※ 비밀번호를 입력해주세요."
        document.getElementById("user_id").focus();
    } else {
        document.getElementById("login_confirm").style.display="none";
    }
}