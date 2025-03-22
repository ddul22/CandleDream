<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="col-3"></div>
		<div class="col-6">
			<h4 class="mb-3 mt-3">회원가입</h4>

			<hr class="my-4">

			<form action="addUser.do" id="add_user_form">
				<div class="row g-3">
					<div class="col-12 mb-3">
						<label for="user_name" class="form-label">이름</label> <input
							type="text" class="form-control" id="user_name" placeholder=""
							required name="userName">
					</div>

					<div class="col-12 mb-3">
						<label for="user_id" class="form-label">아이디</label> <input
							type="text" class="form-control" id="user_id" placeholder=""
							required name="userId">
					</div>

					<div class="col-12 mb-3">
						<label for="user_pwd" class="form-label">비밀번호</label> <input
							type="password" class="form-control" id="user_pwd" placeholder=""
							required name="userPwd">
					</div>

					<div class="col-12 mb-3">
						<label for="user_pwd_confirm" class="form-label">비밀번호 확인</label> <input
							type="password" class="form-control" id="user_pwd_confirm"
							placeholder="" required>
					</div>

					<div class="col-12 mb-3">
						<label for="user_tel" class="form-label">연락처</label> <input
							type="text" class="form-control" id="user_tel" placeholder=""
							required name="userTel">
					</div>

					<div class="col-12 mb-3">
						<label for="user_address" class="form-label">주소 (배송지)</label> <input
							type="text" class="form-control" id="user_address" placeholder=""
							required name="userAddress">
					</div>

					<div class="col-12 mb-3">
						<label for="user_email" class="form-label">이메일 (선택)</label> <input
							type="email" class="form-control" id="user_email" placeholder=""
							name="userEmail">
					</div>

				</div>

				<hr class="my-4">

				<button class="w-100 btn btn-danger btn-lg mb-3" type="submit">회원가입</button>
				<button class="w-100 btn btn-secondary btn-lg mb-3"
					onclick="document.location='main.do'">취소</button>
			</form>
		</div>
		<div class="col-3"></div>
	</div>
</div>

<script>

	let msg = '${msg}';
	
	if (msg != null && msg != '') {
		Swal.fire({
			text : msg,
			icon : "warning",
			confirmButtonText: "확인",
			confirmButtonColor: "#fd7e14"
		});
	}
	
	let form = document.querySelector('#add_user_form');
	
	form.addEventListener('submit', (event) => {
		event.preventDefault();
		
		let pwd = document.querySelector('#user_pwd').value;
		let pwdConfirm = document.querySelector('#user_pwd_confirm').value;
		
		console.log(pwd, pwdConfirm);
		
		if (pwd != pwdConfirm) {
			Swal.fire({
				title : "비밀번호 불일치",
				text : "입력한 비밀번호가 일치하지 않습니다",
				icon : "warning",
				confirmButtonText: "확인",
				confirmButtonColor: "#fd7e14"
			});
			return;
		} else {
			form.submit();
		}
			
	});
</script>