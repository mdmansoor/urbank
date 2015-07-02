package com.flopper.framework.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBHelper {

	 //  Database credentials
	   static final String USER = "mansoor";
	   static final String PASS = "mansoor";
	   static final String DB_URL ="jdbc:oracle:thin:@10.30.133.67:1521:xe";
		public static Connection getConnection()
		{		
		   Connection conn = null;
		   try{
		      Class.forName("oracle.jdbc.driver.OracleDriver");
		     // System.out.println("Connecting to database...");
		      conn = DriverManager.getConnection(DB_URL,USER,PASS);
		   }catch(Exception e){
			   e.printStackTrace();
		   }		
			return conn;		
		}
}
