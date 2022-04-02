<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update room </title>
</head>
<body>
<h3>you're updating ${roomId}</h3>
	<form action="UpdateRoom" method="get">
		<label>name :</label>
		<input type="text" name="name" value="${roomName}"/> <br>
		
		<label> password :</label>
		<input type="text" name="password" value="${roomPassword}"/><br>
		
		<label> description :</label>
		<input type="text" name="description" value="${roomDescription}"/><br>
		
		<label> tags :</label>
		<input type="text" name="tags" value="${roomTags}"/><br>
		
		<label> type :</label>
		<input type="text" name="type" value="${roomType}"/><br>
		
		<label> beginning date :</label>
		<input type="text" name="bDate" value="${roomBdate}"/><br>
		
		<label>end date :</label>
		<input type="text" name="eDate" value="${roomEdate}"/><br>
		
		<input type="submit" value="create new room"/>
	</form>
</body>
</html>