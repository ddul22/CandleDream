/**
 * candleMain.js
 */

getNewItem();

function getNewItem() {
	fetch('mainData.do').then((result) => result.json())
		.then((result) => {
			console.log(result);
			result.forEach((item) => {
				console.log(drawItem(item))
			document.querySelector('#new_item_list').insertAdjacentHTML('beforeend', drawItem(item));
			});
		}).catch((error) => {
			console.log(error);
		})
}

function drawItem(item = {}) {
	let html = `<div class="col-lg-3 col-md-6 col-sm-6">
	    <div class="product__item">
	        <div class="product__item__pic set-bg" data-setbg="img/shop/product-6.jpg">
	            <div class="product__label">
	                <span>${item.typeNo == 1 ? "CANDLE": "YANKEE"}</span>
	            </div>
	        </div>
	        <div class="product__item__text">
	            <h6><a href="#">${item.itemName}</a></h6>
	            <div class="product__item__price">${item.itemSale == 0 ? item.itemPriceSale : item.itemPrice}</div>
	        </div>
	    </div>
	</div>`;
	
	return html;
}
