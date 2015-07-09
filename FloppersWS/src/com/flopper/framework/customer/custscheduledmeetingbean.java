package com.flopper.framework.customer;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.flopper.framework.calender.EventGenration;
import com.opensymphony.xwork2.ActionSupport;

public class custscheduledmeetingbean extends ActionSupport implements
		ServletRequestAware {

	private HttpServletRequest request;

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletRequest getServletRequest() {
		return this.request;
	}

	private String eventID;

	public String getEventID() {
		return eventID;
	}

	public void setEventID(String eventID) {
		this.eventID = eventID;
	}

	@Override
	public void validate() {
		validateEventID();
	}

	public void validateEventID() {
		if (eventID.equals("")) {
			this.addFieldError("eventID", "Event ID cannot be blank");
		}
		if (new EventGenration().validateEventID(eventID))
			return;
		this.addFieldError("eventID", "Invalid Event ID");

	}

	@Override
	public String execute() throws Exception {
		addActionMessage("scdulemeeting");
		return SUCCESS;
	}

}
