package com.sis.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionManager {
	public static Connection getConnection(String driverName,String dbURL,String userName,String password)
	{
	
	System.out.println("driverName:"+driverName+"      dbURL:"+dbURL+"     userName:"+userName+"   password:"+password);
		Connection con=null;
		 try
		    {		   
			 Class.forName(driverName.trim());
			 con = DriverManager.getConnection(dbURL.trim(), userName.trim(), password.trim()); }
		    catch(Exception e)
		    {
		      e.printStackTrace();
		    }
		return con;
	}
	


}
