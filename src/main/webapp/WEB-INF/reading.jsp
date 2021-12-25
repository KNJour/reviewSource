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
<title><c:out value="${current.what}"/>-<c:out value="${current.title}"/></title>
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

	<div class="container-fluid main-contain">
	<div class="row">
<!-- 		READING COLUMN -->
		<div class="col-8 order-last order-sm-first">
			<div class="card bg-dark text-light m-2 p-2 ">
				<div class="card-header">
					<h2><c:out value="${current.what}" /> Review</h2>
				</div>
				<div class="card-body">
					<h3><c:out value="${current.title}"/></h3>
					 
					 <div class="offWhite">
					 <p><c:out value="${current.content }"/></p>
					 </div>
				<div class="reviewbottom d-flex align-items-center justify-content-between p-1">
							 	<div class="bottomLeft">
							 	<i class="fas fa-star makeGold"></i> <i class="fas fa-star-half makeGold"></i> 
							 	</div>
							 	<div class="bottomRight">
							 		<a href="/like/review/${current.id}" class="btn btn-success">Like</a>
							 		<a href="/dislike/review/${current.id}" class="btn btn-danger">Dislike</a>
							 	</div>
				
					</div>
				
				</div>
			</div>
		</div>
<!-- 		REVIEWER INFO COLUMN -->
		<div class="col-4">
			<div class="card m-2 p-1 offWhite">
			<h3 class="ml-3">About <c:out value="${current.user.userName}"/></h3>
			<i class="fas fa-user fa-4x"></i>
			<p><c:out value="${user.bio }"/></p>
			</div>
			
			<div class="card m-2 p-1 offWhite">
					<h3>Other Reviews by <c:out value="${review.user.userName}"/></h3>
						
					<c:forEach items="${reviewer.reviews}" var="review">
						<c:choose>
						 <c:when test="${review.id == current.id}">
						 </c:when>
						 <c:otherwise>
						 <div class="card bg-dark text-light m-1 p-1">
				     				 <a id="what" href="/reading/${review.id}" class="makeGold"><c:out value="${review.what }"/> Review</a>
				      				 	<p><c:out value="${review.rating}"/> Stars</p>
			    			</div>
						 </c:otherwise>
						 </c:choose>
    			</c:forEach>
					</div>
			
			</div>
		</div>
	</div>
	</body>
</html>