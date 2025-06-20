/**
 * 
 */

getUserInfo();

function getUserInfo() {

	fetch('getUserInfo.do?userNo=' + userNo)
		.then((result) => result.json())
		.then((result) => {
			console.log(result);
			document.querySelector('#nav_user_name').innerHTML = result.userName + ' 님, 환영합니다';
		})
		.catch((error) => console.log(error));
}

function addItem() {

	const body = new FormData();

	let itemName = document.querySelector('#item_name').value;
	let typeNo = document.querySelector('#type_no').value;
	let itemPrice = document.querySelector('#item_price').value;
	let itemInfo = document.querySelector('#item_info').value;
	let itemImage = document.querySelector('#item_image').files[0];

	body.append('itemName', itemName);
	body.append('typeNo', typeNo);
	body.append('itemPrice', itemPrice);
	body.append('itemInfo', itemInfo);
	body.append('itemImage', itemImage);

	console.log(body);

	fetch('addItemData.do', {
		body,
		method: 'POST'
	})
		.then((result) => result.json())
		.then((result) => {
			console.log(result);
			if (result.retCode == "OK") {
				Swal.fire({
					title: "상품등록 성공",
					text: "상품정보가 등록되었습니다",
					icon: "success",
					confirmButtonText: "확인",
					confirmButtonColor: "#fd7e14"
				}).then(() => window.location.href='adminPageItem.do');
				
			} else if (result.retCode == "NG") {
				Swal.fire({
					title: "상품등록 실패",
					text: "상품등록 중 오류가 발생했습니다",
					icon: "error",
					confirmButtonText: "확인",
					confirmButtonColor: "#fd7e14"
				});
			}
		})
		.catch((error) => {
			console.log(error)
			Swal.fire({
				title: "상품등록 실패",
				text: "상품등록 중 오류가 발생했습니다",
				icon: "error",
				confirmButtonText: "확인",
				confirmButtonColor: "#fd7e14"
			});
		});

}

