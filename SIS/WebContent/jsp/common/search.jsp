<%@ page import="java.util.*" %>
<%@ page import="com.sis.vo.Country" %>
<%
	String contextPath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ request.getContextPath();
	ArrayList<Country> countryList=(ArrayList)request.getAttribute("countryList");
%>
<script language="javascript" type="text/javascript">  
      var xmlHttp;
      function showState(countryId){
      if (typeof XMLHttpRequest != "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request")
      return;
      } 
     
      
      var url="<%=request.getContextPath()%>/CommonAction?type=state&countryId="+countryId;
      xmlHttp.onreadystatechange = countryChange;
      xmlHttp.open("POST", url, true);
      xmlHttp.send(null);
      }

      function countryChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      document.getElementById("state").innerHTML=xmlHttp.responseText   
      }   
      }
	/************************ AJAX Call for District ***************/
      
      function showDistrict(stateId){
          if (typeof XMLHttpRequest != "undefined"){
          xmlHttp= new XMLHttpRequest();
          }
          else if (window.ActiveXObject){
          xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
          }
          if (xmlHttp==null){
          alert("Browser does not support XMLHTTP Request")
          return;
          } 
         
          
          var url="<%=request.getContextPath()%>/CommonAction?type=district&stateId="+stateId;
          xmlHttp.onreadystatechange = stateChange;
          xmlHttp.open("POST", url, true);
          xmlHttp.send(null);
          }

          function stateChange(){   
          if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
          document.getElementById("district").innerHTML=xmlHttp.responseText ;  
          }   
          }
     
      </script>  
<html>
<head>
<title>Login Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="<%=contextPath %>/css/yregbase_sec_ui_1_9.css" type="text/css">
<%@ include file="/jsp/common/header.jsp" %>
</head><hr>
<body>
Country:<select name="country" onchange="showState(this.value)">
<option value="-1">--SELECT--</option>
<% 
for(Country country:countryList)
{%>
<option value="<%=country.getId()%>"><%=country.getCointryName()%></option>
<%} %>
</select><br>
 State: <select id="state" name="stateId" onchange="showDistrict(this.value)">
          <option value="-1">--SELECT--</option>
         
</select>
<br>
 District: <select id="district" name="districtId" >
          <option value="-1">--SELECT--</option>
         
</select>
</body>
</html>