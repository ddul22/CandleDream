<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<label for="add_point" class="form-label">충전 포인트</label> <input
				type="number" class="form-control" id="add_point"
				placeholder="충전할 포인트를 입력하세요" required>
		</div>
	</div>

	<hr class="my-4">

	<button class="w-100 btn btn-primary btn-lg mb-5"
		onclick="addUserPoint()">포인트 충전</button>
</div>
<div class="col-5"></div>

<script>

document.querySelector('#my_page_point').className += ' active';

let userNo = '${userNo}';

console.log(userNo);

getUserInfo();

function getUserInfo() {

	fetch('getUserInfo.do?userNo=' + userNo)
	.then((result) => result.json())
	.then((result) => {
		console.log(result);
		document.querySelector('#nav_user_name').innerText = result.userName + ' 님, 환영합니다';
		document.querySelector('#user_point').value = result.userPoint;
	})
	.catch((error) => {
		console.log(error);
	});
	
}

function addUserPoint() {
	
	let point = document.querySelector('#add_point').value;
		
		if (isNaN(point) || point == 0) {
			alert('포인트를 정확히 입력해주세요');
			return;
		}
	
	fetch('addPoint.do?userNo=' + userNo + "&point=" + point)
	.then((result) => result.json())
	.then((result) => {
		console.log(result);
		if (result.retCode == 'OK') {
			alert('포인트 충전이 완료되었습니다')
			document.querySelector('#add_point').value = '';
			getUserInfo();
		} else if (result.retCode == 'NG') {
			alert('포인트 충전이 실패했습니다')
		}
	})
	.catch((error) => {
		console.log(error);
	});

}

</script>
