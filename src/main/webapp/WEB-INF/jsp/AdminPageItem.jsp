<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="d-flex" id="wrapper">
	<!-- Sidebar-->
	<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"
		style="width: 280px;">
		<a href="/"
			class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
			<svg class="bi me-2" width="40" height="32">			
			<use xlink:href="#bootstrap" /></svg> <span class="fs-4">${loginId } 님, 환영합니다</span>
		</a>
		<hr>
		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item"><a href="myPagePoint.do" class="nav-link active text-white"
				aria-current="page"> <svg class="bi me-2" width="16" height="16">
					<use xlink:href="#home" /></svg> 상품관리
			</a></li>
			<li class="nav-item"><a href="myPageOrder.do" class="nav-link text-white">
					<svg class="bi me-2" width="16" height="16">
					<use xlink:href="#table" /></svg> 주문관리
			</a></li>
		</ul>
		<hr>
	</div>
	<!-- Page content wrapper-->
	<div id="page-content-wrapper">
		<!-- Page content-->
		<div class="container text-center">
			
		</div>
	</div>
</div>

<script>

	function charge() {

	
	}
</script>
