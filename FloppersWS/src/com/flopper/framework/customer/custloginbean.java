package com.flopper.framework.customer;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.util.ServletContextAware;

import com.flopper.framework.constant.Constants;
import com.flopper.framework.db.KandyUserDetail;
import com.flopper.framework.db.logincheck;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author MM00344894
 * 
 */
public class custloginbean extends ActionSupport implements
		ServletRequestAware, ServletContextAware {

	/**
	 * 
	 */

	ServletContext context;

	public ServletContext getContext() {
		return context;
	}

	@Override
	public void setServletContext(ServletContext context) {
		this.context = context;

	}

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
		logincheck login = new logincheck();
		Map<String, String> map = new HashMap<String, String>();

		HttpSession session = request.getSession(true);
		map = login.userLogin(username, password);
		if (map.get(Constants.RESULT).equals(Constants.SUCCESS)) {

			session.setAttribute("LASTLOGINTIME", map.get("LASTLOGINTIME"));
			session.setAttribute("SESSION_USERNAME",
					map.get("SESSION_USERNAME"));
			session.setAttribute("SESSION_USERID", username);

			map = new KandyUserDetail(context).getKandyUserDetail(username);

			if (!(map == null)) {
				if (!map.isEmpty()) {
					session.setAttribute("KANDY_USERNAME",
							map.get("KANDY_USERNAME"));
					session.setAttribute("KANDY_PASSWORD",
							map.get("KANDY_PASSWORD"));
					session.setAttribute("KANDY_APIKEY",
							map.get("KANDY_APIKEY"));

				} else {
					this.addFieldError("username",
							"Kandy User session unavailable");
					return ERROR;
				}

			}

			return SUCCESS;
		} else
			this.addFieldError("username", map.get(Constants.RESULT));
		return ERROR;

	}

}
