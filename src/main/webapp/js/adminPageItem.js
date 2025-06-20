/**
 * 
 */

getUserInfo();

getItemList();

function getUserInfo() {

	fetch('getUserInfo.do?userNo=' + userNo)
		.then((result) => result.json())
		.then((result) => {
			console.log(result);
			document.querySelector('#nav_user_name').innerHTML = result.userName + ' 님, 환영합니다';
		})
		.catch((error) => console.log(error));
}

function getItemList() {
	fetch('adminPageItemList.do')
		.then((result) => result.json())
		.then((result) => {
			console.log(result);
			result.forEach((item) => {
				let html = `<tr onclick="updateItem(${item.itemNo})">
				<td>${item.itemNo}</td>
				<td>${item.typeNo == 1 ? 'CANDLE' : 'YANKEE'}</td>
				<td>${item.itemName}</td>
				<td>${item.itemPrice}</td>
				<td>${item.itemStatus == 0 ? '판매 중' : '삭제됨'}</td>
			</tr>`;

				document.querySelector('#item_list').insertAdjacentHTML('beforeend', html);
			});
		})
		.catch((error) => console.log(error));
}

function updateItem(itemNo) {
	window.location.href= 'updateItem.do?itemNo=' + itemNo;
}