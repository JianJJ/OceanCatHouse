var ken;
function verifyCallback(token) {
	ken = token;
	var sJson = JSON.stringify
		({
			"token": token
		});
	console.log(sJson);

}



