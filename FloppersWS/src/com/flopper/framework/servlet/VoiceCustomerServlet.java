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
    private static final String coversationPath="D:\\Conversations\\Customers";
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
              System.out.println("Data:"+data);
              System.out.println("Customer:"+customer);
              Date date = new Date(); 
             // String newStr = data.replaceAll("<li>", "");
              //newStr = newStr.replaceAll("</li>", "");
              SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
              String dirName= format1.format(date.getTime());
              createDir();
              
              if(data!=null && data.length()!=0){
                     File file = new File(coversationPath+"\\"+ dirName +"-"+ customer + ".txt");
                       if(file.length()<0)
                                  file.createNewFile();          
                    FileWriter writer = new FileWriter(file,true); 
                    //writer.write(date.getTime()+"-"+ customer +":"+ data+"\n"); 
                    writer.write(data+"\n");
                    writer.flush();
                    writer.close();
              }
       }
       
       private void createDir(){
    	   File file = new File(coversationPath);
    		if (!file.exists()) {
    			if (file.mkdirs()) {
    				System.out.println("Directory is created!");
    			} else {
    				System.out.println("Failed to create directory!");
    			}
    		}
       }      
      
}
