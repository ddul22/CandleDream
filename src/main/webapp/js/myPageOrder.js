/**
 * 
 */

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

	orderInfo.forEach((order) => {
		let sum = 0;
		let itemNames = '';

		let html2 = `<tr>
			<td colspan="12" class="hiddenRow">
			<div class="accordian-body collapse" id="order${order.orderNo}">
				<table class="table table-striped">
					<thead>
						<tr class="info">
							<th>상품명</th>
							<th>상품수량</th>
							<th>상품가격</th>
						</tr>
					</thead>
					<tbody>`;
		order.itemList.forEach((item, index, array) => {

			sum += item.orderItemCount * item.orderItemPrice;
			
			console.log(sum);

			if (index == 0) {
				itemNames = item.itemName;

				if (array.length > 1) {
					itemNames += '외 ' + array.length + '종';
				}
			}

			html2 += `<tr>
				<td>${item.itemName}</td>
				<td>${item.orderItemCount}</td>
				<td>${item.orderItemPrice}</td>
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
			<td>${itemNames}</td>
			<td>${sum}</td>
			<td>${order.orderDate}</td>
			<td>${statusStr}</td>
		</tr>`;

		let html = html1 + html2;
		console.log(html);

		document.querySelector('#order_list').insertAdjacentHTML('beforeend', html);
	});
}
