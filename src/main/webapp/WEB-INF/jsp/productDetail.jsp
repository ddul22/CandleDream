<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- Page Preloder -->

<!-- Offcanvas Menu End -->

<!-- Header Section Begin -->
<!-- Header Section End -->

<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="breadcrumb__text">
					<h2>CANDLE DREAM</h2>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb End -->

<!-- Shop Details Section Begin -->

<!-- Shop Details Section End -->

<!-- Related Products Section Begin -->
<section class="product-details spad">
	<div class="container">

		<div class="row">
			<div class="col-lg-6">
				<div class="product__details__img">
					<div class="product__details__big__img">
						<img class="big_img" src="images/${product.itemImagePath }" alt="">
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="product__details__text">
					<div class="product__label">${product.typeNo == 1 ? "CANDLE" : "YANKEE"  }</div>
					<h4>${product.itemName }</h4>
					<h5>
						<fmt:formatNumber value="${product.itemPrice}" type="number"
							pattern="#,###" var="formattedPrice" />
						<c:out value="${formattedPrice}원" />
					</h5>
					<p>${product.itemInfo }</p>
					<div class="product__details__option">
						<div class="quantity">
							<div class="pro-qty">
								<input id="countPr" type="text" value="1">
							</div>
						</div>
						<button class="btn primary-btn" id="addBtn">Add to cart</button>
					</div>
				</div>
			</div>
		</div>
		<div class="product__details__tab">
			<div class="col-lg-12"></div>
		</div>

	</div>
</section>
<!-- Footer Section End -->

<!-- Search Begin -->
<div class="search-model">
	<div class="h-100 d-flex align-items-center justify-content-center">
		<div class="search-close-switch">+</div>
		<form class="search-model-form">
			<input type="text" id="search-input" placeholder="Search here.....">
		</form>
	</div>
</div>
<!-- Search End -->
<script>
let userNo = '${userNo}';

document.querySelector("#addBtn").addEventListener('click', function(){ 
	
	if (userNo == null || userNo == '') {
		Swal.fire({
			  text: "로그인 후 이용할 수 있습니다",
			  confirmButtonText: "확인",
			confirmButtonColor: "#fd7e14"
		})
		return;
	}
	
	let countPr = document.querySelector("#countPr").value;
	console.log(countPr);
	console.log("${userNo}");
	fetch('addCart.do?itemNo=' + "${product.itemNo }" + 
			'&userNo=' + "${userNo }" +
			'&orderItemCount=' + countPr + '&orderItemPrice=' + "${product.itemPrice}")
	.then((result) => result.json())
	.then((result) => {
		console.log(result);
		if (result.retCode == 'OK') {
			Swal.fire({
				title : "카트에 담기 완료",
				text : "카트로 이동하시겠습니까?",
				confirmButtonText: "이동",
				confirmButtonColor: "#fd7e14",
				showCancelButton: true,
				cancelButtonText: "취소"
			}).then((result) => {
				 if (result.isConfirmed) {
					window.location.href = 'cart.do';
				 }
			});
		} else {
			Swal.fire({
				title : "카트에 담기 실패",
				text : "오류가 지속될 경우 문의해주세요",
				icon : "error",
				confirmButtonText: "확인",
				confirmButtonColor: "#fd7e14",
				footer: '<a href="qna.do">문의하기</a>'
			});
		}
	})
	.catch((error) => {
		Swal.fire({
			title : "카트에 담기 실패",
			text : "오류가 지속될 경우 문의해주세요",
			icon : "error",
			confirmButtonText: "확인",
			confirmButtonColor: "#fd7e14",
			footer: '<a href="qna.do">문의하기</a>'
		});
	});
})

document.querySelector("addBtn")
</script>
