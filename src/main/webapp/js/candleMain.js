/**
 * candleMain.js
 */

getNewItem();

function getNewItem() {
	fetch('mainData.do').then((result) => result.json())
		.then((result) => {

		}).catch((error) => {
			console.log(error);
		})
}