<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5.0 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<form action="<%=request.getContextPath()%>/AdminServlet?type=addBasicInfo" method="post">">
	
	<table align="center">
			<thead	>
				<tr><td>Roll</td><td><input type="text" name="roll"></td></tr>
				<tr><td>Rank</td><td><input type="text" name="rank"></td></tr>
				<tr><td>Entrance Type</td><td><input type="text" name="entType"></td></tr>
				<tr><td>Department</td><td><input type="text" name="dept"></td></tr>
				<tr><td>First Name</td><td><input type="text" name="fName"></td></tr>
				<tr><td>Middle Name</td><td><input type="text" name="mName"></td></tr>
				<tr><td>Last Name</td><td><input type="text" name="lName"></td></tr>
				<tr><td>DOB(dd/mm/yyyy)</td><td><input type="date" name="dob"></td></tr>
				<tr><td>Contact Number </td><td><input type="text" name="contactNumber"></td></tr>
				<tr><td>Email</td><td><input type="text" name="email"></td></tr>
				<tr><td>&nbsp;</td><td><input type="submit" value="Submit"></td></tr>
			</thead>
		</table>
		
</form>
	
	
</body>
</html>