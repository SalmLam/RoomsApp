<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%String token = (String) request.getParameter("token");%>
<head>
<meta charset="ISO-8859-1">
<title>Sign in</title>
<link rel="stylesheet" type="text/css" href="css2/login.css">
</head>
<body>
<input style="display: none" type="text" id="token" value="<%=token%>">
<div class="limiter">
	<div class="container">
		<div class="wrap">
				<span class="login-title">
						Reset your password
				</span>
				<div class="wrap-input">
						<input id="pass" class="input100" type="password" name="pass" placeholder="Password">
						<span class="focus-input100"></span>
				</div>
				<div class="wrap-input">
						<input id="confirmpass" class="input100" type="password" name="confirmpass" placeholder="Confirm password">
						<span class="focus-input100"></span>
				</div>
				<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="submit" class="login100-form-btn" onclick="verifyInputs()">
								Reset password
							</button>
						</div>
				</div>
   	 	</div>
    </div>
</div>
</body>
<script type="text/javascript" src="js2/reset.js"></script>
</html>