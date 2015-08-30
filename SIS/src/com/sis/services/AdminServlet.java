package com.sis.services;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sis.util.ConnectionManager;
import com.sis.util.RandomString;
import com.sis.util.SendEmail;

/**
 * Servlet implementation class AdminServlet
 */
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() 
	  { 
    	//assse....
	      System.out.println("I am In init  method.........");
	  } 

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String type=request.getParameter("type");
		
		if(type.equals("addBasicInfo"))
			addStudentBasicInfo(request,response);
		// TODO Auto-generated method stub
	}
	
	protected void addStudentBasicInfo(HttpServletRequest request, HttpServletResponse response)
	{
		Connection con= getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		final String SUBJECT="University Enrollment";
		final String URL="http://192.178.67.89:8080/SIS/";
		String roll=request.getParameter("roll");
		String rank=request.getParameter("rank");
		String entType=request.getParameter("entType");
		String dept=request.getParameter("dept");
		String fName=request.getParameter("fName");
		String mName=request.getParameter("mName");
		String lName=request.getParameter("lName");
		String dob=request.getParameter("dob");	
		String contactNumber=request.getParameter("contactNumber");
		String email=request.getParameter("email");
		String password=RandomString.getPassword();
		String unvRoll="";//TODO should be generated
		
		String msg="Hi "+fName+" We have added your basic information\n and also sent you credeintials for this site \n please add others info."
				+ "\n USER ID :"+unvRoll+"\n PASSWORD:"+password+" URL:"+URL;
		String isMailSent=SendEmail.sendEmail(email, SUBJECT, msg);//success
		
		if(isMailSent.equals("success"))
			isMailSent="y";
		else
			isMailSent="n";
		
		try{
			con.setAutoCommit(false);
			
			stmt=con.createStatement();
			
			
			
			
			
			
			 
		}catch(SQLException ex){
			ex.printStackTrace();
		}finally{
			try {
				stmt.close();
				rs.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}}
		
	
	
	 private Connection getConnection(){
	 		InputStream stream = getServletContext().getResourceAsStream("resources/sis.properties");
			try{
				Properties props=new Properties();
				props.load(stream);
				String driver= props.getProperty("db.drivername");
				String url= props.getProperty("db.dburl");
				String userName= props.getProperty("db.username");
				String password= props.getProperty("db.password");
				return ConnectionManager.getConnection(driver,url,userName,password);
			}catch(IOException ex){ex.printStackTrace();}
	return null;
}
	  public void destroy() 
	  { 
	      System.out.println("I am In destroy method.........");
	  } 	

}
