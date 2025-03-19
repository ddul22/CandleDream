function sendContact(){
	fetch('contactData.do?contactNo=1')
	.then((result) => result.json())
	.then((result) => {
		let contact = result;
		console.log(contact);
	})
	.catch((error) => console.log(error));
}