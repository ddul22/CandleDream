<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.hiddenRow {
	padding: 0 !important;
}
</style>

<div class="col-1"></div>
<div class="col-11">
	<h4 class="mb-1 mt-3">주문내역</h4>
	<h5 class="mb-3 mt-1">(클릭 시 상세내역 확인)</h5>
	<div class="panel panel-default">
		<div class="panel-body">
			<table class="table table-condensed text-center">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>주문상품</th>
						<th>주문가격</th>
						<th>주문일자</th>
						<th>주문상태</th>
					</tr>
				</thead>
				<tbody id="order_list">
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	document.querySelector('#my_page_order').className += ' active';

	let userNo = '${userNo}';
</script>
<script src="js/myPageOrder.js"></script>