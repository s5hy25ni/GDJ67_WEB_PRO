function submitForm() {
  var selectElement;
  var selectedValue;
  var form = document.createElement("form");
  form.method = "POST";
  form.action = "/web_project/empCtrl.do";

  // hiddenField input 생성
  var hiddenField = document.createElement("input");
  hiddenField.type = "hidden";

  // check which select element triggered the function
  if (event.target.id === "deptIdSelect") {
    selectElement = document.getElementById("deptIdSelect");
    selectedValue = selectElement.options[selectElement.selectedIndex].value;
    hiddenField.name = "deptIdSelect";
  } else if (event.target.id === "jobIdSelect") {
    selectElement = document.getElementById("jobIdSelect");
    selectedValue = selectElement.options[selectElement.selectedIndex].value;
    hiddenField.name = "jobIdSelect";
  }

  if (selectedValue != "all") {
    hiddenField.value = selectedValue;

    // hidden field form에 append
    form.appendChild(hiddenField);

    // form append시키고 submit
    document.body.appendChild(form);
    form.submit();
  } else {
    location.href = './empCtrl.do';
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
  var clicked = document.getElementsByName("clickedRow");
  for (let i = 0; i < clicked.length; i++) {
    clicked[i].addEventListener("click", function() {
      var empId = this.getElementsByTagName("td")[1].textContent;

      // 팝업창에 열기
      var url = "/web_project/empCtrl.do?empIdClicked=" + empId;
      var title = "사원 정보 수정 및 삭제";
      var prop = "top=120px, left=300px, width=650px, height=360px";
      var popup = window.open(url, title, prop);
      popup.focus();
    });
  }
};