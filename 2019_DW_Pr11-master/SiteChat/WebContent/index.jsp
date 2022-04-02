<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rooms</title>
<meta charset="utf-8">

</head>
<%if(session.getAttribute("username") == null){
		response.sendRedirect("login.jsp");	
	}	%>
<body>
	<div id="cnt" class="row" >  
		<div class="col-md-3">
			<a href="/JeeProjet/addRoom.jsp"> Create room </a></div>
		<div class="col-md-6">
			<sql:setDataSource
        		var="rooms"
        		driver="com.mysql.cj.jdbc.Driver"
        		url="jdbc:mysql://localhost:3306/ProjetJee"
        		user="dbadmin" password="turtle"
    		/>
     
   			<sql:query var="listRooms"   dataSource="${rooms}">
        		SELECT * FROM rooms;
    		</sql:query>
     
    		<div align="center">
        		<table border="1" >
            	<tr>
                	<th>Name</th>
                	<th>description</th>
                	<th>type</th>
                	<th>rejoindre</th>
            	</tr>
            	<c:forEach var="room" items="${listRooms.rows}">	
                <tr>
                    <form action="DisplayRooms">
                    <td><c:out value="${room.name}" />
                    	<input type="hidden" name="rName" value="${room.name}"/>
                    	<input type="hidden" name="rType" value="${room.type}"/>
                    </td>
                    <td><c:out value="${room.description}" /></td>
                    <td><c:out value="${room.type}" /></td>
                    <td><input type="submit" value="rejoindre"/></td>
                    </form>
               	</tr>
            	</c:forEach>
        		</table>
    		</div>
		</div>
		<div class="col-md-3"> 
			<h3>my rooms</h3>
			<sql:query var="myRooms"   dataSource="${rooms}">
        		SELECT * FROM rooms where creator = ${userId };
    		</sql:query><input type="submit" value="modifier"/>
     
    		<div align="center">
        		<table border="1" >
            	<tr>
                	<th>Name</th>
                	<th>description</th>
                	<th>type</th>
                	<th>rejoindre</th>
            	</tr>
            	<c:forEach var="room" items="${myRooms.rows}">	
                <tr>
                    <form action="SendUpdateRoom">
                    <td><c:out value="${room.name}" />
                    	<input type="hidden" name="rId" value="${room.roomId}"/>
                    </td>
                    <td><c:out value="${room.description}" /></td>
                    <td><c:out value="${room.type}" /></td>
                    <td><input type="submit" value="modify
                    "/></td>
                    </form>
               	</tr>
            	</c:forEach>
        		</table>
    		</div>
		</div>
	</div>
    
</body>
<script type="text/javascript" src="js/displayRooms.js"></script>
<script>setInterval(refrech, 10000)</script>
</html>