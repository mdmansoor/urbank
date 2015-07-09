package com.flopper.framework.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class SessionFilter
 */
public class AgentSessionFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public AgentSessionFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletResponse _response = (HttpServletResponse) response;
		HttpServletRequest _request = (HttpServletRequest) request;

		HttpSession session = _request.getSession(false);
		String _path = _request.getContextPath();
		String URI = _request.getRequestURI();
		String unauthAccessURL = _path + "/common/agentlogin.jsp";

		if (session == null) {
			 session = _request.getSession(true);
			_response.sendRedirect(unauthAccessURL);
		} else {
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
