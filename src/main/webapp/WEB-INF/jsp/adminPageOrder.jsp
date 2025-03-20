<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-1"></div>
<div class="col-6"></div>
<div class="col-5"></div>

<script>
document.querySelector('#admin_page_order').className += ' active';

let userNo = '${userNo}';

console.log(userNo);

getUserInfo();

function getUserInfo() {

	fetch('getUserInfo.do?userNo=' + userNo)
	.then((result) => result.json())
	.then((result) => {
		console.log(result);
		document.querySelector('#nav_user_name').innerText = result.userName + ' 님, 환영합니다';
	})
	.catch((error) => console.log(error));
}
</script>