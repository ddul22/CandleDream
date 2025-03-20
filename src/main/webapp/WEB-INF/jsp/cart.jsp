<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section class="shopping-cart spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="shopping__cart__table">
					<table>
						<thead>
							<tr>
								<th>Product</th>
								<th>Quantity</th>
								<th>Total</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="cartPage">
						
						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="continue__btn">
							<a href="product.do">Continue Shopping</a>
						</div>
					</div>
				
				</div>
			</div>
			<div class="col-lg-4">
				<div class="cart__total">
					<h6>Cart total</h6>
					<ul>
						<li>Total <span id="total">$ 169.50</span></li>
					</ul>
					<a href="payment.do" class="primary-btn">Proceed to checkout</a>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	let userNo = '${userNo}';
</script>
<script src="js/cart.js"></script>