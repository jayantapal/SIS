<%
	String headerContextPath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
<%
String loggedUser=(String)session.getAttribute("LoggedUser");
//System.out.println("$$$$$$$$$$$$$$$$$$$   user 1: "+(String)session.getAttribute("LoggedUser"));
%>
<script type="text/javascript">
function openNewWindow(url, name, width, height) {
	var params ;
    var width = width || 350;
    var height = height || 350;
    params = 'width=' + width + ',height=' + height + ',left=200,top=150,status=0,toolbar=no,location=no,menubar=0,directories=0,scrollbars=no,resizable=no,dialog=yes';
	var popup=null;
	popup=window.open(url, name, params );
	top.popupWindow=popup;
}


</script>
</HEAD>

<BODY>
<form id="form1" name="form1" method=post
	action="<%=request.getContextPath()%>/CommonAction?type=logout"><input
	type=hidden value=xxx name=getit></form>
<TABLE>
<TR>
	<TD>
		<TABLE>
		<TR>
			<TD>
			<!--  img src="<%=headerContextPath%>/images/project.jpg" width="80" height="83" border="0" alt="Header">-->
			</TD>
		</TR>
		</TABLE>
	</TD>
	<TD>
		<TABLE>
			<TR>
				<TD>
				<font size="5" color="#000000"><strong>Student Information System</strong></font>
				</TD>
			</TR>			
			<TR>	
				<TD><font size="2">to meet the information needs of the students</font><font size="2" face="Symbol"></TD>
					 
				<TD ><div style="border: medium none; margin: 1px 0px 0px 550px; cursor: pointer;" >
								Logged in as: <%=loggedUser %>  
								</div>	</TD>				
			</TR>
			<TR>
				<TD>&nbsp;</TD>
				<TD>
					<div style="border: medium none; margin: 1px 0px 0px 550px; cursor: pointer;" >
						<a href="#" onclick="javascript:openNewWindow('<%=headerContextPath%>/jsp/common/changePassword.jsp','Change',260,360);"><strong>ChangePassword</strong></a>	
						&nbsp; <a href="javascript:document.forms['form1'].submit()"><strong>Logout</strong></a>
					</div>
				</TD>
			</TR>
	   </TABLE>
	</TD>
</TR>

</TABLE>
</BODY>
</HTML>