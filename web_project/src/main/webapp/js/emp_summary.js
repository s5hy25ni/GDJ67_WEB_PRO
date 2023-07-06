document.addEventListener("DOMContentLoaded", function(){
	var date = new Date();
	var year = date.getFullYear();
	var month = (""+(date.getMonth()+1)).length<2?("0"+(date.getMonth()+1)):(""+(date.getMonth()+1));
	var date = (""+date.getDate()).length<2?("0"+date.getDate()):(""+date.getDate());
	var today = year+"-"+month+"-"+date;
	
	var minDate = document.getElementById("minDate");
	var maxDate = document.getElementById("maxDate");
	
	minDate.setAttribute("min", "2001-01-01");
	minDate.setAttribute("max", today);
	maxDate.setAttribute("min", "2001-01-01");
	maxDate.setAttribute("max", today);
	
	document.getElementById("download").addEventListener("click",function(){
		document.excelDown.submit();
	})
	
	document.getElementsByClassName("page")[0].classList.add("active");
		
});

function dateSubmitForm(){
	var selectMinElement = document.getElementById("minDate").value;
	var selectMaxElement = document.getElementById("maxDate").value;
	
	if(selectMinElement == "" || selectMaxElement == ""){
		alert("모든 값을 입력해주세요.");
	} else {
	// form 생성
	var form = document.createElement("form");
	form.method = "POST";
	form.action = "/web_project/empCtrl.do";
	
	//hiddenField input 생성
	var hiddenMinField = document.createElement("input");
	hiddenMinField.type = "hidden";
	hiddenMinField.name = "minDate"; // Changed the name to match the parameter name
	hiddenMinField.value = selectMinElement;
	
	var hiddenMaxField = document.createElement("input");
	hiddenMaxField.type = "hidden";
	hiddenMaxField.name = "maxDate"; // Changed the name to match the parameter name
	hiddenMaxField.value = selectMaxElement;

	// hidden field form에 append
	form.appendChild(hiddenMinField);
	form.appendChild(hiddenMaxField);

	// form append시키고 submit
	document.body.appendChild(form);
	form.submit();
	}
}

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

function salarySubmitForm(){
	var selectMinElement = document.getElementById("minSalary").value;
	var selectMaxElement = document.getElementById("maxSalary").value;
	
	if(selectMinElement == "" || selectMaxElement == ""){
		alert("모든 값을 입력해주세요.");
	} else {
	// form 생성
	var form = document.createElement("form");
	form.method = "POST";
	form.action = "/web_project/empCtrl.do";
	
	//hiddenField input 생성
	var hiddenMinField = document.createElement("input");
	hiddenMinField.type = "hidden";
	hiddenMinField.name = "minSalary"; // Changed the name to match the parameter name
	hiddenMinField.value = selectMinElement;
	
	var hiddenMaxField = document.createElement("input");
	hiddenMaxField.type = "hidden";
	hiddenMaxField.name = "maxSalary"; // Changed the name to match the parameter name
	hiddenMaxField.value = selectMaxElement;

	// hidden field form에 append
	form.appendChild(hiddenMinField);
	form.appendChild(hiddenMaxField);

	// form append시키고 submit
	document.body.appendChild(form);
	form.submit();
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
  var clicked = document.getElementsByClassName("clikedRow");
  for (let i = 0; i < clicked.length; i++) {
    clicked[i].addEventListener("click", function() {
      var empId = this.getElementsByTagName("td")[1].textContent;
		console.log(empId);
      // 팝업창에 열기
      var url = "/web_project/empCtrl.do?empIdClicked=" + empId;
      var title = "사원 정보 수정 및 삭제";
      var prop = "top=120px, left=300px, width=650px, height=380px";
      var popup = window.open(url, title, prop);
      popup.focus();
    });
  }
};