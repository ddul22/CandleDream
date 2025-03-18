<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="d-flex" id="wrapper">
	<!-- Sidebar-->
	<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"
		style="width: 280px;">
		<a href="/"
			class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
			<svg class="bi me-2" width="40" height="32">			
			<use xlink:href="#bootstrap" /></svg> <span class="fs-4">${loginId }
				님, 환영합니다</span>
		</a>
		<hr>
		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item"><a href="myPagePoint.do"
				class="nav-link text-white" aria-current="page"> <svg
						class="bi me-2" width="16" height="16">
					<use xlink:href="#home" /></svg> 포인트충전
			</a></li>
			<li class="nav-item"><a href="myPageInfo.do"
				class="nav-link text-white"> <svg class="bi me-2" width="16"
						height="16">
					<use xlink:href="#speedometer2" /></svg> 회원정보수정
			</a></li>
			<li class="nav-item"><a href="myPageOrder.do"
				class="nav-link active text-white"> <svg class="bi me-2"
						width="16" height="16">
					<use xlink:href="#table" /></svg> 주문내역
			</a></li>
		</ul>
		<hr>
	</div>
	<!-- Page content wrapper-->
	<div class="container">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-10">
				<h4 class="mb-5 mt-5">주문 내역</h4>

				<table class="table">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">First</th>
							<th scope="col">Last</th>
							<th scope="col">Handle</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<tr>
							<th scope="row">1</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Jacob</td>
							<td>Thornton</td>
							<td>@fat</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td colspan="2">Larry the Bird</td>
							<td>@twitter</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-1"></div>
		</div>
	</div>
</div>

<script>
	function charge() {

		let point = prompt("충전할 포인트를 입력하세요", 0);

		if (point != null && !isNaN(point)) {
			console.log(point);
		}

	}
</script>
