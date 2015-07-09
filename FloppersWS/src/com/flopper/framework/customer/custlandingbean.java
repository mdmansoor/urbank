package com.flopper.framework.customer;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.flopper.framework.constant.Constants;
import com.flopper.framework.db.KandyUserDetail;
import com.flopper.framework.db.logincheck;
import com.opensymphony.xwork2.ActionSupport;

public class custlandingbean extends ActionSupport implements
		ServletRequestAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1922525224896527573L;
	HttpServletRequest request;

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletRequest getServletRequest() {
		return this.request;
	}

	public String logout() throws Exception {

		HttpSession session = request.getSession(false);
		String userID = (String) session.getAttribute("SESSION_USERID");
		if (userID != null) {
			session.invalidate();
		}
		return "logout";

	}

	public String appointment() throws Exception {
		return "appointment";

	}
	
	public String scheduledmeeting() throws Exception {
		return "scheduledmeeting";

	}
	
	public String input() throws Exception {
		return "input";

	}

}
