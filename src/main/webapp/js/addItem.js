/**
 * 
 */

function addItem() {
	
	const body = new FormData();
	
	let itemName = document.querySelector('#item_name').value;
	let typeNo = document.querySelector('#item_type').value;
	let itemPrice = document.querySelector('#item_price').value;
	let itemInfo = document.querySelector('#item_info').value;
	let itemImage = document.querySelector('#item_image').files[0];
	
	
	body.append('itemName', itemName);
	body.append('typeNo', typeNo);
	body.append('itemPrice', itemPrice);
	body.append('itemInfo', itemInfo);
	body.append('itemImage', itemImage);

	fetch('addItemData.do', {
	  body,
	  method: 'POST'
	})
	.then((result) => result.json())
	.then((result) => {
		console.log(result);
		if (result.retCode == "OK") {
			alert('등록 성공');
			window.location.href = 'addItem.do';
 		} else if (result.retCode == "NG") {
			alert('등록 실패');
		}		
	})
	.catch((error) => console.log(error));

}

