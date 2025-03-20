let sum = 0;

showCart();

function cartList(list = {}) {
	let html = `	<tr id="proInfo${list.itemNo}">
						<td class="product__cart__item">
							<div class="product__cart__item__pic">
									<img style="width:90px;" src="${list.itemImagePath}" alt="">
							</div>
							<div class="product__cart__item__text">
								<h6>${list.itemName}</h6>
								<h5>${list.typeNo == 1 ? 'CANDLE' : 'YANKEE'}</h5>
							</div>
						</td>
						<td class="cart__price">${list.orderItemPrice} </td>
						<td class="quantity__item">
							<div class="quantity">
								<div class="pro-qty">
									<input type="text" value="${list.orderItemCount}">
								</div>
							</div>
						</td>
						<td class="cart__price">${list.orderItemPrice * list.orderItemCount} </td>
						<td class="cart__close"><span class="icon_close" onclick="remove(${list.orderNo}, ${list.itemNo})"></span></td>
					</tr>`;
	return html;
}
function showCart() {
	
	sum = 0;
	let target = document.querySelector('#cartPage');
	target.innerHTML = '';
	document.querySelector('#total').innerHTML = '0';
	
	fetch('cartData.do?userNo=' + userNo)
		.then((result) => result.json())
		.then((result) => {
			console.log(result);
			let cartAry = result;
			cartAry.forEach(cart => {
				sum += cart.orderItemCount * cart.orderItemPrice; 
				target.insertAdjacentHTML('beforeend', cartList(cart));
			});
			document.querySelector('#total').innerHTML = sum;
		})
		.catch((error) => console.log(error));
}
function remove(orderNo, itemNo) {
console.log(orderNo, itemNo);
	console.log(this);

	fetch("removeData.do?orderNo=" + orderNo + "&itemNo=" + itemNo ) 
		.then(function(result) {
			return result.json();
		})
		.then((result) => {
			console.log(result);
			if (result.retCode == "OK") {
				showCart();
			} else if (result.retCode == "NG") {
				alert('삭제오류 발생'); 
			} else {
				alert('알수 없는 코드입니다.');
			}
		})
}
