
let sum = 0;
let point = 0;

showPay();
showCart();

function payment(pay = {}) {
	let html = `<tr>
	<td>${pay.itemName}</td>
	<td>${pay.orderItemCount}</td>
	<td>${pay.orderItemPrice}</td>
	<td>${pay.orderItemPrice * pay.orderItemCount}</td>
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
			target.value = user.userName;
			target = document.querySelector('#user_email');
			target.value = user.userEmail;
			target = document.querySelector('#user_tel');
			target.value = user.userTel;
			target = document.querySelector('#user_address');
			target.value = user.userAddress;
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