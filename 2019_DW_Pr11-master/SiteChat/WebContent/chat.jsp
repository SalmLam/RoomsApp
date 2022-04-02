<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<%String userId = (String) session.getAttribute("userId");
String roomId = (String) request.getAttribute("roomId");
String roomName = (String) request.getAttribute("roomName");
String userName = (String) request.getAttribute("userName");%>
<head>
<meta charset="ISO-8859-1">
<title>Chat's Room</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="stylesheet" href="css1/style.css">
        <link rel="stylesheet" type="text/css" href="css2/chat.css">
        

</head>
<body>
<div class="flex-container">
<div class="container">
<div class="nav-back">
				<div class="btn-user" onclick="showUser()">
					<span></span>
					<span></span>
					<span></span>
				</div>
				
				<span class="login-title">
						<b><%=roomName%></b>
				</span>
				<a href="Logout" class="button1" style="margin: 10px 10px;"><span class="glyphicon glyphicon-log-in"></span>  Logout</a>
				<a href="Home" class="button4" style="margin: 10px 10px;"><span class="glyphicon glyphicon-home"></span>  Home</a>
				<!-- <input class="btn-exit" type="button" value="X" onclick="window.location.href='Home'"/> -->
			</div>
		<div class="user-container">
			<img class="user-picture" src="popup-box/1.png">
							<div class="userline"">
			
			<span class="user-title"><b><%=userName%></b></span>
			<a href="Home" class="button3" data-toggle="modal" data-target="#exampleModalCenter" style="margin: 10px 10px 10px 70px;"><span class="glyphicon glyphicon-pencil"></span></a>
		</div></div>
		<div class="message-container">
			
			<div class="list" id="list">
	            <div id="content"></div>
	            <input style="display: none" type="text" id="u" value="<%=userId%>">
	           	<input style="display: none" type="text" id="r" value="<%=roomId%>">
	        </div>
	        <div class="input-chat">
	        <div class="flex">
				<input class="input" type="text" id="h" name="user" placeholder="Your message...">
				<form id="form" class="upload" action="Files" method="POST" accept-charset="utf-8" enctype="multipart/form-data">
					<input type="hidden" name="userId" value="<%=userId%>">
	       	    	<input type="hidden" name="roomId" value="<%=roomId%>">
					<input type="hidden" value="upload" name="action">
					<label for="upload">
     					 <span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
     					 <input type="file" id="upload" name="file" style="display:none">
					</label>
					<button style="display: none;" type="submit"></button>
				</form>
		        <input class="btn-chat" id="btn-chat" type="button" value="send" onclick="addText()"/>
		    </div>
		    </div>
		    
		</div>
		<div class="side-menu" id="side-menu">
			<input class="menu-exit" type="button" value="X" onclick="showUser()"/>
			<img class="user-picture" src="popup-box/1.png">
			<span class="user-title-menu"><b><%=userName%></b></span>
			<span class="users-title"><b>Users</b></span>
			<div class="menu-users" id="menu-users">
			</div>
		</div>
		<div class="users-container">
			<span class="users-title"><b>Users</b></span>
			<div class="list-users" id="list-users">
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript" src="js2/chat.js"></script>
<script>setInterval(reloadData, 2000)</script>
<script type="text/javascript">
document.getElementById("upload").onchange = function(e) { 
	document.getElementById("form").submit();
};
</script>
</html>