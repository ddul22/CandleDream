const pointService = {
	get: function(successCallback, errorCallback) {
		fetch('point.do?userNo=' + userNo)
			.then(result => result.json()) // 화살표 함수.
			.then(successCallback) // 정상처리시 실행함수.
			.catch(errorCallback) // 에러시 실행할 함수.
	}
}

document.querySelector('#confirm_payment').addEventListener('click', (event) => {

	if (sum > point) {
		alert('포인트가 부족합니다!');
		return;
	}

	pointService.get((result) => {
		console.log(result);
		alert("결제가 완료되었습니다!")
		window.location.href = "main.do";
	}, (error) => {
		console.log(error);
		alert("결제 중 오류가 발생했습니다.")
	})

})
