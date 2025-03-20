const pointService = {
	get: function(successCallback, errorCallback) {
		fetch('point.do?userNo=' + userNo)
			.then(result => result.json()) // 화살표 함수.
			.then(successCallback) // 정상처리시 실행함수.
			.catch(errorCallback) // 에러시 실행할 함수.
	}
}

document.querySelector('#confirm_payment').addEventListener('click', function(e) {

	pointService.get((result) => {
			console.log(result);
				alert("결제가 완료되었습니다!")
				window.location.href = "main.do";
			}, (error) => {
				console.log(error);
				alert("결제가 거부되었습니다. 다시 시도하세요.")
			})
        
		let result = user_point;

		if (itemPrice * orderItemCount > userPoints) {
			alert("포인트가 부족합니다! 결제를 실패했습니다.");
			return;
		}
		result -= itemPrice * orderItemCount;
		alert("결제가 완료되었습니다! 남은 포인트: " + result);
		updatePointsDisplay();
	
	})
