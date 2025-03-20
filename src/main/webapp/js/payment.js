
let sum = 0;
let point = 0;

showPay();
showCart();

function payment(pay = {}) {
	let html = `<tr>
	<td>${pay.itemName}</td>
	<td>${pay.orderItemCount}</td>
	<td>${pay.orderItemPrice}</td>
	</tr>`;
	return html;
}

function showPay() {
	fetch('paymentData.do?userNo=' + userNo)
		.then((result) => result.json())
		.then((result) => {
			let user = result;
			console.log(user);
			let target = document.querySelector('#user_name');
			target.value = '이름: ' + user.userName;
			target = document.querySelector('#user_email');
			target.value = '이메일: ' + user.userEmail;
			target = document.querySelector('#user_tel');
			target.value = '연락처: ' + user.userTel;
			target = document.querySelector('#user_address');
			target.value = '배송지: ' + user.userAddress;
			target = document.querySelector('#user_point');
			target.innerHTML = '현재 포인트 : ' + user.userPoint;
			point = user.userPoint;
		})
}

function showCart() {
	fetch('cartData.do?userNo=' + userNo)
		.then((result) => result.json())
		.then((result) => {
			console.log(result);
			let cartAry = result;
			cartAry.forEach((cart) => {
				sum += cart.orderItemCount * cart.orderItemPrice;
				let target = document.querySelector('#payPage');
				target.insertAdjacentHTML('beforeend', payment(cart));
			});
			target = document.querySelector('#total').innerHTML = '총 결제 금액 : ' + sum;
			//target.insertAdjacentHTML('beforeend', payment(cart));

		})
		.catch((error) => console.log(error));
}