<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<h3> Login  </h3>
	<form action="Login" method="post">
		<p>	
			<label for="username"> UserName </label>
			<input type="text" name="username"/>	
		</p>
		<p>
			<label for="password"> Password </label>
			<input type="text" name="password"/>
		</p>
		<input type="submit" value="login"/>
	</form>

</body>
</html>