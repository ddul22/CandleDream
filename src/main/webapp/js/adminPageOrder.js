/**
 * 
 */

getUserInfo();

getOrderList();

function getUserInfo() {

	fetch('getUserInfo.do?userNo=' + userNo)
		.then((result) => result.json())
		.then((result) => {
			console.log(result);
			document.querySelector('#nav_user_name').innerHTML = result.userName + ' 님, 환영합니다';
		})
		.catch((error) => console.log(error));
}

function getOrderList() {

	document.querySelector('#order_list').innerHTML = '';

	fetch('adminPageOrderList.do')
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

	orderInfo.forEach((order) => {
		let sum = 0;
		let itemNames = '';

		let html2 = `<tr>
			<td colspan="12" class="hiddenRow">
			<div class="accordian-body collapse" id="order${order.orderNo}">
				<table class="table table-secondary text-center">
					<thead>
						<tr class="info">
							<th>상품명</th>
							<th>상품수량</th>
							<th>상품가격</th>
							<th>상품총액</th>
						</tr>
					</thead>
					<tbody>`;
		order.itemList.forEach((item, index, array) => {

			sum += item.orderItemCount * item.orderItemPrice;

			if (index == 0) {
				itemNames = item.itemName;

				if (array.length > 1) {
					itemNames += '외 ' + (array.length - 1) + '종';
				}
			}

			html2 += `<tr>
				<td>${item.itemName}</td>
				<td>${item.orderItemCount}</td>
				<td>${item.orderItemPrice}</td>
				<td>${item.orderItemPrice * item.orderItemCount}</td>
			</tr>`;
		});

		html2 += `</tbody>
			</table>
			</div>
		</td>
	</tr>`
		let statusStr = '';

		if (order.orderStatus == 1) {
			statusStr = '주문취소';
		} else if (order.orderStatus == 2) {
			statusStr = '주문완료';
		} else if (order.orderStatus == 3) {
			statusStr = '배송중';
		} else if (order.orderStatus == 4) {
			statusStr = '배송완료';
		}

		let html1 = `
			<tr data-toggle="collapse" data-target="#order${order.orderNo}"
			class="accordion-toggle">
			<td>${order.orderNo}</td>
			<td>${order.userId}</td>
			<td>${itemNames}</td>
			<td>${sum}</td>
			<td>${order.orderDate}</td>
			<td>${statusStr}</td>
			<td>${order.orderStatus == 2 ? `<button class="btn btn-danger" onclick="updateOrderStatus('${order.orderNo}')">배송처리</button>` : ''}</td>
		</tr>`;

		let html = html1 + html2;

		document.querySelector('#order_list').insertAdjacentHTML('beforeend', html);
	});
}

function updateOrderStatus(orderNo) {
	fetch('updateOrderStatus.do?orderNo=' + orderNo)
		.then((result) => result.json())
		.then((result) => {
			if (result.retCode == 'OK') {
				getOrderList();
			} else if (result.retCode == 'NG') {
				Swal.fire({
					title: "배송처리 실패",
					text: "배송처리 중 오류가 발생했습니다",
					icon: "error",
					confirmButtonText: "확인",
					confirmButtonColor: "#fd7e14"
				});
			}
		})
		.catch((error) => {
			console.log(error)
			Swal.fire({
				title: "배송처리 실패",
				text: "배송처리 중 오류가 발생했습니다",
				icon: "error",
				confirmButtonText: "확인",
				confirmButtonColor: "#fd7e14"
			});
		});
}