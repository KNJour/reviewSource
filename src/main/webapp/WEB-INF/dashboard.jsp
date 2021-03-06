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
<title>Dashboard</title>
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
</head>
<body>

<!-- NAV START -->
<nav class="navbar navbar-expand-lg fixed-top navStyle py-2" id="topNav">
        <a class="navbar-brand makeGold" href="/home">review<span class="source">Source</span></a>
        <button class="navbar-toggler navbar-dark" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto align-items-center">
                <li class="nav-item goldMe">
              <a class="nav-link" href="/yourReviews">Your reviews</a>
            </li>
                <li class="nav-item ">
              <a class="nav-link" href="#">Trending Reviews</a>
            </li>
              <li class="nav-item ">
              <a class="nav-link" href="/newReview">New Review</a>
			</li>
			  <c:choose>
              <c:when test="${user.email == 'KNJournell@gmail.com'}">
			              <li class="nav-item ">
			              <a class="nav-link" href="/newGenre">Add Genre</a>
			            </li>
			              <li class="nav-item ">
			              <a class="nav-link" href="/newMedia">Add Media</a>
			            </li>
			            
            </c:when>
            	<c:otherwise>
            	</c:otherwise>	
            </c:choose>
              <li class="nav-item search-bar ml-3">
               <form:form class="form-inline my-2 my-lg-1" action="/search/" method="POST" modelAttribute="data">
	            <form:input path="status" type="text" class="form-control" required="required" placeholder="Movie Search"/>
            <button class="btn btn-light btn-outline-dark goldMe my-2 my-sm-0 ml-1" type="submit">Review It</button>
             </form:form>
            </li>
	          </ul>
	          <ul class="nav navbar-nav navbar-right align-items-center">
	         	<li><a href="/accountSettings"><i class="fas fa-user-cog fa-2x lighten  d-sm-none d-none d-lg-block d-md-none" ></i></a></li>
	            <li class="nav-item ">
                      <a class="nav-link" href="/accountSettings">Account Settings</a>
                </li>
                <li><a href="/logout"><i class="fas fa-sign-out-alt fa-2x lighten ml-3  d-sm-none d-none d-lg-block d-md-none"></i> </a></li>
            		 <li class="nav-item ">
                      <a class="nav-link" href="/logout">Log Out</a>
                </li>
            </ul>
        </div>
      <!--  <i class="fas fa-star"></i> <i class="fas fa-star-half"></i> -->
      </nav>
      
<!--       NAV END -->
<!-- Alert Strip for messages - eventually maybe
 -->				<div class="row alertStrip">
					
				</div>
		<div class="container-fluid featured-content " style="background:  linear-gradient(to bottom, gold, #181818), url('images/gold.png');">
			<div class="row ">
					<div class="col-4 featured-box">
						<h1 class="ml-3 latest-review-title">Latest Review</h1>
						<h3 class="ml-3"><c:out value="${newest.title }"/></h3>
						<h5 class="ml-3">By: ${newest.user.userName }</h5>
						<a class="btn btn-light ml-3 mt-3" href="/reading/${newest.id }">Read Now</a>
					</div>
					<div class="col-2 d-md-none">
					</div>
					<div class="col-4 featured-box ">
							<c:choose>
								    <c:when test="${empty newest.image}">
								 	   <img  src='<c:url value="/images/question.png"/>' class="img-fluid mx-auto d-block featuredImg mt-5 border border-dark" alt="movie poster"/>
								    </c:when>
								    <c:otherwise>
								        <img src="${newest.image }" class="img-fluid mx-auto d-block featuredImg mt-5 border border-dark" alt="movie poster"/>
								    </c:otherwise>	
						       </c:choose>

					</div>
					<div class="col-4 featured-box d-sm-none d-none d-md-block">
						<p class="mb-4">${newest.description }</p>
					</div>
			</div>
		</div>
		<!-- TRENDING -->
		<div class="container-fluid reviews-container">
			<div class="row">
				<h1 class="review-list-title">TRENDING REVIEWS</h1>
			</div>
				<div class=" row review-list-wrapper">
						<div class="review-list">
<!-- 					  checks if image is blank, if so inserts created placeholder image-->						
						<c:forEach items="${allReviews}" var="review">
							<div class="review-list-item">
									 <c:choose>
							              <c:when test="${empty review.image}">
										    <img class="review-list-item-img mt-1" src='<c:url value="/images/question.png"/> ' alt="${review.what }"/>
										    <h4 class="review-list-item-what" id="alternate"><c:out value="${review.what}"/></h4>
											<h6 class="review-list-item-title" id="alternate"><c:out value="${review.title}"/></h6>
							            </c:when>
							            	<c:otherwise>
							           	 	<img class="review-list-item-img mt-1" src="${review.image }" alt="${review.what }"/>
							           	 	<h4 class="review-list-item-what"><c:out value="${review.what}"/></h4>
											<h6 class="review-list-item-title"><c:out value="${review.title}"/></h6>
							            	</c:otherwise>	
						            </c:choose>
								<p class="review-list-item-rating"><c:out value="${review.user.userName}"/> rated <c:out value="${review.rating}"/> stars</p>
								<a href="/reading/${review.id }"><button class="review-list-item-button">Read Review</button></a>
								</div>
							
						</c:forEach>
						</div>
						<i class="fas fa-chevron-right arrow"></i>
				</div>
		</div>
		<!-- RECENT -->
				<div class="container-fluid reviews-container">
			<div class="row">
				<h1 class="review-list-title">RECENT REVIEWS</h1>
			</div>
				<div class=" row review-list-wrapper">
						<div class="review-list">
						<c:forEach items="${fiftyNew}" var="review">
							<div class="review-list-item">
									<c:choose>
								              <c:when test="${empty review.image}">
											    <img class="review-list-item-img" src='<c:url value="/images/question.png"/> ' alt="${review.what }"/>
											    <h4 class="review-list-item-what" id="alternate"><c:out value="${review.what}"/></h4>
												<h6 class="review-list-item-title" id="alternate"><c:out value="${review.title}"/></h6>
								            </c:when>
								            	<c:otherwise>
								           	 	<img class="review-list-item-img" src="${review.image }" alt="${review.what }"/>
								           	 	<h4 class="review-list-item-what"><c:out value="${review.what}"/></h4>
												<h6 class="review-list-item-title"><c:out value="${review.title}"/></h6>
								            	</c:otherwise>	
						            </c:choose>
								<p class="review-list-item-rating"><c:out value="${review.user.userName}"/> rated <c:out value="${review.rating}"/> stars</p>
								<a href="/reading/${review.id }"><button class="review-list-item-button">Read Review</button></a>
								</div>
							
						</c:forEach>
						</div>
						<i class="fas fa-chevron-right arrow"></i>
				</div>
		</div>
			<div class="container-fluid reviews-container">
			<div class="row">
				<h1 class="review-list-title">TRENDING REVIEWS</h1>
			</div>
				<div class=" row review-list-wrapper">
						<div class="review-list">
						<c:forEach items="${allReviews}" var="review">
							<div class="review-list-item">
									 <c:choose>
								              <c:when test="${empty review.image}">
											    <img class="review-list-item-img" src='<c:url value="/images/question.png"/> ' alt="${review.what }"/>
											    <h4 class="review-list-item-what" id="alternate"><c:out value="${review.what}"/></h4>
												<h6 class="review-list-item-title" id="alternate"><c:out value="${review.title}"/></h6>
								            </c:when>
								            	<c:otherwise>
								           	 	<img class="review-list-item-img" src="${review.image }" alt="${review.what }"/>
								           	 	<h4 class="review-list-item-what"><c:out value="${review.what}"/></h4>
												<h6 class="review-list-item-title"><c:out value="${review.title}"/></h6>
								            	</c:otherwise>	
						            </c:choose>
								<p class="review-list-item-rating"><c:out value="${review.user.userName}"/> rated <c:out value="${review.rating}"/> stars</p>
								<a href="/reading/${review.id }"><button class="review-list-item-button">Read Review</button></a>
								</div>
							
						</c:forEach>
						</div>
						<i class="fas fa-chevron-right arrow"></i>
				</div>
		</div>
			<div class="container-fluid featured-content-bottom" style="background:  linear-gradient(to top, gold, #181818), url('images/gold.png');">
			<div class="row ">
					<div class="col-4 featured-box">
						<h1 class="ml-3 random-review-title">Random Review</h1>
						<h3 class="ml-3"><c:out value="${random.title }"/></h3>
						<h5 class="ml-3">By: ${random.user.userName }</h5>
						<a class="btn btn-light ml-3 mt-3" href="/reading/${random.id }">Read Now</a>
					</div>
					<div class="col-4 featured-box ">
							   <c:choose>
								    <c:when test="${empty random.image}">
								 	   <img  src='<c:url value="/images/question.png"/>' class="img-fluid mx-auto d-block featuredImg mt-5 border border-dark" alt="movie poster"/>
								    </c:when>
								    <c:otherwise>
								        <img src="${random.image }" class="img-fluid mx-auto d-block featuredImg mt-5 mb-4 border border-dark" alt="movie poster"/>
								    </c:otherwise>	
						       </c:choose>

					</div>
					<div class="col-4 featured-box d-sm-none d-none d-md-block">
						<p class="mb-4">${random.description }</p>
					</div>
				</div>
			</div>
			<!-- Alert Strip for messages - eventually maybe -->
				<div class="row alertStrip">
					
				</div>
		
	<div class="footer">
	<nav class="navbar navbar-light bg-light" id="bottomNav">
  		<a class="navbar-brand" href="#">A Project by Keith Journell</a>
      <a href="https://github.com/KNJour/reviewSource" target="_blank"><button class="btn btn-outline-success my-2 my-sm-0" type="submit">GitHub</button></a>
        <a href="http://keithjournell.com" target="_blank"><button class="btn btn-outline-primary my-2 my-sm-0 ml-3" type="submit">Portfolio</button></a>
      
</nav>
	</div>

  
 	<script src="js/app.js"></script>
 	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    </body>
</html>