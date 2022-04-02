<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Room Login</title>
</head>
<body>
<%if(session.getAttribute("username") == null){
		response.sendRedirect("login.jsp");	
	}	%>
<form action="RoomLogin" method="get"> 
	
	<p>
		<label>Room Name : </label>
		<input type="text" value=${rName } />
	</p>
	
	<p>
		<label>password : </label>
		<input type="text" name="password"/>
	</p>
	
	<input type="submit" value="join"/>	
</form>
</body>
</html>