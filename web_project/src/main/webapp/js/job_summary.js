/**
 * 
 */
function submitForm() {
	var selectElement = document
	.getElementById("jobIdSelect");
	var selectedJobId = selectElement.options[selectElement.selectedIndex].value;

	// form 생성
	var form = document.createElement("form");
	form.method = "GET";
	form.action = "http://localhost:8080/web_project/job_details_html.html";

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
														