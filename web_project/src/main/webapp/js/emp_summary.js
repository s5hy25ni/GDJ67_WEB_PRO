function deptSubmitForm(){
	var selectElement = document.getElementById("deptIdSelect");
	var selectedDeptId = selectElement.options[selectElement.selectedIndex].value;
	if(selectedDeptId != "all"){
	// form 생성
	var form = document.createElement("form");
	form.method = "POST";
	form.action = "/web_project/empCtrl.do";

	//hiddenField input 생성
	var hiddenField = document.createElement("input");
	hiddenField.type = "hidden";
	hiddenField.name = "deptIdSelect"; // Changed the name to match the parameter name
	hiddenField.value = selectedDeptId;

	// hidden field form에 append
	form.appendChild(hiddenField);

	// form append시키고 submit
	document.body.appendChild(form);
	form.submit();
	} else {
		location.href='./empCtrl.do';
	}
}

function jobSubmitForm(){
	var selectElement = document.getElementById("jobIdSelect");
	var selectedjobId = selectElement.options[selectElement.selectedIndex].value;
	if(selectedjobId != "all"){
	// form 생성
	var form = document.createElement("form");
	form.method = "POST";
	form.action = "/web_project/empCtrl.do";

	//hiddenField input 생성
	var hiddenField = document.createElement("input");
	hiddenField.type = "hidden";
	hiddenField.name = "jobIdSelect"; // Changed the name to match the parameter name
	hiddenField.value = selectedjobId;

	// hidden field form에 append
	form.appendChild(hiddenField);

	// form append시키고 submit
	document.body.appendChild(form);
	form.submit();
	} else {
		location.href='./empCtrl.do';
	}
}

function searchName(){
	var selectElement = document.getElementById("searchName");
	var selectedEmpName = selectElement.value;
	
	
	var regEx = /^[a-zA-Z0-9\s]*$/;
	if(!regEx.test(selectedEmpName)){
		alert("영문 또는 숫자만 입력해주세요");
	} else if(selectedEmpName.length == 1){
		alert("두 글자 이상 검색해주세요");
		return;
	}
	
	// form 생성
	var form = document.createElement("form");
	form.method = "POST";
	form.action = "/web_project/empCtrl.do";

	//hiddenField input 생성
	var hiddenField = document.createElement("input");
	hiddenField.type = "hidden";
	hiddenField.name = "empNameSelect"; // Changed the name to match the parameter name
	hiddenField.value = selectedEmpName;

	// hidden field form에 append
	form.appendChild(hiddenField);

	// form append시키고 submit
	document.body.appendChild(form);
	form.submit();
}

onload = function() {
  var clicked = document.getElementsByName("clikedRow");
  for (let i = 0; i < clicked.length; i++) {
    clicked[i].addEventListener("click", function() {
      var empId = this.getElementsByTagName("td")[1].textContent;
		console.log(empId);
      // 팝업창에 열기
      var url = "/web_project/empCtrl.do?empIdClicked=" + empId;
      var title = "사원 정보 수정 및 삭제";
      var prop = "top=120px, left=300px, width=650px, height=360px";
      var popup = window.open(url, title, prop);
      popup.focus();
    });
  }
};