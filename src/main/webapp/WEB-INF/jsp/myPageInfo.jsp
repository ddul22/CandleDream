<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-1"></div>
<div class="col-6">
	<h4 class="mb-5 mt-5">회원정보 수정</h4>

	<hr class="my-4">

	<div class="row g-3">
		<div class="col-12 mb-3">
			<label for="user_id" class="form-label">아이디</label> <input
				type="email" class="form-control" id="user_id" placeholder=""
				readonly>
		</div>

		<div class="col-12 mb-3">
			<label for="user_name" class="form-label">이름</label> <input
				type="email" class="form-control" id="user_name" placeholder=""
				readonly>
		</div>

		<div class="col-12 mb-3">
			<label for="user_tel" class="form-label">전화번호</label> <input
				type="text" class="form-control" id="user_tel" placeholder=""
				required>
		</div>

		<div class="col-12 mb-3">
			<label for="user_address" class="form-label">주소</label> <input
				type="text" class="form-control" id="user_address" placeholder=""
				required>
		</div>

		<div class="col-12">
			<label for="user_email" class="form-label">이메일 (선택)</label> <input
				type="email" class="form-control" id="user_email" placeholder="">
		</div>
	</div>

	<hr class="my-4">

	<button class="w-100 btn btn-primary btn-lg mb-5"
		onclick="updateUserInfo()">회원정보 수정</button>
</div>
<div class="col-5"></div>

<script>

document.querySelector('#my_page_info').className += ' active';

let userNo = '${userNo}';

console.log(userNo);

getUserInfo();

function getUserInfo() {

	fetch('getUserInfo.do?userNo=' + userNo)
	.then((result) => result.json())
	.then((result) => {
		console.log(result);
		document.querySelector('#nav_user_name').innerText = result.userName + ' 님, 환영합니다';
		document.querySelector('#user_id').value = result.userId;
		document.querySelector('#user_name').value = result.userName;
		document.querySelector('#user_tel').value = result.userTel;
		document.querySelector('#user_address').value = result.userAddress;
		document.querySelector('#user_email').value = result.userEmail;
	})
	.catch((error) => console.log(error));
}

function updateUserInfo() {
	
	let userTel = document.querySelector('#user_tel').value;
	let userAddress = document.querySelector('#user_address').value;
	let userEmail = document.querySelector('#user_email').value;
	
	fetch('updateUserInfo.do?userNo=' + userNo + 
			"&userTel=" + userTel + 
			"&userAddress=" + userAddress +
			"&userEmail=" + userEmail)
	.then((result) => result.json())
	.then((result) => {
		console.log(result);
		if (result.retCode == 'OK') {
			alert('회원 정보가 수정되었습니다')
			getUserInfo();
		} else if (result.retCode == 'NG') {
			alert('회원 정보 수정에 실패했습니다')
		}
	})
	.catch((error) => console.log(error));
}

</script>
