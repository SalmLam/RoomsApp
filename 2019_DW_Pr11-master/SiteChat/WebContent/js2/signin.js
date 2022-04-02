var user = document.getElementById('user');
var pass = document.getElementById('pass');
var confirmpass = document.getElementById('confirmpass');
var email = document.getElementById('email');
var tele = document.getElementById('tele');

function verifyInputs() {
	var flag = true;
	if (user.value == "") {
		user.style.borderBottom = "1.5px solid red";
		flag = false;
	}
	else {
		user.style.borderBottom = "none";
	}
	if (pass.value == "") {
		pass.style.borderBottom = "1.5px solid red";
		flag = false;
	}
	else {
		pass.style.borderBottom = "none";
	}
	if (confirmpass.value == "") {
		confirmpass.style.borderBottom = "1.5px solid red";
		flag = false;
	}
	else {
		confirmpass.style.borderBottom = "none";
	}
	if (email.value == "") {
		email.style.borderBottom = "1.5px solid red";
		flag = false;
	}
	else {
		email.style.borderBottom = "none";
	}
	if (tele.value == "") {
		tele.style.borderBottom = "1.5px solid red";
		flag = false;
	}
	else {
		tele.style.borderBottom = "none";
	}
	if (pass.value != "" && confirmpass.value != "") {
		if (pass.value != confirmpass.value) {
			pass.style.borderBottom = "1.5px solid red";
			confirmpass.style.borderBottom = "1.5px solid red";
			flag = false;
		}
		else {
			pass.style.borderBottom = "none";
			confirmpass.style.borderBottom = "none";
		}
	}
	if (flag) {
		var xmlhttp = new XMLHttpRequest();
	    xmlhttp.open("POST", "Signin?user="+user.value+"&pass="+pass.value+"&email="+email.value+"&tele="+tele.value, true);
	    xmlhttp.onreadystatechange = function()
	    {
	        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
	        		 if (xmlhttp.responseText == "exist user") {
	        			 user.style.borderBottom = "1.5px solid red";
	        			 alert("Username already exist.\nTry another one.");
	        		 }
	        		 if (xmlhttp.responseText == "exist email") {
	        			 email.style.borderBottom = "1.5px solid red";
	        			 alert("Email already exist.\nTry another one.");
	        		 }
	        		 if (xmlhttp.responseText == "exist userexist email") {
	        			 email.style.borderBottom = "1.5px solid red";
	        			 user.style.borderBottom = "1.5px solid red";
	        			 alert("Email and username already exist.\nTry other ones.");
	        		 }
	        		 else if (xmlhttp.responseText == "done") {
	        			 alert("Please check your inbox to verify your email.");
	        			 window.location.replace("Login");
	        		 }
	        }
	    }
	    xmlhttp.send(null);
	}
}
