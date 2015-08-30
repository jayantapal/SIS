
package com.sis.util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
 
/**
 * This class contains helper methods for components
 * that access any databases.
 */
public final class DBUtil {
	
	//private static final Logger LOGGER=LoggerFactory.getLogger(DBUtil.class);
	
	
	public  final static void resultSetClose(ResultSet rs){
		try{
			if (rs !=null) rs.close(); 
			rs=null;
		}catch(Exception ex){
		//	LOGGER.error("Global ResultSet Close Error : " + ex);
		}
	}
	public static final void statementClose(Statement stmt){
		try{
			if (stmt !=null) stmt.close();
			stmt=null;
		}catch(Exception ex){
		//	LOGGER.error("Global Statement Close Error : " + ex);
		}
	}
	public static final void prepareStatementClose(PreparedStatement pstmt){
		try{
			if (pstmt !=null) pstmt.close();
			pstmt=null;
		}catch(Exception ex){
			//LOGGER.error("Global PreparedStatement Close Error : " + ex);
		} 
	}
	@SuppressWarnings("null")
	public  static final void connectionClose(Connection con){
		try{
			if (con != null || con.isClosed()==false ) 
			con.close();
			con=null;
		}catch(Exception ex){
			//LOGGER.error("Global Connection Close Error : "+ ex);
		}
	}
	
	@SuppressWarnings("null")
	public static final void callableStatementClose(CallableStatement cs){
		try{
			if (cs != null || cs.isClosed()==false ) cs.close();
			cs=null;
		}catch(Exception ex){
			//LOGGER.error("Global Callable Statement Close Error : "+ ex);
		}
	}
} 
