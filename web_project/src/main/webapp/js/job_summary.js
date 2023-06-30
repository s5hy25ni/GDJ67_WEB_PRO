/**
 * 
 */
function submitForm() {
	var selectElement = document
	.getElementById("jobIdSelect");
	var selectedJobId = selectElement.options[selectElement.selectedIndex].value;

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
}

onload = function(){
	var clicked = document.getElementsByName("clikedRow");
	for(let i=0; i<clicked.length; i++){
		clicked[i].addEventListener("click", function(){
			var url = "job_details_html.html";
			var title = "직무 상세 조회";
			var prop = "top=120px, left=300px, width=650px, height=360px";
			window.open(url, title, prop);
		})
	}
}

function openRunningMan(){
	window.open("./sal_run.html");
}										