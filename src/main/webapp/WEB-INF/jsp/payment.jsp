<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제 페이지</title>

</head>
<body>
    <div class="container" >
        <h2>결제 페이지</h2>
        
        <!-- 주문자 정보 -->
        <div class="order-info">
            <h4>주문자정보</h4>
            <p id="user_name">이름: </p>
            <p id="user_email">이메일: </p>
            <p id="user_tel">연락처: </p>
            <p id="user_address">배송지: </p>
        </div>
        
        <!-- 상품 정보 -->
        <div class="product-list" id="payPage">
        </div>
        
        <!-- 총 결제 금액 -->
        <div class="total-price">
            <h4>총 결제 금액: 원</h4>
        </div>
        
        <!-- 결제 버튼 -->
            <ul>
				<li>Total <span id="total">$ 169.50</span></li>
			</ul>
            <a href="#" class="primary-btn">결제하기</a>
    </div>
</body>
</html>

<script src="js/payment.js"></script>
<script src="js/point.js"></script>