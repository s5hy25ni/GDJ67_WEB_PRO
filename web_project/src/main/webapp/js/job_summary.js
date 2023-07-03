/**
 * 
 */
document.addEventListener("DOMContentLoaded", function(){
	
	document.getElementById("download").addEventListener("click",function(){
		document.excelDown.submit();
	})
		
});

function submitForm() {
	var selectElement = document
	.getElementById("jobIdSelect");
	var selectedJobId = selectElement.options[selectElement.selectedIndex].value;
	if(selectedJobId != "all"){
	// form 생성
	var form = document.createElement("form");
	form.method = "POST";
	form.action = "/web_project/jobCtrl.do";

	//hiddenField input 생성
	var hiddenField = document.createElement("input");
	hiddenField.type = "hidden";
	hiddenField.name = "jobIdSelect"; // Changed the name to match the parameter name
	hiddenField.value = selectedJobId;

	// hidden field form에 append
	form.appendChild(hiddenField);

	// form append시키고 submit
	document.body.appendChild(form);
	form.submit();
	} else {
		location.href='./jobCtrl.do';
	}
}

function searchName(){
	var selectElement = document.getElementById("searchName");
	var selectedjobTitle = selectElement.value;
	
	
	var regEx = /^[a-zA-Z\s]*$/;
	if(!regEx.test(selectedjobTitle)){
		alert("영문만 입력해주세요");
	} else if(selectedjobTitle.length == 1){
		alert("두자리 이상 검색해주세요");
		return;
	}
	
	// form 생성
	var form = document.createElement("form");
	form.method = "POST";
	form.action = "/web_project/jobCtrl.do";

	//hiddenField input 생성
	var hiddenField = document.createElement("input");
	hiddenField.type = "hidden";
	hiddenField.name = "jobTitleSelect"; // Changed the name to match the parameter name
	hiddenField.value = selectedjobTitle;

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
      var jobId = this.getElementsByTagName("td")[1].textContent;

      // 팝업창에 열기
      var url = "/web_project/jobCtrl.do?jobIdClicked=" + jobId;
      var title = "부서 정보 수정 및 삭제";
      var prop = "top=120px, left=300px, width=650px, height=360px";
      var popup = window.open(url, title, prop);
      popup.focus();
    });
  }
};

function openRunningMan(){
	window.open("./sal_run.html");
}										