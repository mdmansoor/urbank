package com.flopper.framework.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.flopper.framework.db.KandyUserDetail;
import com.flopper.framework.db.logincheck;

/**
 * Application Lifecycle Listener implementation class SessionListener
 * 
 */
public class SessionListener implements HttpSessionListener {

	/**
	 * Default constructor.
	 */
	public SessionListener() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
	 */
	public void sessionCreated(HttpSessionEvent session) {

	}

	/**
	 * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
	 */
	public void sessionDestroyed(HttpSessionEvent sessionEvent) {

		System.out.println("sessionout"
				+ sessionEvent.getSession().getAttribute("SESSION_USERID"));

		String userID = (String) sessionEvent.getSession().getAttribute(
				"SESSION_USERID");
		if (userID != null) {
			new logincheck().userLogout(userID);

			new KandyUserDetail().kandyUserLogout(userID);
		}
	}

}
