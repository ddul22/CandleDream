<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8">
			<h4 class="mb-3 mt-3">결제하기</h4>
			<hr class="my-4">
			<h5 class="mb-3 mt-3">주문자 정보</h5>
			<hr class="my-4">
			<div class="row g-3">
				<div class="col-12 mb-3">
					<label for="user_name" class="form-label">이름</label> <input
						type="email" class="form-control" id="user_name" placeholder=""
						readonly>
				</div>

				<div class="col-12 mb-3">
					<label for="user_tel" class="form-label">연락처</label> <input
						type="text" class="form-control" id="user_tel" placeholder=""
						required>
				</div>

				<div class="col-12 mb-3">
					<label for="user_address" class="form-label">배송지</label> <input
						type="text" class="form-control" id="user_address" placeholder=""
						required>
				</div>

				<div class="col-12">
					<label for="user_email" class="form-label">이메일 (선택)</label> <input
						type="email" class="form-control" id="user_email" placeholder="">
				</div>
			</div>

			<hr class="my-4">
			<h5 class="mb-3 mt-3">상품 정보</h5>
			<hr class="my-4">

			<div class="row g-3">
				<table class="table table-borderless text-center">
					<thead>
						<tr>
							<th>상품명</th>
							<th>수량</th>
							<th>가격</th>
							<th>총액</th>
						</tr>
					</thead>
					<tbody id="payPage">
					</tbody>
				</table>
			</div>

			<hr class="my-4">
			
			<div class="row justify-content-end">
				<h4 id="total"></h4>
			</div>
			
			<hr class="my-4">
			
			<div class="row justify-content-end">
				<h4 id="user_point"></h4>
			</div>

			<hr class="my-4">

			<button class="w-100 btn-danger btn-lg mb-5" id="confirm_payment">결제하기</button>
		</div>
		<div class="col-2"></div>
	</div>
</div>

<script>
	let userNo = '${userNo}';
</script>
<script src="js/payment.js"></script>
<script src="js/point.js"></script>