package com.flopper.framework.customer;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.flopper.framework.db.logincheck;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author MM00344894
 * 
 */
public class scheduledmeetingbean extends ActionSupport implements
ServletRequestAware  {

	private static final long serialVersionUID = 1L;
	private String eventId;
	private String date;
	private String eventTime;
	HttpServletRequest request;

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletRequest getServletRequest() {
		return this.request;
	}

	public String getEventId() {
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getEventTime() {
		return eventTime;
	}

	public void setEventTime(String eventTime) {
		this.eventTime = eventTime;
	}

	@Override
	public void validate() {
		validateEventId();		
	}

	public void validateEventId() {
		if (eventId.equals("")) {
			this.addFieldError("eventId", "EventId cannot be blank");
		}
		else{
		
			
		}
	}	

	@Override
	public String execute() throws Exception {
		logincheck login = new logincheck();
		Map<String, String> map = new HashMap<String, String>();

	
		/*HttpSession session =request.getSession(true);
		map = login.userLogin(username, password);
		if (map.get(Constants.RESULT).equals(Constants.SUCCESS)) {

			session.setAttribute("LASTLOGINTIME", map.get("LASTLOGINTIME"));
			session.setAttribute("USER_NAME", username);
			return SUCCESS;
		} else
			return ERROR;
*/
		return "";
	}

}

