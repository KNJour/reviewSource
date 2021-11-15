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
        <link rel="stylesheet" href="/css/custom.css" />
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <h1><a class="navbar-brand" href="/">Everyone's a Critic</a></h1>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Click Here To Login As Guest<span class="sr-only">(current)</span></a>
            </li>
          </ul>
        </div>
        
          <form class="form-inline my-2 my-lg-1" action="/login" method="post">
            <label for="username"></label>
                <input class="form-control mr-sm-2" type="text" name="email" placeholder="Email">
            <label for="password"></label>
                <input class="form-control mr-sm-2" type="text" name="pass" placeholder="Password">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Login</button>
          </form>
      </nav>
    <div class="container"> <!-- Beginning of Container -->
        <div class="row">
<!--         Registration Start -->
		       <div class="col">
	<form:form action="/register" method="post" modelAttribute="newUser" class="bg-light mt-5 m-2 p-3">
        <div class="form-group">
            <label>User Name:</label>
            <form:input path="userName" class="form-control" />
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
		           <form:form action="/login" method="post" modelAttribute="newLogin" class="bg-light mt-5 m-2 p-3">
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
</body>
</html>