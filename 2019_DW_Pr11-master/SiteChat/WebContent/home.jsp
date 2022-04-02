<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<!DOCTYPE html>
<html>
    <head>
        <title>ROOM</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
         <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
        

    <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="keywords" content="" />
        <link href="favicon.ico" type="image/x-icon" rel="icon"/>
        <link href="favicon.ico" type="image/x-icon" rel="shortcut icon"/>   
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css1/style.css">
        <script src="js1/script.js"></script>
        <script src="js/ckeditor.js"></script> 
        <link rel="stylesheet" href="css/animate.css"/>    
      
    <link rel="stylesheet" href="css/line-awesome.css"/>    
    <link rel="stylesheet" href="css/line-awesome-font-awesome.min.css"/>    
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css"/>    
    <link rel="stylesheet" href="lib/slick/slick.css"/>   
  
    <link rel="stylesheet" href="css/responsive.css"/>   
    <link rel="stylesheet" href="lib/slick/slick-theme.css"/>    
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    </head>
    
    
   
        <nav class="navbar navbar-default navbar-fixed-top">
        
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                         <span class="icon-bar"></span>
                         <span class="icon-bar"></span>
                         <span class="icon-bar"></span>
                    </button>
                </div>
                
                
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li><a href="#profil"><span><img src="img/profile-icone.png" alt=""></span>  Profil</a></li>
                        <li><a href="#rooms"><span><img src="img/com.png" alt=""></span> Rooms</a></li>
                        <li><a href="#portfolio"><span><img src="img/com.png" alt=""></span> My Rooms</a></li>
                        <a href='Logout' class="button1" type="button"  style="margin:10px 10px;" onclick="window.location.href='Logout'"><span class="glyphicon glyphicon-log-in"></span> Logout</a>
                        
                    </ul>
                </div>
            
            </div>
        
        </nav>
        
      <!-----------------------------------------------------------------Loading Data Base--------------------------------------------------------------------------->
        <sql:setDataSource
                var="chatDB"
                driver="com.mysql.cj.jdbc.Driver"
                url="jdbc:mysql://localhost:3306/chat?serverTimezone=GMT"
                user="root" password=""
            />
        <!-----------------------------------------------------------------My Rooms--------------------------------------------------------------------------->
        
        <!-----------------------------------------------------------------Data--------------------------------------------------------------------------->
        <sql:query var="myRooms"   dataSource="${chatDB}">
                SELECT * FROM rooms where creator = ${userId };
        </sql:query>
         <sql:query var="user"   dataSource="${chatDB}">
                SELECT * FROM users where userId = ${userId };
        </sql:query>
        <!-----------------------------------------------------------------Data--------------------------------------------------------------------------->
      	
       <c:forEach var="me" items="${user.rows}">
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle1" aria-hidden="true">
                  <div class="modal-dialog " role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle1">Update Profile</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <form action="UpdateUser" onSubmit="return verify1()">
                      <div class="modal-body">
                          <div class="form-group">

                        <label for="name">Username :</label>
                            <input type="text" class="form-control" id="u1" name="username" placeholder="Username" value="${me.username }">
                        
                        <label for="name">Password:</label>
                            <input type="password" class="form-control" id="password1" name="password" placeholder="Password" value="">
                        
                        <label for="name">Confirm Password:</label>
                            <input type="password" class="form-control" id="confirmrPassword1" name="" placeholder="Confirm password" value="">
                        
                        <label for="name">Email:</label>
                            <input type="text" class="form-control" id="e1" name="email" placeholder="email" value="${me.email}">
                        
                        <label for="name">Phone number :</label>
                            <input type="text" class="form-control" id="p1" name="telephone" placeholder="Phone Number" value="${ me.telephone}">
                        
                        <label for="name">Institution :</label>
                            <input type="text" class="form-control" id="i1" name="institution" placeholder="Institution" value="${me.institution}">
                      </div>
                      </div>
					  
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button submit" class="btn btn-primary">Save changes</button>
                      </div>
                      </form>
                    </div>
                  </div>
                </div>
        
         <section id="profil" class="container-fluid"> 
            <div class="col-xs-8 col-md-4 profile-picture">
                <img src="img/usr.jpg" alt="Me" class="img-circle">
            </div>
            <div class="heading">
            	
                <h1><c:out value="${me.username}" /></h1>
                <h3><span class="glyphicon glyphicon-envelope"></span>    <c:out value="${me.email}" /></h3>
                <h3> <span class="glyphicon glyphicon-earphone"></span>    <c:out value="${me.telephone}" /></h3>
                <h3><span class="glyphicon glyphicon-briefcase"></span>    <c:out value="${me.institution}" /></h3>
                
                <a href="" class="button2"  data-toggle="modal" data-target="#exampleModalCenter" style="margin:10px 10px;"><span class="glyphicon glyphicon-pencil"></span> Update Your Profil</a>
            
            </div>
        </section>
   	</c:forEach>
        
      
        
        
        
     <!-- -------------------------------------------------------------------All Rooms--------------------------------------------------------------------- -->
        <section id="rooms">
        <!-- <div class="search-box">
                <input class="search-text" type="text" name="search" placeholder="Recherche...">
                <a class="search-btn" href="#">
                    <i class="fas fa-search"></i>
                </a>
            </div> -->
        <!-- --------------------------------------------------------------------Data--------------------------------------------------------------------- -->
            <sql:query var="listRooms"   dataSource="${chatDB}">
                SELECT * FROM rooms;
            </sql:query>
       <!-- --------------------------------------------------------------------Data--------------------------------------------------------------------- -->
        
             
            <div class="container">
                
                 <div class="red-divider"></div>
                <div class="heading">
                    <h2>Rooms</h2>
                </div>
                <div class="row">

                 <c:forEach var="room" items="${listRooms.rows}">    

					
                    <div class="col-sm-6">
                        <div class="education-block">
                            <span class="glyphicon glyphicon-education"></span>
                            <h3><c:out value="${room.name}" /></h3>
                            <h4><c:out value="${room.description}" /></h4>
                            <div class="red-divider"></div>
                           	<h5> <a style="color:#d82c2e">from</a> <c:out value="${room.beginning_date}" /></h2>
                            <h5> <a style="color:#d82c2e">to</a> <c:out value="${room.end_date}" /></h2>	
                            <div class="red-divider"></div>
                            <p><c:out value="${room.tags}" /></p>
                            <button data-toggle="modal" data-target="#${room.roomId}${ room.roomId}" data  type="submit" class="btn btn-success"> Join</button>
                        </div>
                        <body background="../background1.png">
                   		<form action="RoomLogin">
						 <div class="modal fade" id="${ room.roomId}${ room.roomId}" tabindex="-1" role="dialog">
                          <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                              <div class="modal-header ">
                                <h5 class="modal-title" style="padding-left: 110px;"> Join  <c:out value="${room.name}" />  </h5>
                                
                              </div>
                              <div class="modal-body ">
                              <div class="text-center">
                                <img src="1.png" style="height:100px;width:100px">
                              </div>

                                  <form action="" method="">
                                    <div class="form-group">
                                  <input class="form-control" type="hidden" name="rName" value="${room.name}"  >
                                  <label for="password">Enter password :</label>
                                  <input class="form-control" type="password" name="password" placeholder="Enter password.." >
                                   </div>   
                                  </form>
                              </div>
                              <div class="modal-footer">
                                <button type="button submit" class="btn btn-success">Join</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                              </div>
                            </div>
                          </div>
                        </div>
                
						</form>
                        </body>
					</div>
                </c:forEach>

                </div>

            </div>
        
        </section>
        
        <section id="portfolio">
            <div class="container">
                 <div class="red-divider"></div>
                 <div class="heading">
                     <h2>My Rooms </h2>
                     <button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">
                     <span class="glyphicon glyphicon-plus"></span> ADD ROOM</button>
                 </div>
                 
         		
         	 <c:forEach var="myRoom" items="${myRooms.rows}">
            	 <div class="container text-center" style="width:400px">
                    <div class="thumbnail" >
                            <h3><c:out value="${myRoom.name}" />   
                            <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#${ myRoom.roomId}" style="margin:10px 10px;"><span class="glyphicon glyphicon-pencil"></span> </button></h3>
                            <input type="hidden" name="rId" value="${room.roomId}"/> 
                            <h4><c:out value="${myRoom.description}" /> </h4>
                    </div>
                 </div>
            </div> <!-- end of container -->
            

                <!-- Pop up editer -->
                <div class="modal fade" id="${ myRoom.roomId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                  <div class="modal-dialog " role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Update Room</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <form action="UpdateRoom" onSubmit="return verify2()">
                      <div class="modal-body">
                          <div class="form-group">
                        <label for="name">Name:</label>
                            <input type="text" class="form-control" id="n2" name="name" placeholder="Nom" value="${myRoom.name}">
                            
                            <input type="hidden" class="form-control" id="name" name="roomId" value="${myRoom.roomId}">
                        
                        <label for="name">Password:</label>
                            <input type="password" class="form-control" id="password2" name="password" placeholder="Password" value="${myRoom.password}">
                        
                        <label for="name">Confirm Password:</label>
                            <input type="password" class="form-control" id="confirmPassword2" name="password" placeholder="Confirm password" value="${myRoom.password}">
                        
                        <label for="name">Description:</label>
                            <input type="text" class="form-control" id="d2" name="description" placeholder="Description" value="${myRoom.description}">
                        
                        <label for="name">Tags:</label>
                            <input type="text" class="form-control" id="ta2" name="tags" placeholder="Tags" value="${myRoom.tags}">
                       
                        <label for="name">Begining Date:</label>
                            <input type="date" class="form-control" id="b2" name="bDate" placeholder="Nom" value="${myRoom.beginning_date}">
                        
                        <label for="name">End Date:</label>
                            <input type="date" class="form-control" id="e2" name="eDate" placeholder="Nom" value="${myRoom.end_date}">
                      </div>
                      </div>

                      <div class="modal-footer">
                        <button  type="button submit" class="btn btn-primary">Save changes</button>
                      </div>
                      </form>
                    </div>
                  </div>
                </div>
                  
           </c:forEach>
           
           <!-- pop up add room -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                  <div class="modal-dialog " role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle" style="padding-left: 120px;">ADD ROOOM</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      
                      <form action="AddRoom" onSubmit="return verify3()">
                      <div class="modal-body">
                          <div class="form-group">

                        <label for="name" pattern=".{1,}">Name:</label>
                            <input type="text" class="form-control" id="n3" name="name" placeholder="Nom" value="">
                        
                        <label for="name">Password:</label>
                            <input type="password" class="form-control" id="password3" name="password" placeholder="Password" value="">
                        
                         <label for="name">Confirm Password:</label>
                            <input type="password" class="form-control" id="confirmPassword3" name="password" placeholder="Password" value="">
                        
                        <label for="name">Description:</label>
                            <input type="text" class="form-control" id="d3" name="description" placeholder="Description" value="">
                        
                        <label for="name">Tags:</label>
                            <input type="text" class="form-control" id="ta3" name="tags" placeholder="Tags" value="">
                        
                        
                        <label for="name">Beginning Date:</label>
                            <input type="date" class="form-control" id="b3" name="bDate" placeholder="Nom" value="">
                        
                        <label for="name">End Date:</label>
                            <input type="date" class="form-control" id="e3" name="eDate" placeholder="Nom" value="">
                      </div>
                      </div>

                      <div class="modal-footer">
                        <button type="button submit" class="btn btn-success">ADD</button>
					  </div>
					  </form>
                    </div>
                  </div>
                </div>    
                
        </section>
     
        
        
        <footer class="text-center">
            <a href="#portfolio">
                <span class="glyphicon glyphicon-chevron-up"></span>
            </a>
            <h5>© 2020 JEE_projet.COM</h5>
        </footer>
                
        
        
    </body>
	<script>
		function verify1() {
			var p = document.getElementById('password1').value;
			var cp = document.getElementById('confirmPassword1').value;
			var u1 = document.getElementById('u1').value;
			var e1 = document.getElementById('e1').value;
			var p1 = document.getElementById('p1').value;
			var i1 = document.getElementById('i1').value;
			if (p=="" || cp=="" || u1=="" || e1=="" || p1=="" || i1=="") {
				alert("None of the entries should be empty.");
				return false;
			}
			if(cp != p) {
				alert("Different passwords");
				return false;
			}return true;
		};
		function verify2() {
			var p = document.getElementById('password2').value;
			var cp = document.getElementById('confirmPasswor2').value;
			var n2 = document.getElementById('n2').value;
			var d2 = document.getElementById('d2').value;
			var ta2 = document.getElementById('ta2').value;
			var b2 = document.getElementById('b2').value;
			var e2 = document.getElementById('e2').value;
			console.log(b2);
			if (p=="" || cp=="" || n2=="" || d2=="" || ta2==""  || b2=="" || e2=="") {
				alert("None of the entries should be empty.");
				return false;
			}
			if(cp != p) {
				alert("Different passwords");
				return false;
			}
			return true;
		};
		function verify3() {
			var p = document.getElementById('password3').value;
			var cp = document.getElementById('confirmPassword3').value;
			var n3 = document.getElementById('n3').value;
			var d3 = document.getElementById('d3').value;
			var ta3 = document.getElementById('ta3').value;
			var b3 = document.getElementById('b3').value;
			var e3 = document.getElementById('e3').value;
			if (p=="" || cp=="" || n3=="" || d3=="" || ta3==""  || b3=="" || e3=="") {
				alert("None of the entries should be empty.");
				return false;
			}
			if(cp != p) {
				alert("Different passwords");
				return false;
			}return true;
		}
	</script>
</html><!-- 
<script>
// If user clicks anywhere outside of the modal, Modal will close
    var modal = document.getElementById('modal-wrapper');
    window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
        }
    }
</script> -->	
