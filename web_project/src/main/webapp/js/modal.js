/**
 * 상세 화면에서 수정이나 삭제 버튼을 누를때 최종확인시키는 모달창을 띄우는 스크립트
 */
	var modifyBtn = document.getElementById("modify_btn");
	modifyBtn.addEventListener("click", function() {
		var modal = document.getElementById("confirmationModal");
		var alertMessage = document.getElementById("confirmationAlert");
		var message = document.getElementById("confirmationMessage");
		var confirmButton = document.getElementById("confirmBtn");

		modal.style.display = "block";
		alertMessage.textContent = "정말로 수정하시겠습니까?";
		message.textContent = "관련 사원의 정보도 변경됩니다.";
		confirmButton.value = "수정";
	});

	var deleteBtn = document.getElementById("delete_btn");
	deleteBtn.addEventListener("click", function() {
		var modal = document.getElementById("confirmationModal");
		var alertMessage = document.getElementById("confirmationAlert");
		var message = document.getElementById("confirmationMessage");
		var confirmButton = document.getElementById("confirmBtn");

		modal.style.display = "block";
		alertMessage.textContent = "정말로 삭제하시겠습니까?";
		message.textContent = "데이터는 5년간 보관됩니다.";
		confirmButton.value = "삭제";
	});

	var cancelBtn = document.getElementById("cancelBtn");
	cancelBtn.addEventListener("click", function() {
		var modal = document.getElementById("confirmationModal");
		modal.style.display = "none";
	});
	
	var confirmBtn = document.getElementById("confirmBtn");
	confirmBtn.addEventListener("click", function(){
		var modal = document.getElementById("confirmationModal");
		console.log(confirmBtn.value);
		if(confirmBtn.value == "수정"){
			//수정 로직 추가 (나중에..)
			alert("수정이 완료되었습니다");
		} else {
			//삭제 로직 추가 (나중에..)
			alert("삭제가 완료되었습니다");
		}
		modal.style.display = "none";
	})