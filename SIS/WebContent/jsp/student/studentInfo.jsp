<%-- 
    Document   : studentInfo
    Created on : Jun 21, 2015, 7:05:41 AM
    Author     : SUBHENDU
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center" ><p style="background-color:#cccccc; color:fuchsia">Student Info!</p></h1>
        <form>
        <table align="center" border="1">
            <thead>
            <tbody>
            <tr><td>Roll No : </td><td><input type="text" name="roll" size="50"/></td></tr>
            <tr><td>University Roll No : </td><td><input type="text" name="uroll" size="50"/></td></tr>
            <tr><td>Rank : </td><td><input type="text" name="rank"/></td></tr>
            <tr><td>Enterence Type : </td><td><input type="text" name="etype"/></td></tr>
            <tr><td>Department : </td><td><input type="text" name="department"/></td></tr>
            <tr><td>Full Name : </td><td><input type="text" name="fname"/></td></tr>
            <tr><td>Middle Name : </td><td><input type="text" name="mname"/></td></tr>
            <tr><td>Last Name : </td><td><input type="text" name="lname"/></td></tr>
            <tr><td>Date of Birth : </td><td><input type="date" name="dob"/></td></tr>
            <tr><td>Contact No : </td><td><input type="text" name="contactno"/></td></tr>
            <tr><td>Email : </td><td><input type="email" name="email"/></td></tr>
            <tr><td>Select Image : </td><td><input type="file" name="imagelocation"/></td></tr>
            <tr><td>Password : </td><td><input type="password" name="password"/></td></tr>
            <tr><td>Nationality : </td><td><input type="text" name="nationality"/></td></tr>
            <tr><td>Father Name : </td><td><input type="text" name="fathername"/></td></tr>
            <tr><td>Cast : </td><td><input type="text" name="cast"/></td></tr>
            <tr><td>Gender : </td><td><input type="radio" name="gender" value="Male"/>Male
                             <input type="radio" name="gender" value="Female"/>Female</td></tr>
            <tr><td>Blood Group : </td><td><select>
                     <option value="O+">O+</option>
                     <option value="O-">O-</option>
                     <option value="AB+">AB+</option>
                     <option value="AB-">AB-</option>
                    </select></td></tr>
            <tr><td>Present Address : </td><td><textarea name="presentaddress" rows="8" cols="55"></textarea></td></tr> 
            <tr><td>Is Present and Permanent address is deferent: </td><td><input type="checkbox" name="cbox" /></td></tr>
            <tr><td>Permanent Address : </td><td><textarea name="presentaddress" rows="8" cols="55"/></textarea></td></tr> <br/>
            <tr><td></td><td><input type="reset" value="Reset" />&nbsp;&nbsp;<input type="submit" value="Submit" /></td></tr>
            </thead>
            </tbody>
        </table>
        </form>           
    </body>
</html>
