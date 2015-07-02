package com.flopper.framework.customer1;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.flopper.framework.constant.Constants;
import com.flopper.framework.db.logincheck;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author MM00344894
 * 
 */
public class custloginbean extends ActionSupport implements ServletRequestAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String username;
	private String password;
	HttpServletRequest request;

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletRequest getServletRequest() {
		return this.request;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public void validate() {
		validateUserName();
		validatePassWord();
	}

	public void validateUserName() {
		if (username.equals("")) {
			this.addFieldError("username", "UserID cannot be blank");

		}
	}

	public void validatePassWord() {
		if (password.equals("")) {
			this.addFieldError("password", "Password cannot be blank");

		}
	}

	@Override
	public String execute() throws Exception {

		HttpSession session = request.getSession(true);

		session.setAttribute("LASTLOGINTIME", "02/07/2015");
		session.setAttribute("SESSION_USERNAME", "Mansoor M");
		session.setAttribute("SESSION_USERID", username);

		return SUCCESS;

	}

}
