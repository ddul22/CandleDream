let sum = 0;
showPay();
showCart();


function payment(pay = {}) {
	let html = `
	            			<div class="product">
	                			<h3></h3>
	                			<p>가격:${pay.itemPrice} 원</p>
	                			<p>할인가:${pay.itemPriceSale} 원</p>
	                			<p>수량:${pay.orderItemCount}</p>
	            			</div>`;
	return html;
}
function showPay(){
	fetch('paymentData.do?userNo=1')
	.then((result)=>result.json())
	.then((result) =>{
		let user = result;
		console.log(user);
		let target = document.querySelector('#user_name');
		target.innerHTML = '이름: ' + user.userName;
		target = document.querySelector('#user_email');
		target.innerHTML = '이메일: ' + user.userEmail;
		target = document.querySelector('#user_tel');
		target.innerHTML = '연락처: ' + user.userTel;
		target = document.querySelector('#user_address');
		target.innerHTML = '배송지: ' + user.userAddress;
	})

}

function showCart() {
	fetch('cartData.do?userNo=1')
		.then((result) => result.json())
		.then((result) => {
			console.log(result);
			let cartAry = result;
			cartAry.forEach(cart => {
				sum += cart.orderItemCount * cart.itemPrice; 
				let target = document.querySelector('#payPage');
				target.insertAdjacentHTML('beforeend', payment(cart));
			});
			let target = document.querySelector('#total').innerHTML = sum;
			target.insertAdjacentHTML('beforeend', payment(cart));

		})
		.catch((error) => console.log(error));
}

