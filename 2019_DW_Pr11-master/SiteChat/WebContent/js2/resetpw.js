var email = document.getElementById("email");

function Reset() {
	var flag = true;
	if (email.value == "") {
		email.style.borderBottom = "1.5px solid red";
		flag = false;
	}
	if (flag) {
		var xmlhttp = new XMLHttpRequest();
	    xmlhttp.open("POST", "Resetpassword?email="+email.value, true);
	    xmlhttp.onreadystatechange = function()
	    {
	    	 if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        		 if (xmlhttp.responseText == "notexist") {
        			 email.style.borderBottom = "1.5px solid red";
        			 alert("This email doesn't exist.");
        		 }
        		 else if (xmlhttp.responseText == "done") {
        			 alert("Please check your inbox to reset your password.");
        			 window.location.replace("Login");
        		 }
	    	 }
	    }
	    xmlhttp.send(null);
	}
}