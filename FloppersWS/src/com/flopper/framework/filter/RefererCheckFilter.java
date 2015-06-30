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

/**
 * Servlet Filter implementation class RefererCheckFilter
 */
public class RefererCheckFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public RefererCheckFilter() {
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

		HttpServletRequest _request = (HttpServletRequest) request;
		System.out.println("Mansoor" + System.currentTimeMillis()
				+ (30 * 60 * 1000L));
		HttpServletResponse _response = (HttpServletResponse) response;
		_response.setDateHeader("Expires", System.currentTimeMillis()
				+ (30 * 60 * 1000L));
		String _path = _request.getContextPath();
		String unauthAccessURL = _path + "/common/eunauthoriseaccess.jsp";
		String URI = _request.getRequestURI();
		String pgm[] = URI.split("/");
		/* CacheDisable Begins */
		_response.setCharacterEncoding("UTF-8");
		_response.setDateHeader("Expires", 0);
		// _response.setHeader("Pragma", "no-cache");
		_response.setHeader("Pragma", "no-store");
		if (_request.getProtocol().equals("HTTP/1.1")) {
			// _response.setHeader("Cache-Control",
			// "max-age=0, no-cache, must-revalidate, no-store");
			_response.setHeader("Cache-Control", "no-store");
		}
		int i = pgm.length;
		if (pgm[3].equals("customerlogin.jsp"))
			chain.doFilter(request, response);
		else {
			System.out.println(_request.getHeader("referer"));
			if (_request.getHeader("referer") == null) {

				_response.sendRedirect(unauthAccessURL);
			} else {
				chain.doFilter(request, _response);
			}
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

}
