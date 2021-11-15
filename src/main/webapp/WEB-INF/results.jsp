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
              <li class="nav-item active">
              <a class="nav-link" href="/newGenre">Add Genre</a>
            </li>
              <li class="nav-item active">
              <a class="nav-link" href="/newMedia">Add Media</a>
            </li>
              <li class="nav-item active">
              <a class="nav-link" href="/">Favorites</a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="/">Account Settings</a>
            </li>
	                </ul>
	            <form:form class="form-inline my-2 my-lg-1" action="/search/" method="POST" >
	           <%--  <form:input path="status" type="text" class="form-control colorizer" required="required" placeholder="Search"/>
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Review It</button> --%>
          </form:form>

        </div>
        
      </nav>
    <div class="container"> <!-- Beginning of Container -->
        <h1>Results Page</h1>

        <a href="/logout">Log Out</a>
        <div class="container-fluid">
        	<div class="row">
<c:forEach items="${result}" var="result">
		        	<div class="card m-3">
		       <!--  	 	card header -->
		        	 	<div class="card-header">
				        	 	<div class="container text-dark">
							        	 	<div class="row">
									        	 	<div class="col-5">
									        	 	        	 						<h3 style="color:red"><c:out value="${result.title }"/></h3>
									        	 	        	 						<h3><c:out value="${result.resultType }"/></h3>
									        	 	</div>
									        	 	<div class="col-5">
									        	 	        	 						<p>Year: <c:out value="${result.description}"/></p>
									        	 	        	 						<p>ID: <c:out value="${result.id}"/></p>
									        	 	        	 						<h5>Image: </h5><img src="${ result.image}" alt="image" style="width:100px;'height:300px"/>
									        	 	        	 						<a href="/newReview/${result.id}/" class="btn btn-dark">Review It</a>
									        	 	</div>
									        	 	
							        	 	</div>
				        	 	</div>
		        	 	</div>
		        	
		        	 						
		        	</div>
        	</c:forEach>
        	</div><!--  Row 1 end -->
        </div>
    </div> <!-- End of Container -->
</html>