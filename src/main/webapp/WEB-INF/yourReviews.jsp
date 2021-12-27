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
<title>Your Reviews</title>
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
              <li class="nav-item ">
              <a class="nav-link" href="/newReview">New Review</a>
			</li>
	          </ul>
	         <ul class="nav navbar-nav navbar-right">
	         	<li><a href="/accountSettings"><i class="fas fa-user-cog fa-2x lighten" ></i></a></li>
	            <li class="nav-item ">
                      <a class="nav-link mr-5" href="/accountSettings">Account Settings</a>
                </li>
                <li><a href="/logout"><i class="fas fa-sign-out-alt fa-2x lighten ml-3"></i> </a><a href="/logout" class="makeGold">Log Out</a></li>
            </ul>
        </div>
        </nav>

	<div class="container-fluid main-contain d-flex  align-items-center justify-content-center">
	<div class="row">
<!-- 		READING COLUMN -->
		<div class="col">
			<c:forEach items="${user.reviews}" var="review">
			<div class="card bg-dark text-light m-4 p-2 form-bio-sizer">
				<div class="card-header">
					<h2><c:out value="${review.what}" /> Review</h2>
				</div>
				<div class="card-body">
					<h3><c:out value="${review.title}"/></h3>
					 
					 <div class="offWhite">
					 <p><c:out value="${review.content }"/></p>
					 </div>
				<div class="reviewbottom d-flex align-items-center justify-content-between p-1">
							 	<div class="bottomLeft">
							 	<h3><c:out value="${review.rating}"/> Stars</h3>
							 	</div>
							 	<div class="bottomRight">
							 	 <a href="/delete/review/${review.id}" onclick="return confirm('Are you sure you want to delete your review?')" class="btn btn-danger text-light btn-outline-dark">Delete</a>
							 	</div>
				
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
		</div>
	</div>
</body>
</html>