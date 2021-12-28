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
<title>Search Results</title>
  <!-- Bootstrap -->
	  <link rel="stylesheet"
	    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	    crossorigin="anonymous">
        <link rel="stylesheet" href="/css/style.css" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;900&family=Sen:wght@400;700;800&display=swap" rel="stylesheet">
		<script src="https://kit.fontawesome.com/be4fee3815.js" crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-expand-md altNavStyle py-2">
        <a class="navbar-brand" href="/home">review<span class="source">Source</span></a>
        <button class="navbar-toggler navbar-dark" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto align-items-center">
			<li>
              <a class="nav-link" href="/home">Home</a>
            </li>
                <li class="nav-item">
              <a class="nav-link" href="/yourReviews">Your reviews</a>
            </li>
                <li class="nav-item ">
              <a class="nav-link" href="#">Trending Reviews</a>
            </li>
              <li class="nav-item ">
              <a class="nav-link" href="/newReview">New Review</a>
			</li>
	          </ul>
	         <ul class="nav navbar-nav navbar-right align-items-center">
	         	<li><a href="/accountSettings"><i class="fas fa-user-cog fa-2x lighten  d-sm-none d-none d-md-block" ></i></a></li>
	            <li class="nav-item ">
                      <a class="nav-link" href="/accountSettings">Account Settings</a>
                </li>
                <li><a href="/logout"><i class="fas fa-sign-out-alt fa-2x lighten ml-3  d-sm-none d-none d-md-block"></i> </a></li>
            		 <li class="nav-item ">
                      <a class="nav-link" href="/logout">Log Out</a>
                </li>
            </ul>
        </div>
        </nav>
    <div class="container"> <!-- Beginning of Container -->
        <h1 class="random-review-title m-2">Search Results</h1>

        <div class="container-fluid">
        	<div class="row d-flex align-items-center justify-content-center">
<c:forEach items="${result}" var="result">
				        	 	<div class="card text-light result-item p-2 m-1">							        	 	
				        	 		<div class="row">
									   <div class="col d-flex align-items-center justify-content-center">
									        	 	<img src="${ result.image}" alt="image" class="result-image"/>
									   </div>
									        	 	<div class="col ">
									        	 			<h3 class="pt-4"><c:out value="${result.title }"/></h3>
									        	 	        	<a href="/newReview/${result.id}/" class="btn btn-dark m-2">Review It</a>
									        	 	</div>
									        	 	
							        	 	</div>
				        	 	</div>
        	</c:forEach>
        	</div><!--  Row 1 end -->
        </div>
    </div> <!-- End of Container -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    </body>
</html>