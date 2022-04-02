<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create a new room</title>
</head>
<body>
	
	<%if(session.getAttribute("username") == null){
		response.sendRedirect("login.jsp");	
	}	%>
	welcome ${username }
	welcome <% out.println(session.getAttribute("username")); %>
	<h6>------------------------------------------------</h6>
		<form action="Logout">
			<input type="submit" value="logout"/> 
		</form>
	<h6>------------------------------------------------</h6>
	<br><a href="/SiteChat/index.jsp"> Index </a>
	<h3> New room</h3>
	<form action="AddRoom" method="get">
		<label>name :</label>
		<input type="text" name="name"/> <br>
		
		<label> password :</label>
		<input type="text" name="password"/><br>
		
		<label> description :</label>
		<input type="text" name="description"/><br>
		
		<label> tags :</label>
		<input type="text" name="tags"/><br>
		
		<label> type :</label>
		<input type="text" name="type"/><br>
		
		<label> beginning date :</label>
		<input type="text" name="bDate"/><br>
		
		<label>end date :</label>
		<input type="text" name="eDate"/><br>
		
		<input type="submit" value="create new room"/>
	</form>

</body>
</html>