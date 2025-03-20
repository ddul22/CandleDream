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

			$('.set-bg').each(function() {
				var bg = $(this).data('setbg');
				$(this).css('background-image', 'url(' + bg + ')');
			});
		}).catch((error) => {
			console.log(error);
		})
}

function formatNumber(number) {
    return new Intl.NumberFormat('ko-KR').format(number);
}

function drawItem(item = {}) {
    let price = item.itemSale == 0 ? item.itemPriceSale : item.itemPrice;
    let formattedPrice = formatNumber(price); // 가격 포맷팅

    let html = `<div class="col-lg-3 col-md-6 col-sm-6" onclick="toDetail(${item.itemNo})">
        <div class="product__item">
            <div class="product__item__pic set-bg" data-setbg="${item.itemImagePath}">
                <div class="product__label">
                    <span>${item.typeNo == 1 ? "CANDLE" : "YANKEE"}</span>
                </div>
            </div>	
            <div class="product__item__text">
                <h6>${item.itemName}</h6>
                <h6>${formattedPrice}원</h6> <!-- 포맷된 가격 표시 -->
            </div>
        </div>
    </div>`;

    return html;
}


function toDetail(itemNo) {
	location.href = 'productDetail.do?itemNo=' + itemNo;
}

