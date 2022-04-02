function addText()
{
    var userId = document.getElementById('u').value;
    var roomId = document.getElementById('r').value;
    var msg = document.getElementById('h').value;
    if (msg != "") {
	    olist = document.getElementById('list');
	    op = document.createElement('p');
	    op.innerHTML = "<div class='bubble you'>"+msg+"</div>";
	    ocontent = document.getElementById('content');
	    ocontent.appendChild(op);             
	    olist.scrollTop = olist.scrollHeight; 
	    document.getElementById('h').value = '';
	    var xmlhttp = new XMLHttpRequest();
	    
	    xmlhttp.open("POST", "Save?roomId="+roomId+"&userId="+userId+"&msg="+msg+"&type=text", true);
	
	    xmlhttp.onreadystatechange = function()
	    {
	        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
	        {}
	    }
	    xmlhttp.send(null);
    }
}
var lastMessage = '';
var lastUsers = '';
function reloadData()
{
	var userId = document.getElementById('u').value;
	var roomId = document.getElementById('r').value;
    var xmlhttp = new XMLHttpRequest();
    var xmlhttp2 = new XMLHttpRequest();
    
    xmlhttp.open("POST", "ReloadChat?userId="+userId+"&roomId="+roomId, true);
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        	if (lastMessage != xmlhttp.responseText) {
        		document.getElementById("content").innerHTML = xmlhttp.responseText;
        		lastMessage = xmlhttp.responseText;
                olist = document.getElementById('list'); 
                olist.scrollTop = olist.scrollHeight;
        	};
        }
    }
    xmlhttp.send(null);
    xmlhttp2.open("POST", "ReloadUsers?userId="+userId+"&roomId="+roomId, true);
    xmlhttp2.onreadystatechange = function() {
        if (xmlhttp2.readyState == 4 && xmlhttp2.status == 200) {
        	if (lastUsers != xmlhttp2.responseText) {
        		document.getElementById("list-users").innerHTML = xmlhttp2.responseText;
        		document.getElementById("menu-users").innerHTML = xmlhttp2.responseText;
        		lastUsers = xmlhttp2.responseText;
        	};
        }
    }
    xmlhttp2.send(null);
}

var input = document.getElementById('h');
input.addEventListener("keydown", function(e) {
if (e.keyCode == 13) {
	e.preventDefault();
    document.getElementById("btn-chat").click();
}
});

function showUser() {
	document.getElementById('side-menu').classList.toggle('active');
}