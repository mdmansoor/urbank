package com.flopper.framework.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.eclipse.jdt.internal.compiler.ast.MagicLiteral;

import com.flopper.framework.constant.Constants;
import com.flopper.framework.db.agentlogincheck;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author MM00344894
 * 
 */
public class agentloginbean extends ActionSupport implements
		ServletRequestAware {

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
		agentlogincheck login = new agentlogincheck();
		Map<String, String> map = new HashMap<String, String>();

		HttpSession session = request.getSession(true);
		map = login.userLogin(username, password);
		if (map.get(Constants.RESULT).equals(Constants.SUCCESS)) {

			session.setAttribute("LASTLOGINTIME", map.get("LASTLOGINTIME"));
			session.setAttribute("SESSION_USERNAME",
					map.get("SESSION_USERNAME"));
			session.setAttribute("SESSION_USERID", username);
			session.setAttribute("USER_ROLE", map.get("USER_ROLE"));
			if (map.get("USER_ROLE").equals("1"))
				return "agent";
			else
				return "admin";
		} else
			this.addFieldError("username", map.get(Constants.RESULT));
		return ERROR;

	}
}
