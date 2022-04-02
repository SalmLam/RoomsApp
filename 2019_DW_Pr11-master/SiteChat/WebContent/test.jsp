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
        <link rel="stylesheet" href="css/anima
        te.css"/>    
      
    <link rel="stylesheet" href="css/line-awesome.css"/>    
    <link rel="stylesheet" href="css/line-awesome-font-awesome.min.css"/>    
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css"/>    
    <link rel="stylesheet" href="lib/slick/slick.css"/>   
  
    <link rel="stylesheet" href="css/responsive.css"/>   
    <link rel="stylesheet" href="lib/slick/slick-theme.css"/>    
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    </head>
    
    
    <body data-spy="scroll" data-target=".navbar" data-offset="60">
    
    	<!----------------------------------------------------------------navigation bar -------------------------------------------------------------------------------->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="search-box">
                <input class="search-text" type="text" name="search" placeholder="Recherche...">
                <a class="search-btn" href="#">
                    <i class="fas fa-search"></i>
                </a>
            </div>
        
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
                        <li><a href="#skills"><span><img src="img/icon1.png" alt=""></span>  Accueil</a></li>
                        <li><a href="#experience"><span><img src="img/profile-icone.png" alt=""></span>  Profil</a></li>
                        <li><a href="#education"><span><img src="img/com.png" alt=""></span> Rooms</a></li>
                        <li><a href="#about"><span><img src="img/idea.png" alt=""></span>  About</a></li>
                        <li><a href="#recommandations"><span><img src="img/icon6.png" alt=""></span>  Recommandations</a></li>
                        
                        
                    </ul>
                </div>
            
            </div>
        
        </nav>
		<!----------------------------------------------------------------navigation bar -------------------------------------------------------------------------------->
        
        <!-----------------------------------------------------------------Loading Data Base--------------------------------------------------------------------------->
        <sql:setDataSource
                var="rooms"
                driver="com.mysql.cj.jdbc.Driver"
                url="jdbc:mysql://localhost:3306/ProjetJee"
                user="dbadmin" password="turtle"
            />
         <!-----------------------------------------------------------------Loading Data Base--------------------------------------------------------------------------->
        
        
        
        <!-----------------------------------------------------------------My Rooms--------------------------------------------------------------------------->
        
        <!-----------------------------------------------------------------Data--------------------------------------------------------------------------->
        <sql:query var="myRooms"   dataSource="${rooms}">
                SELECT * FROM rooms where creator = ${userId };
        </sql:query>
        <!-----------------------------------------------------------------Data--------------------------------------------------------------------------->
        <%-- 
            <div class="container">
                <div class="white-divider"></div>
                <div class="heading">
                    
                </div>
            
            
            <div class="col-sm-4">
                        <div class="thumbnail">
                            <h3>My Rooms</h3>
                         
                    <div class="row">
                        <div class="thumbnail">
                            <c:forEach var="room" items="${myRooms.rows}">
                            <form action="SendUpdateRoom">
                            <h4><c:out value="${room.name}" />
                                <input type="hidden" name="rId" value="${room.roomId}"/>
                            <button type="submit" class="btn btn-success "><span class="glyphicon glyphicon-pencil"></span></button></h4>

                            </form>

                            </c:forEach>
                            <div class="red-divider"></div>
                            <div class="view-more nouvelle-communaute">
                            <span><i class="glyphicon glyphicon-plus"></i></span>
                            <a href="/JeeProjet/addRoom.jsp"> add room </a></div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>



                </div>
            
        </section> --%>
       
         <!-- section qui contiennent les rooms et les boutons ajouter et editer une rooms -->
        
        
        <section id="portfolio">   
            <div class="container">
                
                 <div class="red-divider"></div>
                    <div class="heading">
                        <h2>My Rooms</h2><button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal"><span class="glyphicon glyphicon-plus"></span> ADD ROOM</button>
                    </div>
            
                <div class="container text-center" style="width:400px">
                    <div class="thumbnail" >
                            <h3>Rooms 1   <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#exampleModalCenter" style="margin:10px 10px;"><span class="glyphicon glyphicon-pencil"></span> </button></h3>
                            <h4>Description </h4>
                        <div class="d-flex justify-content-center">
                           
                        </div>
                    </div>
                </div>
                
            </div>
            

                <!-- Pop up editer -->
                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                  <div class="modal-dialog " role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Update Room</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                          <div class="form-group">

                        <label for="name">Nom:</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Nom" value="">
                        
                        <label for="name">Password:</label>
                            <input type="password" class="form-control" id="name" name="name" placeholder="Password" value="">
                        
                        <label for="name">Description:</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Description" value="">
                        
                        <label for="name">Tags:</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Tags" value="">
                        
                        <label for="name">Beginning Date:</label>
                            <input type="date" class="form-control" id="name" name="name" placeholder="Nom" value="">
                        <label for="name">End Date:</label>
                            <input type="date" class="form-control" id="name" name="name" placeholder="Nom" value="">
                      </div>
                      </div>

                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                      </div>
                    </div>
                  </div>
                </div>
            
            
            
            
            <!-- pop up AJOUTER room -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                  <div class="modal-dialog " role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle" style="padding-left: 120px;">ADD Room</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                          <div class="form-group">

                        <label for="name">Nom:</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Nom" value="">
                        
                        <label for="name">Password:</label>
                            <input type="password" class="form-control" id="name" name="name" placeholder="Password" value="">
                        
                        <label for="name">Description:</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Description" value="">
                        
                        <label for="name">Tags:</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Tags" value="">
                        
                        <label for="name">Beginning Date:</label>
                            <input type="date" class="form-control" id="name" name="name" placeholder="Nom" value="">
                        <label for="name">End Date:</label>
                            <input type="date" class="form-control" id="name" name="name" placeholder="Nom" value="">
                      </div>
                      </div>

                      <div class="modal-footer">
                        <button type="button" class="btn btn-success">ADD</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>

                      </div>
                    </div>
                  </div>
                </div>
        </section>
      
        
        <!--fin du section My rooms -->
        
        
        
     
            
                
        <!-- -------------------------------------------------------------------All Rooms--------------------------------------------------------------------- -->
        <section id="education">
        
        <!-- --------------------------------------------------------------------Data--------------------------------------------------------------------- -->
            <sql:query var="listRooms"   dataSource="${rooms}">
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
                            <p><c:out value="${room.tags}" /></p>
                            <button onclick="document.getElementById('modal-wrapper').style.display='block'" class="btn btn-success"> Rejoindre</button>
					
                        </div>
                        <body background="../background1.png">
                   		<form action="RoomLogin">
                        <div id="modal-wrapper" class="modal">
  
                            <div class="modal-content animate" action="/action_page.php">
        
                                <div class="imgcontainer">
                                    <span onclick="document.getElementById('modal-wrapper').style.display='none'" class="close" title="Close PopUp">&times;</span>
                                    <img src="1.png" alt="Avatar" class="avatar">
                                    <h1 style="text-align:center">Login to the Room</h1>
                                </div>
                                
                                <div class="education-block">
                                    <input   name="rName" value="${room.name}" type="hidden" >
                                    <input type="password" placeholder="Enter Password" name="password">        
                                    <button type="submit">Login</button>
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
        
        
     
        
        
        <footer class="text-center">
            <a href="#about">
                <span class="glyphicon glyphicon-chevron-up"></span>
            </a>
            <h5>© 2020 JEE_projet.COM</h5>
        </footer>
                
        
        
    </body>

</html>

<script type="text/javascript" src="jss/displayRooms.js"></script>
<script>setInterval(refrech, 10000)</script>
