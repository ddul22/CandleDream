<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>

</head>
<section class="hero">
	<div class="hero__slider owl-carousel">
		<div class="hero__item set-bg" data-setbg="img/hero/hero-2.jpg">
		</div>
		<div class="hero__item set-bg" data-setbg="img/hero/hero-1.jpg">

		</div>
	</div>
</section>

<section class="product spad">

	<div class="container">
		<div class="contact__text">
			<h3>New Candles!</h3>
		</div>
		<div class="row" id="new_item_list"></div>
	</div>
</section>

<script>
	document.querySelector('#header_main').className += ' active';
</script>
<script src="js/candleMain.js"></script>