function doReset() {
	clearErrors();
}

function clearErrors() {
	document.getElementById('eventID_error').innerHTML = '';
}

function validateUsername() {
	var eventID = $("#eventID").val();
	document.getElementById('eventID').innerHTML = '';
	if (eventID == '') {
		setError('eventID', "eventID cannot be blank");
		return false;
	}
	return true;
}