<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-1"></div>
<div class="col-11">
	<h4 class="mb-3 mt-3">상품관리</h4>

	<div class="panel panel-default">
		<div class="panel-body">
			<table class="table text-center">
				<thead>
					<tr>
						<th>상품번호</th>
						<th>상품분류</th>
						<th>상품명</th>
						<th>상품가격</th>
						<th>상품상태</th>
					</tr>
				</thead>
				<tbody id="item_list">
				</tbody>
			</table>
		</div>
	</div>
	<hr class="my-4">

	<button class="w-25 btn btn-danger btn-lg mb-5"
		onclick="window.location.href='addItem.do'">상품추가</button>
</div>
<script>
	document.querySelector('#admin_page_item').className += ' active';

	let userNo = '${userNo}';

	console.log(userNo);
</script>
<script src="js/adminPageItem.js"></script>