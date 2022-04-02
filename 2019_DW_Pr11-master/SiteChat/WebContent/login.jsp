<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log in</title>
<link rel="stylesheet" type="text/css" href="css2/login.css">
</head>
<body>
<div class="limiter">
	<div class="container">
		<div class="wrap">
			<form class="form" action="Login" method="post">
				<span class="login-title">
						Log in
				</span>
				<div class="wrap-input">
						<input class="input100" type="text" name="user" placeholder="Username">
						<span class="focus-input100"></span>
				</div>
				<div class="wrap-input">
						<input class="input100" type="password" name="pass" placeholder="Password">
						<span class="focus-input100"></span>
				</div>
				<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="submit" class="login100-form-btn">
								Log in
							</button>
						</div>
				</div>
				<div class="text-center">
						<span class="txt1">
							Don't have an account?
						</span>
						<a class="txt2" href="Signin">
							Sign in
						</a><br>
						<span class="txt1">
							Forgotten password?
						</span>
						<a class="txt2" href="Resetpassword">
							Reset it
						</a>
				</div>
   			</form>
   	 	</div>
    </div>
</div>
</body>
</html>