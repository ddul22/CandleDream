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

		Swal.fire({
			title: "포인트가 부족합니다",
			text: "포인트 충전페이지로 이동하시겠습니까?",
			confirmButtonText: "이동",
			confirmButtonColor: "#fd7e14",
			showCancelButton: true,
			cancelButtonText: "취소"
		}).then((result) => {
			if (result.isConfirmed) {
				window.location.href = 'myPagePoint.do';
			}
		});
	} else {

		Swal.fire({
			title: "결제 확인",
			text: "결제를 진행하시겠습니까?",
			confirmButtonText: "확인",
			confirmButtonColor: "#fd7e14",
			showCancelButton: true,
			cancelButtonText: "취소"
		}).then((result) => {
			if (result.isConfirmed) {
				pointService.get((result) => {
					console.log(result);
					if (result.retCode == 'OK') {
						Swal.fire({
							title: "결제 완료",
							text: "구매해주셔서 감사합니다",
							confirmButtonText: "확인",
							confirmButtonColor: "#fd7e14",
						}).then((result) => {
							window.location.href = 'myPageOrder.do';
						});
					} else if (result.retCode == 'NG') {
						Swal.fire({
							title: "결제 실패",
							text: "오류가 지속될 경우 문의해주세요",
							icon: "error",
							confirmButtonText: "확인",
							confirmButtonColor: "#fd7e14",
							footer: '<a href="qna.do">문의하기</a>'
						});
					}
				}, (error) => {
					console.log(error);
					Swal.fire({
						title: "결제 실패",
						text: "오류가 지속될 경우 문의해주세요",
						icon: "error",
						confirmButtonText: "확인",
						confirmButtonColor: "#fd7e14",
						footer: '<a href="qna.do">문의하기</a>'
					});
				})
			}
		});
	}
})
