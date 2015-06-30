package com.flopper.framework.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class WebContextImpl extends WebContext {

	private static final long serialVersionUID = -9208968922016854405L;

	private transient HttpServletRequest request = null;
	private transient HttpServletResponse response = null;

	public void init() {
		WebContext.setInstance(this);
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public HttpSession getSession() {
		return request.getSession();
	}

	public HttpSession getSession(boolean create) {
		return request.getSession(create);
	}

	public void destroy() {
		WebContext.destroyInstance();
	}
}
