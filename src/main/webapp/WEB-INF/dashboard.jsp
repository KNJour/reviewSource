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
<%-- <div class="navbar">
	<div class="nav-container">
		<div class="logo-container">
			<h1 class="logo">review<span>Source</span></h1>
		</div>
		<div class="menu">
				<ul class="menu-options">
					<li class="menu-li active">Home</li>
					<li class="menu-li">New Review</li>
					<li class="menu-li">Your Reviews</li>
					  <c:choose>
              				<c:when test="${user.userName == 'KJournell'}">
			              <li class="menu-li"> <a class="nav-link" href="/newGenre">Add Genre</a></li>
			              <li class="menu-li"><a class="nav-link" href="/newMedia">Add Media</a></li>
           					 </c:when>
            					<c:otherwise>
            					</c:otherwise>	
            			</c:choose>
					<li class="menu-li">Trending Reviews</li>
					<li class="menu-li"> <form:form class="form-inline my-2 my-lg-1" action="/search/" method="POST" modelAttribute="data">
	            												<form:input path="status" type="text" class="form-control colorizer" required="required" placeholder="Search"/>
            													<button class="btn btn-outline-light my-2 my-sm-0" type="submit">Review It</button>
          													</form:form>
          			</li>
				</ul>
		</div>
			<div class="account">
				<div class="toggle">
					<i class="fas fa-moon toggle-icon"></i>
					<i class="far fa-sun toggle-icon"></i>
					<div class="toggle-ball"></div>
				</div>
				<i class="fas fa-user-cog fa-2x" ></i>
				<div class="edit-account-container">
					<span class="edit-account">Edit Account</span>
				</div>
			</div>
		</div>
</div>
<div class="sidebar">
	<i class="fas fa-film sidebar-icon"></i>
	<i class="fas fa-book sidebar-icon"></i>
	<i class="fas fa-tv sidebar-icon"></i>
	<i class="fas fa-music sidebar-icon"></i>
</div>

<!-- CONTENT START -->
<div class="container">
	<div class="content-container">
		<div class="featured-content" 
		style="background: linear-gradient(to bottom, gold, #303030), url("images/gold.png")">
			<h1 class="featured-review"></h1>
		</div>
	</div>

</div> --%>
<!-- NAV START -->
<nav class="navbar navbar-expand-md navStyle ">
        <a class="navbar-brand" href="/home">review<span class="source">Source</span></a>
        <button class="navbar-toggler navbar-dark" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
			<li>
              <a class="nav-link" href="#">Home</a>
            </li>
                <li class="nav-item active">
              <a class="nav-link" href="/yourReviews">Your reviews</a>
            </li>
                <li class="nav-item ">
              <a class="nav-link" href="#">Trending Reviews</a>
            </li>
              <li class="nav-item ">
              <a class="nav-link" href="/newReview">New Review</a>
			</li>
			  <c:choose>
              <c:when test="${user.userName == 'KJournell'}">
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
              <li class="nav-item search-bar">
               <form:form class="form-inline my-2 my-lg-1" action="/search/" method="POST" modelAttribute="data">
	            <form:input path="status" type="text" class="form-control colorizer" required="required" placeholder="Search"/>
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Review It</button>
             </form:form>
            </li>
	          </ul>
	         <ul class="nav navbar-nav navbar-right">
	         	<li><i class="fas fa-user-cog fa-2x lighten" ></i></li>
	            <li class="nav-item ">
                      <a class="nav-link mr-5" href="/accountSettings">Account Settings</a>
                </li>
                <li><a><i class="fas fa-sign-out-alt fa-2x lighten ml-3"></i> </a><a href="/logout">Log Out</a></li>
            </ul>
	         

        </div>
        
      </nav>
      <!-- Beginning of Container -->
        <%-- <h1> You've made it to the Home!! What a hero!</h1>
        <h3>Welcome <c:out  value="${user.userName}"/></h3>
        <h3>your email is <c:out  value="${user.email}"/></h3>
        <h3>your id is <c:out  value="${user.id}"/></h3>
        <a href="/logout">Log Out</a>
        <div class="container-fluid">
         --%>
		<div class="container-fluid featured-content" style="background:  linear-gradient(to bottom, gold, #181818), url('images/gold.png');">
			<div class="row ">
					<div class="col-4 featured-box">
						<h1 class="ml-3 latest-review-title">Latest Review</h1>
						<h3 class="ml-3"><c:out value="${newest.title }"/></h3>
						<h5 class="ml-3">By: ${newest.user.userName }</h5>
						<a class="btn btn-light ml-3 mt-3" href="/reading/${newest.id }"/>Read Now</a>
					</div>
					<div class="col-4 featured-box">
						<img src="${newest.image }" class="img-fluid mx-auto d-block featuredImg mt-5 border border-dark" alt="movie poster"/>

					</div>
					<div class="col-4 featured-box">
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
						<c:forEach items="${allReviews}" var="review">
							<div class="review-list-item">
								<img class="review-list-item-img" src="${review.image }" alt="${review.what }"/>
								<h4 class="review-list-item-what"><c:out value="${review.what}"/></h4>
								<h6 class="review-list-item-title"><c:out value="${review.title}"/></h6>
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
						<c:forEach items="${allReviews}" var="review">
							<div class="review-list-item">
								<img class="review-list-item-img" src="${review.image }" alt="${review.what }"/>
								<h4 class="review-list-item-what"><c:out value="${review.what}"/></h4>
								<h6 class="review-list-item-title"><c:out value="${review.title}"/></h6>
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
								<img class="review-list-item-img" src="${review.image }" alt="${review.what }"/>
								<h4 class="review-list-item-what"><c:out value="${review.what}"/></h4>
								<h6 class="review-list-item-title"><c:out value="${review.title}"/></h6>
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
						<a class="btn btn-light ml-3 mt-3" href="/reading/${random.id }"/>Read Now</a>
					</div>
					<div class="col-4 featured-box">
						<img src="${random.image }" class="img-fluid mx-auto d-block featuredImg mt-5 border border-dark" alt="movie poster"/>

					</div>
					<div class="col-4 featured-box">
						<p class="mb-4">${random.description }</p>
					</div>
			</div>
		</div>
	<div class="footer">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  		<a class="navbar-brand" href="#">A Project by Keith Journell</a>

      <a href="https://github.com/knjour" target="_blank"><button class="btn btn-outline-success my-2 my-sm-0" type="submit">GitHub</button></a>
        <a href="#" target="_blank"><button class="btn btn-outline-primary my-2 my-sm-0 ml-3" type="submit">Portfolio</button></a>
      
</nav>
	</div>
	
      <!--   <div class="carousel">
        	<div class="carouselbox"> REVIEW DATA WILL COME HERE
        		
        	</div>
        	<a class="switchLeft sliderButton"><</a>
        	<a class="switchRight sliderButton">></a>
        	
        </div> -->
        <%-- 	<div class="row">
        	<c:forEach items="${allReviews}" var="review">
		        	<div class="card m-3">
		       <!--  	 	card header -->
		        	 	<div class="card-header">
				        	 	<div class="container text-dark">
							        	 	<div class="row">
									        	 	<div class="col-5">
									        	 	        	 						<h3><c:out value="${review.what }"/></h3>
									        	 	</div>
									        	 	<div class="col-5">
									        	 	        	 						<p>Reviewed by: <c:out value="${review.user.userName}"/></p>
									        	 	</div>
									        	 	<p>Description: <c:out value="${review.description}"/></p>
									        	 	
							        	 	</div>
				        	 	</div>
		        	 	</div>
		        	 	<div class="cardbody text-dark">
		        	 						<p>Rating: <c:out value="${review.rating}"/></p>
		        	 						<div>
		        	 						<h6><a href="/reading/${review.id }">Read Full Review</a></h6>
		        	 							<h5>Image: </h5><img src="${review.image}" alt="image" style="width:100px;'height:300px"/>
		        	 						</div>
		        	 						<h6><a href="/delete/review/${review.id }" class="btn btn-outline-light btn-dark">delete</a></h6>
		        	 						</div>
		        	 						<div id="likes">
		        	 							<a href="/like/review/${review.id}" class="btn btn-success">Like</a>
		        	 							<a href="dislike/review/${review.id}" class="btn btn-danger">Dislike</a>
		        	 						</div>
		        	</div>
        	</c:forEach>
                      
        	</div><!--  Row 1 end --> --%>
  
 	<script src="js/app.js"></script>
    </body>
</html>