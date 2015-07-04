package com.flopper.framework.servlet;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VoiceCustomerServlet
 */
public class VoiceCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoiceCustomerServlet() {
        super();
    }

       protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	   System.out.println("Get method");
              doPost(request, response);
       }

       protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
              String data = request.getParameter("final_span");
              String customer = request.getParameter("username");
              Date date = new Date();                         
              SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
              String dirName= format1.format(date.getTime());
              
              if(data!=null && data.length()!=0){
                     File file = new File("D:\\"+ customer + dirName + ".txt");
                       if(file.length()<0)
                                  file.createNewFile();          
                    FileWriter writer = new FileWriter(file,true); 
                    writer.write(date.getTime()+"-"+ customer +":"+ data+"\n"); 
                    writer.flush();
                    writer.close();
              }
       }
}
