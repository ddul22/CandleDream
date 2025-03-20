<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="col-3"></div>
		<div class="col-6">
			<h4 class="mb-3 mt-3">로그인</h4>

			<hr class="my-4">

			<form action="login.do" method="post">
				<div class="row g-3">
					<div class="col-12 mb-3">
						<label for="user_id" class="form-label">아이디</label> <input
							type="text" class="form-control" id="user_id" placeholder=""
							required name="id">
					</div>

					<div class="col-12 mb-3">
						<label for="user_pwd" class="form-label">비밀번호</label> <input
							type="password" class="form-control" id="user_pwd" placeholder=""
							required name="pwd">
					</div>
				</div>

				<hr class="my-4">

				<button class="w-100 btn btn-danger btn-lg mb-3" type="submit">로그인</button>
				<button class="w-100 btn btn-secondary btn-lg mb-3"
					onclick="document.location='addUserForm.do'">회원가입</button>
			</form>
		</div>
		<div class="col-3"></div>
	</div>
</div>


<script>
	let msg = `${msg}`;

	console.log(msg);
	if (msg == '1') {
		msg = '';
		Swal.fire({
			  title: "로그인 성공",
			  text : "환영합니다!",
			  confirmButtonText: "메인으로",
			  confirmButtonColor: "#fd7e14"
		}).then((result) => {
			window.location.href='main.do';
		});
	} else if (msg == '2') {
		msg = '';
		Swal.fire({
			title : "로그인 실패",
			text : "아이디와 비밀번호를 확인해주세요",
			icon : "error",
			confirmButtonText: "확인",
			confirmButtonColor: "#fd7e14"
		});
	} 
	
</script>



