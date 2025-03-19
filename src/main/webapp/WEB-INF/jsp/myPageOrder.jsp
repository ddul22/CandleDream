<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.hiddenRow {
	padding: 0 !important;
}
</style>

<div class="col-1"></div>
<div class="col-11">
	<h4 class="mb-5 mt-5">주문 내역</h4>

	<div class="panel panel-default">
		<div class="panel-body">
			<table class="table table-condensed table-striped">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>주문상품</th>
						<th>주문일자</th>
						<th>주문가격</th>
						<th>주문상태</th>
					</tr>
				</thead>
				<tbody>
					<tr data-toggle="collapse" data-target="#demo1"
						class="accordion-toggle">
						<td>55</td>
						<td>11</td>
						<td>22</td>
						<td>33</td>
						<td>44</td>
					</tr>

					<tr>
						<td colspan="12" class="hiddenRow">
							<div class="accordian-body collapse" id="demo1">
								<table class="table table-striped">
									<thead>
										<tr class="info">
											<th>상품명</th>
											<th>상품수량</th>
											<th>상품가격</th>

										</tr>
									</thead>

									<tbody>
										<tr>
											<td>Scrum Master</td>
											<td>Google</td>
											<td>U$8.00000</td>
										</tr>
									</tbody>
								</table>

							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>

let userNo = '${userNo}';

console.log(userNo);

getUserInfo();

getOrderInfo();

function getUserInfo() {

	fetch('getUserInfo.do?userNo=' + userNo)
	.then((result) => result.json())
	.then((result) => {
		console.log(result);
		document.querySelector('#nav_user_name').innerText = result.userName + ' 님, 환영합니다';
	})
	.catch((error) => {
		console.log(error);
	});
	
}

function getOrderInfo() {
	
	fetch('getOrderInfo.do?userNo=' + userNo)
	.then((result) => result.json())
	.then((result) => {
		console.log(result);
		drawOrderInfo(result);
	})
	.catch((error) => {
		console.log(error);
	});
}

function drawOrderInfo(orderInfo = []) {
	
}

</script>
