/**
 * 
 */

getUserInfo();

getItem();

function getUserInfo() {

	fetch('getUserInfo.do?userNo=' + userNo)
		.then((result) => result.json())
		.then((result) => {
			console.log(result);
			document.querySelector('#nav_user_name').innerHTML = result.userName + ' 님, 환영합니다';
		})
		.catch((error) => console.log(error));
}


function getItem() {
	fetch('getItem.do?itemNo=' + itemNo)
		.then((result) => result.json())
		.then((result) => {
			console.log(result);
			document.querySelector('#item_name').value = result.itemName;
			//nice-select 로 인한 버그있음
			document.querySelector('#item_price').value = result.itemPrice;
			document.querySelector('#item_info').value = result.itemInfo;
		})
		.catch((error) => console.log(error));
}


function updateItem() {

	const body = new FormData();

	let itemName = document.querySelector('#item_name').value;
	let typeNo = document.querySelector('#type_no').value;
	let itemPrice = document.querySelector('#item_price').value;
	let itemInfo = document.querySelector('#item_info').value;
	let itemImage = document.querySelector('#item_image').files[0];

	body.append('itemNo', itemNo);
	body.append('itemName', itemName);
	body.append('typeNo', typeNo);
	body.append('itemPrice', itemPrice);
	body.append('itemInfo', itemInfo);
	body.append('itemImage', itemImage);

	console.log(body);

	fetch('updateItemData.do', {
		body,
		method: 'POST'
	})
		.then((result) => result.json())
		.then((result) => {
			console.log(result);
			if (result.retCode == "OK") {
				Swal.fire({
					title: "상품수정 성공",
					text: "상품정보가 수정되었습니다",
					icon: "success",
					confirmButtonText: "확인",
					confirmButtonColor: "#fd7e14"
				}).then(() => window.location.href='adminPageItem.do');
			} else if (result.retCode == "NG") {
				Swal.fire({
					title: "상품수정 실패",
					text: "상품수정 중 오류가 발생했습니다",
					icon: "error",
					confirmButtonText: "확인",
					confirmButtonColor: "#fd7e14"
				});
			}
		})
		.catch((error) => {
			console.log(error)
			Swal.fire({
				title: "상품수정 실패",
				text: "상품수정 중 오류가 발생했습니다",
				icon: "error",
				confirmButtonText: "확인",
				confirmButtonColor: "#fd7e14"
			});
		});

}

