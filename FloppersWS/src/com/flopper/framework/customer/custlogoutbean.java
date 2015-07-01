package com.flopper.framework.customer;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.flopper.framework.constant.Constants;
import com.flopper.framework.db.logincheck;
import com.opensymphony.xwork2.ActionSupport;

public class custlogoutbean extends ActionSupport implements
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

	@Override
	public String execute() throws Exception {

		HttpSession session = request.getSession(false);
		String userID = (String) session.getAttribute("SESSION_USERID");
		if (userID != null)
			new logincheck().userLogout(userID);
		return SUCCESS;

	}

}
