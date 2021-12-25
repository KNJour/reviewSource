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
<title>Account Settings</title>
<!-- FONT AWESOME -->
<script src="https://kit.fontawesome.com/be4fee3815.js" crossorigin="anonymous"></script>
  <!-- Bootstrap -->
 <link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous"> 
        <link rel="stylesheet" href="/css/style.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;900&family=Sen:wght@400;700;800&display=swap" rel="stylesheet">
           <script>
    window.onload = function()
    {
    	var biography = '${user.bio}';
      document.getElementById("bio").value = biography; 
    };
</script> 
</head>
<body class="new-review-body">
<nav class="navbar navbar-expand-md navStyle ">
        <a class="navbar-brand" href="/home">review<span class="source">Source</span></a>
        <button class="navbar-toggler navbar-dark" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
			<li>
              <a class="nav-link" href="/home">Home</a>
            </li>
                <li class="nav-item">
              <a class="nav-link" href="/yourReviews">Your reviews</a>
            </li>
                <li class="nav-item ">
              <a class="nav-link" href="#">Trending Reviews</a>
            </li>
              <li class="nav-item active ">
              <a class="nav-link" href="/newReview">New Review</a>
			</li>
	          </ul>
	         <ul class="nav navbar-nav navbar-right">
	         	<li><i class="fas fa-user-cog fa-2x lighten" ></i></li>
	            <li class="nav-item ">
                      <a class="nav-link mr-5 isActive" href="/accountSettings">Account Settings</a>
                </li>
                <li><a><i class="fas fa-sign-out-alt fa-2x lighten ml-3"></i> </a><a href="/logout">Log Out</a></li>
            </ul>
	         

        </div>
        
      </nav>
               <c:choose>
              <c:when test="${user.userName == 'Guest'}">
			            <div class="container-fluid oops p-4">
			            <div class="row flex-column">
			            			    <h2>I'm sorry, but you are not able to edit the information on the Guest account. If you would like to see this page, please create an account and sign in.</h2>
									<br>
						            <h4>Thank you,</h4>
						            <h4 class="ml-2">Keith Journell</h4>
			            </div>
			            <div class="row">
			            			<a href="/home"><button class="btn btn-light btn-outline-dark mt-3">Return Home</button></a>
			            </div>
			            </div>
			            
            </c:when>
            	<c:otherwise>
            	<div class="container main-contain"> <!-- Beginning of Container -->
        <h3 class="makeGold">Welcome <c:out  value="${user.userName}"/></h3>
        <h3 class="makeGold">Adjust Your account Settings</h3>
        <div class="container-fluid">
        <form:form method="POST" action="/accountSettings/update" modelAttribute="user" class="mt-3">
		        	<div class="card m-3 form-bio-sizer">
		        	 	<div class="card-header">
		        	 	<form:label path="userName"> UserName:   <span class="required">*</span> </form:label>
					<form:errors path="userName" class="text-danger"/>
					<form:input path="userName" type="text" class="form-control fit-me-bio" required="required" value="${user.userName }"/>
					<br>
					<form:label path="email"> email:   <span class="required">*</span> </form:label>
					<form:errors path="email" class="text-danger"/>
					<form:input path="email" type="text" class="form-control fit-me-bio" required="required" value="${user.email }"/>

		        	 	</div>
		        	 	<div class="cardbody text-dark p-2 offWhite">
				    <form:label path="bio"> A Brief Description of Yourself:   <span class="required">*</span> </form:label>
					<form:errors path="bio" class="text-danger"/>
					<form:textarea path="bio" rows="17" id="bio" class="form-control"/>
					<form:hidden path="id"  value="${user.id}" />
					 <input type="submit" class="btn btn-dark btn-outline-light m-2 p-2 goldMe roundMe" value="Update User Information"/>
				        	 	
		        	</div>
        	</div><!--  Row 1 end -->
        	</form:form>
        	<a href="delete/confirm" onclick="return confirm('Are you sure you want to delete your account? You will need to make a new one or use the guest account.')" >Delete User</a>
        </div>
    </div> <!-- End of Container -->
            	</c:otherwise>	
            </c:choose>
    
</html>