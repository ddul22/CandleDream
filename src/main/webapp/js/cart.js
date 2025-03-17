let sum = 0;

showCart();

function cartList(list = {}) {
	let html = `	<tr>
						<td class="product__cart__item">
							<div class="product__cart__item__pic">
									<img src="${list.itemImage}" alt="">
							</div>
							<div class="product__cart__item__text">
								<h6>${list.itemName}</h6>
								<h5>${list.itemPrice}</h5>
							</div>
						</td>
						<td class="quantity__item">
							<div class="quantity">
								<div class="pro-qty">
									<input type="text" value="${list.orderItemCount}">
								</div>
							</div>
						</td>
						<td class="cart__price">${list.itemPrice * list.orderItemCount} </td>
						<td class="cart__close"><span class="icon_close"></span></td>
					</tr>`;
	return html;
}
function showCart() {
	fetch('cartData.do?userNo=1')
		.then((result) => result.json())
		.then((result) => {
			console.log(result);
			let cartAry = result;
			cartAry.forEach(cart => {
				sum += cart.orderItemCount * cart.itemPrice; 
				let target = document.querySelector('#cartPage');
				target.insertAdjacentHTML('beforeend', cartList(cart));
			});
			let target = document.querySelector('#total').innerHTML = sum;
			target.insertAdjacentHTML('beforeend', cartList(cart));
			
		})
		.catch((error) => console.log(error));
}
