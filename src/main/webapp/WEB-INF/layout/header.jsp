<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="header">
	<div class="header__top">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="header__top__inner">
						<div class="header__top__left"></div>
						<div class="header__logo">
							<a href="main.do"><img src="img/logo.png" alt=""></a>
						</div>
						<div class="header__top__right">
							<div class="header__top__right__cart">
								<a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
							</div>
							<c:choose>
								<c:when test="${empty loginId  }">
									<div class="header__top__right__cart">
										<div class="cart__price">
											<span><a href="login.do">Login</a></span>
										</div>
									</div>
								</c:when>

								<c:otherwise>

								</c:otherwise>
							</c:choose>
							
							<div class="header__top__right__cart">
								<div class="cart__price">
									<span><a href="myPagePoint.do">MyPage</a></span>
								</div>
							</div>

							<div class="header__top__right__cart">
								<div class="cart__price">
									<span><a href="login.do">Login</a></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="canvas__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<nav class="header__menu mobile-menu">
					<ul>
						<li class="active"><a href="main.do">Home</a></li>
						<li><a href="product.do">Shop</a></li>
						<li><a href="qna.do">Q&A</a></li>
						<li><a href="contact.do">Contact</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</header>
