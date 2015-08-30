<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
/* response.setHeader("Cache-control","no-store"); //HTTP 1.1 
response.setHeader("Pragma","no-cache"); //HTTP1.0 
response.setDateHeader("Expire",0); //prevents caching at the proxy server  */
String contextPath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ request.getContextPath();
	
%>


<%
      /*  if(session.getAttribute("LoggedUser")==null)
            {
    	   RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
    	   rd.forward(request, response);
            }  */
%>
<html>
<head>

<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">

<title>Login Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="<%=contextPath %>/css/yregbase_sec_ui_1_9.css" type="text/css">
</head>


<body>

<form action="<%=request.getContextPath()%>/CommonAction?type=login" method="post">


 <div id="loginBox">

 <TABLE>
<TR>
	<TD width="35%"></TD>
	<TD width="50%">
		<TABLE>
		<TR>
			<TD align="center"><INPUT TYPE="image" SRC="<%=contextPath %>/images/sis.png"></TD>
		</TR>
		<TR>
			 <TD> <!--<h2>Welcome to Student Information System</h2> -->
			<h4>to meet the information needs of the students</h4></TD>
		</TR>
		</TABLE>
	</TD>
	
	<TD align="right">
		<div id="yreglg">		
		<div class="top yregbx">
		  <div class="yregbxi"> 
			<div class=" badge">
				<h2>Sign in to </h2>	
				<h2>Student Information System!</h2>															 
				<fieldset id="fsLogin" class="clear">
					<legend>Login Form</legend>
					<div id="inputs">
						<label for="username">User ID</label>
						<input name="userName" id="userName" maxlength="96" tabindex="1">
						<p id="ex"></p>
						<label for="passwd">Password</label>
						<input name="password" id="password" maxlength="64" tabindex="2" type="password">
					</div>
					<div id="fun">
					<b><font color="#cc0000" size="3px"></font></b>						
					</div>					
					<div id="submit">
						<br>
						<button type="submit" id=".save" name=".save" class="primaryCta" tabindex="5" >
						  Sign In
						</button>
					</div>
				</fieldset>
			</div>	
		   <div id="lisu">
			 <div id="yregmain">
			   <h3>Don't have a User ID?</h3>		   
			   <a id="signUpBtn" tabindex="8" class="secondaryCta" href="#">Sign Up here</a>
			 </div>
			</div><!-- end lisu -->
		  </div>
		</div>
      </div>
 
 
	
	</TD>
	<TD></TD>
</TR>
</TABLE>
</div><!-- end loginHolder -->	
	
</form>
</body>
</html>
