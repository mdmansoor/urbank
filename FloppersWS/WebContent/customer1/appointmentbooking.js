var myCalendar;
function doOnLoad() {
	myCalendar = new dhtmlXCalendarObject({
		input : "appointmentDate",
		button : "appointmentDate_icon"
	});
	myCalendar.setDateFormat("%d/%m/%Y");
}

function doReset() {
	clearErrors();
}

function clearErrors() {
	document.getElementById('appointmentDate_error').innerHTML = '';
	document.getElementById('hour_error').innerHTML = '';
	document.getElementById('minute_error').innerHTML = '';
	document.getElementById('emailID_error').innerHTML = '';
}

function doRevalidate() {
	if (!validateAppointmentDate())
		errors++;

	if (!validateHour())
		errors++;

	if (!validateMinute())
		errors++;
	if (!validateEmailID())
		errors++;

}

function validateAppointmentDate() {
	var appointmentDate = $("#appointmentDate").val();
	document.getElementById('appointmentDate_error').innerHTML = '';
	if (appointmentDate == '') {
		setError('appointmentDate_error', "AppointmentDate cannot be blank");
		return false;
	}
	return true;
}

function validateHour() {
	var hour = $("#hour").val();
	document.getElementById('hour_error').innerHTML = '';
	if (hour == '') {
		setError('hour_error', "Hour cannot be blank");
		return false;
	}
	return true;

}

function validateMinute() {
	var minute = $("#minute").val();
	document.getElementById('minute_error').innerHTML = '';
	if (minute == '') {
		setError('minute_error', "Minute cannot be blank");
		return false;
	}
	return true;

}

function validateEmailID() {
	var emailID = document.getElementById("emailID").value;
	document.getElementById('emailID_error').innerHTML = '';
	if (emailID == '') {
		setError('emailID_error', "Email ID Cannot be Blank");
		return false;
	}
	if (!isEmail(emailID)) {
		setError('emailID_error', "Please Enter valid Email ID");
		return false;
	}
	return true;
}