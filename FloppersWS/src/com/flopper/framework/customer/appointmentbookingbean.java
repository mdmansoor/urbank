package com.flopper.framework.customer;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.flopper.framework.calender.EventGenration;
import com.flopper.framework.constant.Constants;
import com.opensymphony.xwork2.ActionSupport;

public class appointmentbookingbean extends ActionSupport implements
		ServletRequestAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String appointmentDate;
	private String hour;
	private String minute;
	private String emailID;

	HttpServletRequest request;

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletRequest getServletRequest() {
		return this.request;
	}

	public String getAppointmentDate() {
		return appointmentDate;
	}

	public void setAppointmentDate(String appointmentDate) {
		this.appointmentDate = appointmentDate;
	}

	public String getHour() {
		return hour;
	}

	public void setHour(String hour) {
		this.hour = hour;
	}

	public String getMinute() {
		return minute;
	}

	public void setMinute(String minute) {
		this.minute = minute;
	}

	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}

	public String getEmailID() {
		return emailID;
	}

	@Override
	public void validate() {
		validateAppointmentDate();
		validateHour();
		validateMinute();
		validateEmailID();
	}

	public void validateAppointmentDate() {
		if (appointmentDate.equals("")) {
			this.addFieldError("appointmentDate",
					"AppointmentDate cannot be blank");
		}

		if (!validateDate(appointmentDate)) {
			this.addFieldError("appointmentDate",
					"Please enter  valid date dd/mm/yyyy");
		}

		if (!validateDateGreaterThanCurrentDate(appointmentDate)) {
			this.addFieldError("appointmentDate",
					"Date  should be greater than current date");
		}
		return;
	}

	public void validateHour() {
		if (hour.equals("")) {
			this.addFieldError("hour", "Hour cannot be blank");

		}
		return;
	}

	public void validateMinute() {
		if (minute.equals("")) {
			this.addFieldError("minute", "Minute cannot be blank");

		}
		return;
	}

	public void validateEmailID() {
		if (emailID.equals("")) {
			this.addFieldError("emailID", "Email ID cannot be blank");
			return;
		}
		if (!isValidEmail(emailID)) {
			this.addFieldError("emailID", "Please enter valid Email Id ");
		}

		return;
	}

	public final boolean isValidEmail(String value) {
		String regex = "^([a-zA-Z0-9_\\.\\-\\!\\@\\#\\$\\%\\^\\&\\*\\(\\)\\+\\=\\{\\[\\}\\]\\;\\:\\?\\/\\,\\<\\>\\~\\*])+\\@(([a-zA-Z0-9_\\.\\-\\!\\@\\#\\$\\%\\^\\&\\*\\(\\)\\+\\=\\{\\[\\}\\]\\;\\:\\?\\/\\,\\<\\>\\~\\*])+\\.)+([a-zA-Z0-9_\\.\\-\\!\\@\\#\\$\\%\\^\\&\\*\\(\\)\\+\\=\\{\\[\\}\\]\\;\\:\\?\\/\\,\\<\\>\\~\\*]{2,4})+$";
		if (value.length() > 60)
			return false;
		else if (value.matches(regex))
			return true;
		return false;
	}

	public final boolean validateDate(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat(Constants.DATE_FORMAT);
		sdf.setLenient(false);
		try {
			sdf.parse(date);
			return true;
		} catch (ParseException ex) {
			return false;
		}
	}

	public final boolean validateDateGreaterThanCurrentDate(String date) {

		try {
			final SimpleDateFormat dateFormat = new SimpleDateFormat(
					Constants.DATE_FORMAT);
			Date dLastUpdateDate = dateFormat.parse(date);
			Date dCurrentDate = dateFormat.parse(dateFormat.format(new Date()));
			if (dLastUpdateDate.after(dCurrentDate)) {
				System.out.println(true);
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public String execute() throws Exception {
		Map<String, String> map = new HashMap<String, String>();

		map = new EventGenration().genrateEventId(appointmentDate, hour,
				minute, emailID);

		if (map.get(Constants.RESULT).equals(Constants.SUCCESS)) {
			request.setAttribute("EventID", map.get("EventID"));
			request.setAttribute("Time", hour + ":" + minute);

			return SUCCESS;
		} else
			return ERROR;
	}
}
