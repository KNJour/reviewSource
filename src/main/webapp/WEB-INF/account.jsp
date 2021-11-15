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
           <script>
    window.onload = function()
    {
    	var biography = '${user.bio}';
      document.getElementById("bio").value = biography; 
    };
</script> 
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <h1 class="star"><a class="navbar-brand" href="/home">Everyone's a Critic</a></h1>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home<span class="sr-only">(current)</span></a>
            </li>
                <li class="nav-item active">
              <a class="nav-link" href="/yourReviews">Your reviews</a>
            </li>
                <li class="nav-item active">
              <a class="nav-link" href="#">Trending Reviews</a>
            </li>
              <li class="nav-item active">
              <a class="nav-link" href="/newReview">New Review</a>
			</li>
			  <c:choose>
              <c:when test="${user.userName == 'KJournell'}">
			              <li class="nav-item active">
			              <a class="nav-link" href="/newGenre">Add Genre</a>
			            </li>
			              <li class="nav-item active">
			              <a class="nav-link" href="/newMedia">Add Media</a>
			            </li>
            </c:when>
            	<c:otherwise>
            	</c:otherwise>	
            </c:choose>
              <li class="nav-item active">
              <a class="nav-link" href="/">Favorites</a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="/">Account Settings</a>
            </li>
	                </ul>

        </div>
        
      </nav>
    <div class="container"> <!-- Beginning of Container -->
        <h1> You've made it to the Home!! What a hero!</h1>
        <h3>Welcome <c:out  value="${user.userName}"/></h3>
        <h3>your email is <c:out  value="${user.email}"/></h3>
        <h3>your id is <c:out  value="${user.id}"/></h3>
        <a href="/logout">Log Out</a>
        <div class="container-fluid">
        <form:form method="POST" action="/accountSettings/update" modelAttribute="user" class="mt-3">
		        	<div class="card m-3">
		        	 	<div class="card-header">
		        	 	<form:label path="userName"> UserName:   <span class="required">*</span> </form:label>
					<form:errors path="userName" class="text-danger"/>
					<form:input path="userName" type="text" class="form-control colorizer" required="required" value="${user.userName }"/>
					<br>
					<form:label path="email"> email:   <span class="required">*</span> </form:label>
					<form:errors path="email" class="text-danger"/>
					<form:input path="email" type="text" class="form-control colorizer" required="required" value="${user.email }"/>

		        	 	</div>
		        	 	<div class="cardbody text-dark">
		        	 					
				    <form:label path="bio"> Bio:   <span class="required">*</span> </form:label>
					<form:errors path="bio" class="text-danger"/>
					<form:textarea path="bio" rows="20" id="bio" class="form-control colorizer"/>
					
					 <input type="submit" class="btn btn-light" value="Update User Information"/>
				        	 	
		        	</div>
        	</div><!--  Row 1 end -->
        	</form:form>
        	<a href="delete/confirm">Delete User</a>
        </div>
    </div> <!-- End of Container -->
</html>