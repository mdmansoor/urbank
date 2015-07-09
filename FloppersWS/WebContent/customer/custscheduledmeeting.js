

function doReset() {
	clearErrors();
}

function clearErrors() {
	document.getElementById('eventID_error').innerHTML = '';
}

function doRevalidate() {
	if (!validateEventID())
		errors++;

	

}

function validateEventID() {
	var eventID = $("#eventID").val();
	document.getElementById('eventID_error').innerHTML = '';
	if (appointmentDate == '') {
		setError('eventID_error', "Event ID cannot be blank");
		return false;
	}
	return true;
}
