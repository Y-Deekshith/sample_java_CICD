<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LandmarkTechnologies- Home Page</title>
<link href="images/Ourdevopslogo.png" rel="icon">
</head>
</head>
<body>
<h1 align="center">Welcome deekshith your Web application Project.</h1>
<h1 align="center">Develop a passion for learning. If you do, you will never cease to grow.</h1>
<hr>
<br>
	<h1><h3> Server Side IP Address </h3><br>

<% 
String ip = "";
InetAddress inetAddress = InetAddress.getLocalHost();
ip = inetAddress.getHostAddress();
out.println("Server Host Name :: "+inetAddress.getHostName()); 
%>
<br>
<%out.println("Server IP Address :: "+ip);%>
		
</h1>
	
<hr>
<div style="text-align: center;">
	<span>
		<img src="images/Ourdevopslogo.png" alt="" width="250">
	</span>
	<span style="font-weight: bold;">
        Deekshith Yamjala, 
		Hyderabad, India
		+91 9876543210,
		deekshith@gmail.com
		<br>
		<a href="mailto:deekshith@gmail.com">Mail to Deekshith Yamjala</a>
	</span>
</div>
<hr>
	<p> Service : <a href="services/employee/getEmployeeDetails">Get Employee Details </p>
<hr>
<hr>
<p align=center> Deekshith Yamjala - DevOps Engineer, Software Development</p>
<p align=center><small>Copyrights 2021 by <a href="www.linkedin.com/in/deekshith-yamjala-98a256176">Deekshith Yamjala</a> </small></p>

</body>
</html>
