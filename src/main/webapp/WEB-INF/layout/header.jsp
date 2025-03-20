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

							<c:choose>

								<c:when test="${empty userNo  }">
									<div class="header__top__right__cart">
										<div class="cart__price">
											<span><a class="" href="loginForm.do" style="color: #212529;">Login</a></span>
										</div>
									</div>
								</c:when>

								<c:otherwise>
									<div class="header__top__right__cart">
										<a href="cart.do?userNo=${userNo}" style="color: #212529;">
										<img src="img/icon/cart.png" alt=""></a>
									</div>
									<div class="header__top__right__cart">
										<div class="cart__price">
											<c:choose>
												<c:when test="${userType == 0  }">
													<span><a href="myPagePoint.do" style="color: #212529;">MyPage</a></span>
												</c:when>

												<c:otherwise>
													<span><a href="adminPageItem.do" style="color: #212529;">AdminPage</a></span>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<div class="header__top__right__cart">
										<div class="cart__price">
											<span><a href="logout.do" style="color: #212529;">Logout</a></span>
										</div>
									</div>
								</c:otherwise>

							</c:choose>

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
						<li id="header_main"><a href="main.do">Home</a></li>
						<li id="header_shop"><a href="product.do">Shop</a></li>
						<li id="header_qna"><a href="qna.do">Q&A</a></li>
						<li id="header_contact"><a href="contact.do">Contact</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</header>
