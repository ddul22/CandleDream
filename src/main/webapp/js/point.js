const pointService = {
	// 목록메소드.
	get: function(successCallback, errorCallback) {
		fetch('point.do?userNo=1')
			.then(result => result.json()) // 화살표 함수.
			.then(successCallback) // 정상처리시 실행함수.
			.catch(errorCallback) // 에러시 실행할 함수.
	}
}
document.querySelector('').addEventListener('click', function(e) {

	pointService.get((result) => {
		console.log(result);
		alert("결제가 완료되었습니다!")
	}, (error) => {
		console.log(error);
		alert("결제가 거부되었습니다. 다시 시도하세요.")
	})
})
