<%
	String contextPath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
<title>Login Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="<%=contextPath %>/css/yregbase_sec_ui_1_9.css" type="text/css">
<%@ include file="/jsp/common/header.jsp" %>
</head><hr>
<body>
<form id="searchForm" name="form1" method="post"	action="<%=request.getContextPath()%>/CommonAction?type=search"><input	type=hidden value=xxx name=getit></form>
<TABLE align="center">
		<TR>
			<TD>
				<a href="javascript:document.forms['searchForm'].submit()"><strong>Search</strong></a>
			</TD>
		</TR>
		<TR>
			<TD>
				<a href="jsp/common/fileUpload.jsp"><strong>Upload Student Basic Info</strong></a>
			</TD>
		</TR>
		
		<TR>
			<TD>
				<a href="jsp/admin/studentBasicInfo.jsp"><strong>Add Student Basic Information</strong></a>
			</TD>
		</TR>

	</TABLE>
</body>
</html>