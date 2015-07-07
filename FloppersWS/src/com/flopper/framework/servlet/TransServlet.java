package com.flopper.framework.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.memetix.mst.language.Language;
import com.memetix.mst.translate.Translate;

/**
 * Servlet implementation class TransServlet
 */
public class TransServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TransServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			//String data = request.getParameter("message");
			 String data = "HI Good Morning ";
			System.out.println(data);

			System.getProperties().put("proxySet", "true");
			System.getProperties().put("proxyHost", "one.proxy.att.com");
			System.getProperties().put("proxyPort", "8080");

			Translate.setClientId("URBANK");
			Translate
					.setClientSecret("2eROFQziZko9sDH/Z+23pWjGeQq3p8fwyMCgyvXRLe0=");

			// Translate an english string to spanish
			String englishString = data;
			String spanishTranslation = Translate.execute(englishString,
					Language.HINDI);
			String valueISO = new String(spanishTranslation.getBytes("CP850"),
					"ISO-8859-1");
			String valueUTF8 = new String(valueISO.getBytes(), "UTF-8");
			System.out.println("Original english phrase: " + data);
			System.out
					.println("Translated hindi valueUTF8: " + valueUTF8);
			System.out
			.println("Translated hindi direct: " + spanishTranslation);

			PrintWriter out = response.getWriter();
			
			
			
			out.println(spanishTranslation);
			
			
			
			request.setCharacterEncoding("utf8");
	        //response.setCharacterEncoding("utf8");
	        response.setContentType("application/json");
	        
	       
	        JSONObject obj = new JSONObject();
	        obj.put("message", spanishTranslation);
	        out.print(obj);
			
			 
		      // Set response content type
		      
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
