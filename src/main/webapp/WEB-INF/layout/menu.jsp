<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"
	style="width: 300px;">
	<div class="d-flex justify-content-center mb-3 mt-3">
		<h5>
			<span class="fs-4" id="nav_user_name"></span>
		</h5>
	</div>
	<ul class="nav nav-pills flex-column mb-auto">

		<c:choose>

			<c:when test="${userType == 0  }">
				<li class="nav-item"><a href="myPagePoint.do"
					class="nav-link text-white" id="my_page_point"> <svg
							class="bi me-2" width="16" height="40">
					</svg> 포인트충전
				</a></li>
				<li class="nav-item"><a href="myPageInfo.do"
					class="nav-link text-white" id="my_page_info"> <svg
							class="bi me-2" width="16" height="40">
					</svg> 회원정보수정
				</a></li>
				<li class="nav-item"><a href="myPageOrder.do"
					class="nav-link text-white" id="my_page_order"> <svg
							class="bi me-2" width="16" height="40">
					</svg> 주문내역
				</a></li>
			</c:when>

			<c:otherwise>
				<li class="nav-item"><a href="adminPageItem.do"
					class="nav-link text-white" id="admin_page_item"> <svg
							class="bi me-2" width="16" height="40">
					</svg> 상품관리
				</a></li>
				<li class="nav-item"><a href="adminPageOrder.do"
					class="nav-link text-white" id="admin_page_order"> <svg
							class="bi me-2" width="16" height="40">
					</svg> 주문관리
				</a></li>
			</c:otherwise>

		</c:choose>

	</ul>
	<hr>
</div>