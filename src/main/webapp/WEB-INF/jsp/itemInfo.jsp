<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<section class="shop spad">
	<div class="container">
		<div class="shop__option">
			<div class="row">
				<div class="col-lg-7 col-md-7">
					<div class="shop__option__search">
						<form action="product.do" method="get">
							<select name="searchCondition" id="searchCondition">					
								<option value="">선택하세요</option>
								<option value="C" >Candle</option>
								<option value="Y" >Yankee</option>
								<option value="CY" >Candle&Yankee</option>					
							</select> <input type="text" name="keyword" placeholder="${keyword }">

							<button type="submit" >
								<i class="fa fa-search"></i>
							</button>
							
						</form>
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
							data-setbg="${candle.itemImagePath }">
							<div class="product__label">
							
								<span><c:out value="${candle.itemNo }" /></span>
							</div>
						</div>
						</a>
						<div class="product__item__text">
							<h6>
								<a href="#">${candle.itemName }</a>
							</h6>
							<div class="product__item__price">
							<fmt:formatNumber value="${candle.itemPrice}" type="number" pattern="#,###" var="formattedPrice"/>
							<c:out value="${formattedPrice}원"/>
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
								href="product.do?page=${p }&searchCondition=${searchCondition}&keyword=${keyword}">${p }</a>
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

<script>
	document.querySelector('#header_shop').className += ' active';
</script>
