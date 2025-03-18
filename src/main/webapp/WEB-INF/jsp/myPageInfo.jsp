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
			<li class="nav-item"><a href="myPagePoint.do" class="nav-link text-white"
				aria-current="page"> <svg class="bi me-2" width="16" height="16">
					<use xlink:href="#home" /></svg> 포인트충전
			</a></li>
			<li class="nav-item"><a href="myPageInfo.do" class="nav-link active text-white">
					<svg class="bi me-2" width="16" height="16">
					<use xlink:href="#speedometer2" /></svg> 회원정보수정
			</a></li>
			<li class="nav-item"><a href="myPageOrder.do" class="nav-link text-white">
					<svg class="bi me-2" width="16" height="16">
					<use xlink:href="#table" /></svg> 주문내역
			</a></li>
		</ul>
		<hr>
	</div>
	<!-- Page content wrapper-->
	<div id="page-content-wrapper">
		<!-- Page content-->
		<div class="container text-center">
			<div class="form-floating">
				<label for="floatingInput">현재 포인트</label> <input type="email"
					class="form-control" id="floatingInput" disabled>
			</div>

			<div class="form-floating">
				<label for="floatingInput">충전 포인트</label> <input type="email"
					class="form-control" id="floatingInput">
			</div>

			<button class="w-100 btn btn-lg btn-primary" onclick="charge()">포인트충전</button>
		</div>
	</div>
</div>

<script>

	function charge() {

	
	}
</script>
