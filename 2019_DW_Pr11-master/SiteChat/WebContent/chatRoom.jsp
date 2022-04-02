<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chat room</title>
</head>
<body>
<%if(session.getAttribute("username") == null){
		response.sendRedirect("login.jsp");	
	}	%>
<h3>welcome to ${rName }</h3>
</body>
</html>