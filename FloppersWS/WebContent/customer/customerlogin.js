function doReset() {
	clearErrors();
}

function clearErrors() {
	document.getElementById('username_error').innerHTML = '';
	document.getElementById('password_error').innerHTML = '';
}

function doRevalidate() {
	return;
	if (!validateUsername())
		errors++;

	if (!validatePassword())
		errors++;

}

function validateUsername() {
	var userName = $("#username").val();
	document.getElementById('username_error').innerHTML = '';
	if (userName == '') {
		setError('username_error', "Username cannot be blank");
		return false;
	}
	return true;

}

function validatePassword() {
	var userName = $("#password").val();
	document.getElementById('password_error').innerHTML = '';
	if (userName == '') {
		setError('password_error', "Password cannot be blank");
		return false;
	}
	return true;

}