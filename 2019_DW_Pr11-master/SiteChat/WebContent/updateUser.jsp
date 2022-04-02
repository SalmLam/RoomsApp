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
    
    
    <body data-spy="scroll" data-target=".navbar" data-offset="60">
        <div class="modal fade" id="editer" tabindex="-1" role="dialog">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <p>Modal body text goes here.</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary">Save changes</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
        <nav class="navbar navbar-default navbar-fixed-top">
         <!-----------------------------------------------------------------Loading Data Base--------------------------------------------------------------------------->
        <sql:setDataSource
                var="users"
                driver="com.mysql.cj.jdbc.Driver"
                url="jdbc:mysql://localhost:3306/chat"
                user="root" password=""
            />
         <!-----------------------------------------------------------------Loading Data Base--------------------------------------------------------------------------->
           
        <!-----------------------------------------------------------------Data--------------------------------------------------------------------------->
        <sql:query var="users"   dataSource="${users}">
                SELECT * FROM users where userId = ${userId};
        </sql:query>
        <!-----------------------------------------------------------------Data--------------------------------------------------------------------------->
      
        
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
                        <li><a href="#portfolio"><span><img src="img/com.png" alt=""></span> My Rooms</a></li>
                        
                        
                    </ul>
                </div>
            
            </div>
        
        </nav>  
        <section id="portfolio">
              <!-- Pop up editer -->
                
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Update Room</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <c:forEach var="user" items="${users.rows}">
                      <form action="UpdateRoom">
                      <div class="modal-body">
                          <div class="form-group">
                        <label for="name">Username:</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Nom" value="${user.username}">
                            
                        <label for="name">Password:</label>
                            <input type="password" class="form-control" id="name" name="password" placeholder="Password" value="${user.password}">
                       	<label for="name">Confirm Password:</label>
                            <input type="password" class="form-control" id="cpassword" name="cpassword" placeholder="Password" value="${user.password}">
                        
                        <label for="name">Email:</label>
                            <input type="text" class="form-control" id="email" name="email" placeholder="Description" value="${myRoom.description}">
                        
                        <label for="name">Telephone:</label>
                            <input type="text" class="form-control" id="" name="telephone" placeholder="Tags" value="${user.telephone}">
                        
                        <label for="name">Status</label>
                            <input type="text" class="form-control" id="status" name="status" placeholder="Tags" value="${user.status}">
                        
                        <label for="name">Institution</label>
                            <input type="date" class="form-control" id="institution" name="institution" placeholder="Nom" value="${user.institution}">
                        
                        </div>
                      </div>

                      <div class="modal-footer">
                        <button type="button submit" class="btn btn-primary">Save changes</button>
                      </div>
                      </form>
                      </c:forEach>
                    </div>
          
        </section>
      
        
        <!--fin du section My rooms -->
        
        <footer class="text-center">
            <a href="#portfolio">
                <span class="glyphicon glyphicon-chevron-up"></span>
            </a>
            <h5>© 2020 JEE_projet.COM</h5>
        </footer>
                
        
        
    </body>

</html>
