<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-1"></div>
<div class="col-6">
	<h4 class="mb-3 mt-3">상품수정</h4>

	<hr class="my-4">

	<div class="row g-3">
		<div class="col-12 mb-3">
			<label for="item_name" class="form-label">상품명</label> <input
				type="email" class="form-control" id="item_name" placeholder=""
				required>
		</div>

		<div class="col-12 mb-3">
			<label for="type_no" class="form-label">상품분류</label><br> <select
				class="form-select" id="type_no" name="type_no">
				<option value="1">CANDLE</option>
				<option value="2">YANKEE</option>
			</select>
		</div>

		<div class="col-12 mb-3">
			<label for="item_price" class="form-label">상품가격</label> <input
				type="email" class="form-control" id="item_price" placeholder=""
				required>
		</div>

		<div class="col-12 mb-3">
			<label for="item_info" class="form-label">상품설명</label>
			<textarea class="form-control" id="item_info" placeholder="" required></textarea>
		</div>

		<div class="col-12 mb-3">
			<label for="item_image" class="form-label">상품이미지</label> <input
				type="file" class="form-control" id="item_image" placeholder=""
				required>
		</div>

	</div>

	<hr class="my-4">

	<button class="w-100 btn btn-danger btn-lg mb-5" onclick="updateItem()">상품수정</button>
</div>
<div class="col-5"></div>
<script>
	document.querySelector('#admin_page_item').className += ' active';

	let userNo = '${userNo}';

	let itemNo = '${itemNo}';
</script>
<script src="js/updateItem.js"></script>