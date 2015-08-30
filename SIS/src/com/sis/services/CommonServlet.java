package com.sis.services;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sis.util.ConnectionManager;
import com.sis.util.ConnectionUtil;
import com.sis.vo.Country;

/**
 * Servlet implementation class CommonServlet
 */
public class CommonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String targetPath = "";
	RequestDispatcher rd=null;
    public CommonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String actionType=request.getParameter("type");
		System.out.println("Action Type======"+actionType);
		if(actionType.equals("login"))
			login(request,response);
		if(actionType.equals("logout"))
			logout(request,response);
		if(actionType.equals("search"))
			search(request,response);
		if(actionType.equals("state"))
			getState(request,response);
		if(actionType.equals("district"))
			getDistrict(request,response);
		
			
	}
	
private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
	

	String contextPath=request.getSession().getServletContext().getContextPath();
	System.out.println("Contextpath===="+contextPath);
	
		HttpSession session=request.getSession();
		session.setAttribute("LoggedUser", "Jayanta");
		rd=request.getRequestDispatcher("jsp/common/home.jsp");
		rd.forward(request, response);
	}
private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		

	HttpSession session = request.getSession(false);
	session.invalidate();
	//targetPath = ApplicationConstants.VALID;
	//actionMessage = new ActionMessage("success.logout.msg");
	//saveMessages(request, actionMessages);
	rd=request.getRequestDispatcher("jsp/common/login.jsp");
	rd.forward(request, response);
	}
	private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
				List<Country> countryList=new ArrayList<Country>();
				Connection con= getConnection();
				Statement stmt=null;
				ResultSet rs=null;
				try{
					stmt=con.createStatement();
					rs=stmt.executeQuery("select id,country_name from country");
					
					Country country=null;
					
					while (rs.next())
					{
						country=new Country();
						//System.out.println(rs.getInt(1)+"--------"+rs.getString(2));
						country.setId(rs.getInt(1));
						country.setCointryName(rs.getString(2));
						countryList.add(country);
					}
					
				}catch(SQLException ex){
					ex.printStackTrace();
				}
				finally{
					try {
						stmt.close();
						rs.close();
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				request.setAttribute("countryList", countryList);
				rd=request.getRequestDispatcher("jsp/common/search.jsp");
				rd.forward(request, response);
	}
	
	private void getState(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String countryId=request.getParameter("countryId");
		if(!countryId.equals("-1")){
		System.out.println("Country Id=="+countryId);
		Connection con= getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		try{
			stmt=con.createStatement();
			String buffer="<select name='state' onchange='showDistrict(this.value);'><option value='-1'>--SELECT--</option>";
			String sql="SELECT id,state_name FROM state WHERE country_id ="+Integer.parseInt(countryId.trim())+"";
			System.out.println(sql);
			rs=stmt.executeQuery(sql);
			
			while (rs.next())
			{
				
				 buffer=buffer+"<option value='"+String.valueOf(rs.getInt(1))+"'>"+rs.getString(2)+"</option>";  	
			}
			 buffer=buffer+"</select>"; 
				System.out.println(buffer);
						 response.getWriter().println(buffer); 
			
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
}
	
private void getDistrict(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String stateId=request.getParameter("stateId");
		System.out.println("State Id=="+stateId);
		if(!stateId.equals("-1")){
		Connection con= getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		try{
			stmt=con.createStatement();
			String buffer="<select name='district' onchange='showCity(this.value);'><option value='-1'>--SELECT--</option>";
			String sql="SELECT id,district_name FROM district WHERE state_id ="+Integer.parseInt(stateId.trim())+"";
			System.out.println(sql);
			rs=stmt.executeQuery(sql);
			
			while (rs.next())
			{
				
				 buffer=buffer+"<option value='"+String.valueOf(rs.getInt(1))+"'>"+rs.getString(2)+"</option>";  	
			}
			 buffer=buffer+"</select>"; 
				System.out.println(buffer);
						 response.getWriter().println(buffer); 
			
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
}
	
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

}
