package com.flopper.framework.common;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.flopper.framework.db.kandycustomerinfo;
import com.opensymphony.xwork2.ActionSupport;

public class kandycustomerlogin extends ActionSupport implements
		ServletRequestAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpServletRequest request;

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletRequest getServletRequest() {
		return this.request;
	}

	public String execute() {
		try {

			kandycustomerinfo customerinfo = new kandycustomerinfo();

			HashMap<String, String> map = customerinfo
					.getKandyCustomerInfo("customer1");
			if (!(map==null) ){
				request.setAttribute("apikey", map.get("apikey"));
				request.setAttribute("kandyusername", map.get("kandyusername"));
				request.setAttribute("kandyuserpassword", map.get("password"));
				request.setAttribute("agent", "admin@webrtc.techmahindra.com");
				return SUCCESS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "error";
	}
}
