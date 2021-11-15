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
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  		<a class="navbar-brand" href="#">Navbar</a>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    	<span class="navbar-toggler-icon"></span>
  		</button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
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
		<div class="container-fluid featured-content" 
		style="background:  linear-gradient(to bottom, gold, #181818), url('images/gold.png');
					">
			<div class="row ">
					<div class="col-4">
						<h3 class="mt-5 ml-5">Latest Review</h3>
					</div>
					<div class="col-6">
					</div>
			</div>
		</div>
		<div class="container-fluid carouselSpace">
		
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
  
<!--   <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.20.0/axios.js"></script>
 	<script src="js/script.js"></script> -->
    </body>
</html>