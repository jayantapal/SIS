<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String contextPath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ request.getContextPath();
	String flag = (String)request.getAttribute("flag");
%>
<html>
<head>
<title>Change Password Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="<%=contextPath %>/css/yregbase_sec_ui_1_9.css" type="text/css">
<style>
#passwordStrength
{
	height:10px;
	display:block;
	float:left;
}

.strength0
{
	width:210px;
	background:#cccccc;
}

.strength1
{
	width:50px;
	background:#ff0000;
}

.strength2
{
	width:90px;	
	background:#ff5f5f;
}

.strength3
{
	width:130px;
	background:#56e500;
}

.strength4
{
	background:#4dcd00;
	width:170px;
}

.strength5
{
	background:#399800;
	width:210px;
}
</style>
<script type="text/javascript">
function checkPassword() {
	
	var myString = document.getElementById('newpwd').value;
	var oldString = document.getElementById('oldpwd').value;
	var re = /^[A-Za-z0-9]\w{6,}[A-Za-z0-9]$/;
	if (Trim(myString) != "") {
		if (myString != oldString) {
			if (!re.test(myString)) { 
				alert("Please enter a valid password !!!" +
				'\n' + "The password must contain atleast 8 characters." +
				'\n' + "Only underscore is allowed as a special character."); 
				document.getElementById('newpwd').value = '';
				passwordStrength(document.getElementById('newpwd').value);
				setTimeout(function(){document.getElementById('newpwd').focus()}, 10);
				//document.getElementById('newpwd').focus();
			}
		}
		else {
			alert("Both old & new passwords are same." +
			'\n' + "Please provide a different password.");
			document.getElementById('newpwd').value = '';
			passwordStrength(document.getElementById('newpwd').value);
			setTimeout(function(){document.getElementById('newpwd').focus()}, 10);
			//document.getElementById('newpwd').focus();
		}
	}
}

function validPassword() {
	if (document.getElementById('conpwd').value != '') {
		if (document.getElementById('newpwd').value != document.getElementById('conpwd').value) {
			alert("Please confirm the password !!!"); 
			document.getElementById('conpwd').value = '';
			setTimeout(function(){document.getElementById('conpwd').focus()}, 10);
			//document.getElementById('conpwd').focus();
		}
	}
}

function passwordStrength(password)
{
	var desc = new Array();
	desc[0] = "Very Weak";
	desc[1] = "Weak";
	desc[2] = "Better";
	desc[3] = "Medium";
	desc[4] = "Strong";
	desc[5] = "Strongest";

	var score   = 0;

	//if password bigger than 6 give 1 point
	if (password.length > 6) score++;

	//if password has both lower and uppercase characters give 1 point	
	if ( ( password.match(/[a-z]/) ) && ( password.match(/[A-Z]/) ) ) score++;

	//if password has at least one number give 1 point
	if (password.match(/\d+/)) score++;

	//if password has at least one special caracther give 1 point
	if ( password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/) )	score++;

	//if password bigger than 12 give another 1 point
	if (password.length > 12) score++;

	 document.getElementById("passwordDescription").innerHTML = desc[score];
	 document.getElementById("passwordStrength").className = "strength" + score;
}

function submitChangeFrom() {
	if(checkFields()==false)
	{
		return false;
	}
	else
	{		
		document.getElementById('chng').submit();	
		return true;
	}	
 } 
 function checkFields() {

	var res=false;
		
	var x=document.getElementById('oldpwd').value;
	var y=document.getElementById('newpwd').value;
	var z=document.getElementById('conpwd').value;
	
	
	if(Trim(x) == "") {
		alert("Please provide the old password !!!");
		setTimeout(function(){document.getElementById('oldpwd').focus()}, 10);
	}
	else if(Trim(y) == "") {
		alert("Please provide the new password !!!");
		setTimeout(function(){document.getElementById('newpwd').focus()}, 10);
	}
	else if(Trim(z) == "") {
		alert("Please confirm the password !!!");
		setTimeout(function(){document.getElementById('conpwd').focus()}, 10);	
	}
	else 
		res=true;
	
	return res;

}
function Trim(str) {
    while (str.substring(0,1) == ' ') { // check for white spaces from beginning
        str = str.substring(1, str.length);
    }
    while (str.substring(str.length-1, str.length) == ' ') { // check white space from end
        str = str.substring(0,str.length-1);
    }
    return str;
}
function checkStatus() {
	var flag = '<%=flag%>';
	if (flag == "success") {
		<%
		request.setAttribute("flag", "");
		%>
		window.close();
		window.opener.location.href="<%=contextPath %>/logoutAction.do";
	}
}
</script>
</head>


<body onload="checkStatus();">

<form styleId="chng"  action="/changePasswordAction"  focus="oldpwd" method="post">


 <div id="loginBox">

 <TABLE align="center">
<TR>
		
	<TD align="center">
		<div id="yreglgchng">
		<!-- <center><font color=#cc0000 >err</font><center/> -->
		<div class="top yregbx">
		  <div class="yregbxi"> 
			<div class=" badge">
				<h2>Change Password </h2>										 
				<fieldset id="fsLogin" class="clear">
					<legend>Login Form</legend>
					<div id="inputs">
						<label for="oldpwd">Old Password</label>
						<input name="oldpwd" id="oldpwd" maxlength="64" tabindex="1" type="password" />
						<br /><br />
						<label for="newpwd">New Password</label>
						<input name="newpwd" id="newpwd" maxlength="64" tabindex="2" type="password" onblur="checkPassword();" onkeyup="passwordStrength(this.value);" />
						<br /><br/>
						<p>
							<div id="passwordDescription">Password not entered</div>
							<div id="passwordStrength" class="strength0"></div>
						</p>
						<br /><br />			    
						<label for="conpwd">Confirm Password</label>
						<input name="conpwd" id="conpwd" maxlength="64" tabindex="3" type="password" onblur="validPassword();" />
					</div>
					<div id="submit">
					<table align="center">
					<tr>
						<td  align="right">
							<input type="submit" value="Save" onclick="return submitChangeFrom()"/>
                        </td>
                        <td align='left'>
					  		 <input type="button" class="button" name="cancel" value="Cancel" onclick="window.close()"/>					     
					    </td>
					    </tr>
					</table>
					</div>
				</fieldset>
			</div>
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
