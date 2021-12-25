<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <!-- c:out ; c:forEach ; c:if -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   <!-- Formatting (like dates) -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   <!-- form:form -->
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
   <!-- for rendering errors on PUT routes -->
 <%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title Here</title>
  <!-- Bootstrap -->
  <link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
        <link rel="stylesheet" href="/css/style.css" />
</head>
<body>
<nav class="navbar navbar-expand-md navStyle">
        <h1><a class="navbar-brand" href="/">review<span class="makeGold">Source</span></a></h1>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
          </ul>
        </div>
        
        
      </nav>
 
    <div class="container-fluid main-contain"style="background-image: url('images/movies.png');"> <!-- Beginning of Container -->
	    <div class="row justify-content-center">
	    	            <form:form action="/login" method="post" modelAttribute="newLogin">
				               <form:hidden path="email"  value="Roughtakes@gmail.com" />
				                <form:hidden path="password"  value="guestpassword" />
				             	<input type="submit" value="Click Here To Login As Guest" class="guest-login-button"/>
		              </form:form>
		      </div>
	        <div class="row">
<!--         Registration Start -->
		       <div class="col seeThrough">
	<form:form action="/register" method="post" modelAttribute="newUser" class="bg-dark text-light mt-5 m-2 p-3 seeThrough roundMe">
        <div class="form-group" id="test">
            <label>User Name:</label>
            <form:input path="userName" class="form-control" id="test" />
            <form:errors path="userName" class="text-danger" />
        </div>
        <div class="form-group">
            <label>Email:</label>
            <form:input path="email" class="form-control" />
            <form:errors path="email" class="text-danger" />
        </div>
        <div class="form-group">
            <label>Password:</label>
            <form:password path="password" class="form-control" />
            <form:errors path="password" class="text-danger" />
        </div>
        <div class="form-group">
            <label>Confirm Password:</label>
            <form:password path="confirm" class="form-control" />
            <form:errors path="confirm" class="text-danger" />
        </div>
        <input type="submit" value="Register" class="btn btn-primary" />
    </form:form>
    
		       </div>
		<!--        Login Start -->
		       <div class="col">
		      <form:form action="/login" method="post" modelAttribute="newLogin" class="bg-dark text-light mt-5 m-2 p-3 seeThrough roundMe">
        <div class="form-group">
            <label>Email:</label>
            <form:input path="email" class="form-control" />
            <form:errors path="email" class="text-danger" />
        </div>
        <div class="form-group">
            <label>Password:</label>
            <form:password path="password" class="form-control" />
            <form:errors path="password" class="text-danger" />
        </div>
        <input type="submit" value="Login" class="btn btn-success" />
    </form:form>
		       </div>
       </div>
    </div> <!-- End of Container -->
    	<div class="footer">
	<nav class="navbar navbar-expand-lg navbar-light bg-light position-sticky">
  		<a class="navbar-brand" href="#">A Project by Keith Journell</a>

      <a href="https://github.com/knjour" target="_blank"><button class="btn btn-outline-success my-2 my-sm-0" type="submit">GitHub</button></a>
        <a href="#" target="_blank"><button class="btn btn-outline-primary my-2 my-sm-0 ml-3" type="submit">Portfolio</button></a>
      
</nav>
	</div>
</body>
</html>