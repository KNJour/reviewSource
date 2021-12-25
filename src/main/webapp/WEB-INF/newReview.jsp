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
<title>New Review</title>
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
    	var description = '${movie.description}';
    	console.log(description);
      document.getElementById("desc").value = description; 
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
              <li class="nav-item isActive ">
              <a class="nav-link" href="/newReview">New Review</a>
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
        <div class="container-fluid justify-content-center text-center mb-5">
     			  <form:form method='POST' action="/createReview" modelAttribute="review" class="mt-5 justify-content-center formStyle" >
     			 		<h2 class="mt-4"><span class="makeGold">★ ★</span> Create A New Review <span class="makeGold">★ ★</span></h2>
     			 		<div class="form-group fit-me">
						           <form:hidden path="user"  value="${user.id}" />
									<form:label path="what"> What are You Reviewing:  <span class="required">*</span> </form:label>
									<form:errors path="what" class="text-danger"/>
									<form:input path="what" type="text" class="form-control" required="required" value="${movie.title }"/>
															
                        </div>
                          <div class="form-group mt-3">
                        			<form:label path="rating" > Your Rating (out of 5): </form:label>
								<form:errors path="rating" class="text-danger"/>
								<form:select path="rating">
													        		<option>0</option>
													        		<option>.5</option>
													        		<option>1</option>
													        		<option>1.5</option>
													        		<option>2</option>
													        		<option>2.5</option>
													        		<option>3</option>
													        		<option>3.5</option>
													        		<option>4</option>
													        		<option>4.5</option>
													        		<option>5</option>
								</form:select>
                        </div>
     			 		      	 <form:label path="media" > Media Type (select one)</form:label>
                         <div class="form-group form-inline justify-content-center">
                         		<c:forEach items="${allMedia}" var="media">
                         		<form:label class="m-2" path="media"><c:out value="${media.type }"/></form:label>
                         		<form:checkbox path="media" value="${media.id}" />  
                         		</c:forEach>
                        </div>
                        
                      	  <div class="form-group fit-me">
                      			<form:label path="title" > Review Title  </form:label>
								<form:errors path="title" class="text-danger"/>
								<form:input path="title" type="text" class="form-control" required="required"/>
                        </div>
                         
                         <div class="form-group fit-me-text">
                        		<form:label path="description">Description: </form:label><br>
							<form:errors path="description" class="text-danger"/>
							<form:textarea path="description" name="description" rows="10" id="desc" class="form-control" />

                        </div>
                        
                        <div class="form-group fit-me-text">
                        		<form:label path="content">Your Review: </form:label><br>
							<form:errors path="content" class="text-danger"/>
							<form:textarea path="content" rows="18" class="form-control"/>
                        </div>
           			 <div class="form-group fit-me-text">
                      		<form:label path="image" class="iconic user">Poster Image Link: (optional)</form:label>
							<form:errors path="image" class="text-danger"/>
							<form:input path="image" type="text" class="form-control" value="${poster.image}"/>
					 </div>
							<input type="submit" class="btn btn-light btn-outline-dark m-3 goldMe" value="★ ★ ★ ★ ★ Submit Review"/>
				</form:form>
        </div>


<%-- 						<form:label path="genre" > Genre (select one)</form:label>
				                        <div class="form-group form-inline">
				                         		<c:forEach items="${allGenres}" var="genre">
				                         		<form:label class="m-2" path="genre"><c:out value="${genre.name }"/></form:label>
				                         		<form:checkbox path="genre" value="${genre.id}"/>  
				                         		</c:forEach>
				                        </div>  --%>

            
</body>
</html>