<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="shop spad">
	<div class="container">
		<div class="shop__option">
			<div class="row">
				<div class="col-lg-7 col-md-7">
					<div class="shop__option__search">
						<form action="#">
							<select>
								<option value="">Categories</option>
								<option value="">Red Velvet</option>
								<option value="">Cup Cake</option>
								<option value="">Biscuit</option>
							</select> <input type="text" placeholder="Search">
							<button type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
					</div>
				</div>
				<div class="col-lg-5 col-md-5">
					<div class="shop__option__right">
						<select>
							<option value="">Default sorting</option>
							<option value="">A to Z</option>
							<option value="">1 - 8</option>
							<option value="">Name</option>
						</select> <a href="#"><i class="fa fa-list"></i></a> <a href="#"><i
							class="fa fa-reorder"></i></a>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${product }" var="candle">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="product__item">
					<a href = "productDetail.do?itemNo=${candle.itemNo }">
						<div class="product__item__pic set-bg"
							data-setbg="img/shop/product-1.jpg">
							<div class="product__label">
								<span><c:out value="${candle.typeNo }" /></span>
							</div>
						</div>
						</a>
						<div class="product__item__text">
							<h6>
								<a href="#">${candle.itemNo }</a>
							</h6>
							<div class="product__item__price">
								<c:out value="${candle.itemPrice }"></c:out>
							</div>
							<div class="cart_add">
								<a href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>

			</c:forEach>

		</div>
		<nav aria-label="...">
			<ul class="pagination">
				<!-- 이전 페이지 여부. -->
				<c:choose>
					<c:when test="${paging.prev }">
						<li class="page-item"><a class="page-link"
							href="product.do?page=${paging.startPage - 1 }&searchCondition=${searchCondition}&keyword=${keyword}">이전</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><span class="page-link">이전</span>
						</li>
					</c:otherwise>
				</c:choose>

				<!-- 페이지 start ~ end 반복-->
				<c:forEach var="p" begin="${paging.startPage }"
					end="${paging.endPage }">
					<c:choose>
						<c:when test="${p == paging.currentPage }">
							<li class="page-item active" aria-current="page"><span
								class="page-link"> <c:out value="${p }" /></span></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="product.do?page=${p }&searchCondition=${searchCondition}&keyword=${keyword}">${p+1 }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<!-- 이후 페이지 여부. -->
				<c:choose>
					<c:when test="${paging.next }">
						<li class="page-item"><a class="page-link"
							href="product.do?page=${paging.endPage + 1 }&searchCondition=${searchCondition}&keyword=${keyword}">다음</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><span class="page-link">다음</span>
						</li>
					</c:otherwise>
				</c:choose>

			</ul>
		</nav>
	</div>

</section>