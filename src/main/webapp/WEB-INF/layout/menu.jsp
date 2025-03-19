<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"
	style="width: 280px;">
	<a
		class="pe-none d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
		<span class="fs-4" id="nav_user_name"></span>
	</a>
	<hr>
	<ul class="nav nav-pills flex-column mb-auto">

		<c:choose>

			<c:when test="${userType == 0  }">
				<li class="nav-item"><a href="myPagePoint.do"
					class="nav-link text-white" id="my_page_point"> <svg
							class="bi me-2" width="16" height="16">
					</svg> 포인트충전
				</a></li>
				<li class="nav-item"><a href="myPageInfo.do"
					class="nav-link text-white" id="my_page_info"> <svg
							class="bi me-2" width="16" height="16">
					</svg> 회원정보수정
				</a></li>
				<li class="nav-item"><a href="myPageOrder.do"
					class="nav-link text-white" id="my_page_order"> <svg
							class="bi me-2" width="16" height="16">
					</svg> 주문내역
				</a></li>
			</c:when>

			<c:otherwise>
				<li class="nav-item"><a href="adminPageItem.do"
					class="nav-link text-white" id="admin_page_item"> <svg
							class="bi me-2" width="16" height="16">
					</svg> 상품관리
				</a></li>
				<li class="nav-item"><a href="adminPageOrder.do"
					class="nav-link text-white" id="admin_page_order"> <svg
							class="bi me-2" width="16" height="16">
					</svg> 주문관리
				</a></li>
			</c:otherwise>

		</c:choose>

	</ul>
	<hr>
</div>