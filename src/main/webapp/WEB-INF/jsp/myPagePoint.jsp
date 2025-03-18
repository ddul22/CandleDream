<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="d-flex" id="wrapper">
	<!-- Sidebar-->
	<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"
		style="width: 280px;">
		<a href=""
			class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
			<svg class="bi me-2" width="40" height="32">
			<use xlink:href="#bootstrap" /></svg> <span class="fs-4">${loginId }
				님, 환영합니다</span>
		</a>
		<hr>
		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item"><a href="myPagePoint.do"
				class="nav-link active text-white" aria-current="page"> <svg
						class="bi me-2" width="16" height="16">
					<use xlink:href="#home" /></svg> 포인트충전
			</a></li>
			<li class="nav-item"><a href="myPageInfo.do"
				class="nav-link text-white"> <svg class="bi me-2" width="16"
						height="16">
					<use xlink:href="#speedometer2" /></svg> 회원정보수정
			</a></li>
			<li class="nav-item"><a href="myPageOrder.do"
				class="nav-link text-white"> <svg class="bi me-2" width="16"
						height="16">
					<use xlink:href="#table" /></svg> 주문내역
			</a></li>
		</ul>
		<hr>
	</div>
	<!-- Page content wrapper-->
	<div class="container">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-6">
				<h4 class="mb-5 mt-5">포인트 충전</h4>

				<hr class="my-4">

					<div class="row g-3">
						<div class="col-12 mb-3">
							<label for="user_point" class="form-label">현재 포인트</label> <input
								type="email" class="form-control" id="user_point"
								placeholder="현재 포인트" readonly>
						</div>

						<div class="col-12">
							<label for="plus_point" class="form-label">충전 포인트</label> <input
								type="number" class="form-control" id="plus_point"
								placeholder="충전할 포인트를 입력하세요" required>
						</div>
					</div>

					<hr class="my-4">

					<button class="w-100 btn btn-primary btn-lg mb-5">포인트 충전</button>
			</div>
			<div class="col-5"></div>
		</div>
	</div>
</div>

<script>

</script>
