var pass = document.getElementById('pass');
var confirmpass = document.getElementById('confirmpass');
var token = document.getElementById('token').value;

function verifyInputs() {
	var flag = true;
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
	    xmlhttp.open("POST", "Reset?token="+token+"&pass="+pass.value, true);
	    xmlhttp.onreadystatechange = function()
	    {
	        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
	        		 if (xmlhttp.responseText == "done") {
	        			 alert("Your password is changed succesfully.");
	        			 window.location.replace("Login");
	        		 }
	        		 if (xmlhttp.responseText == "oups") {
	        			 alert("Oups, something went wrong.\nTry again later.");
	        			 window.location.replace("Login");
	        		 }
	        }
	    }
	    xmlhttp.send(null);
	}
}
