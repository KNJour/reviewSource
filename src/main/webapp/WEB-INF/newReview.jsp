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
    	var description = '${movie.description}';
    	console.log(description);
      document.getElementById("desc").value = description; 
    };
</script>

    
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <h1 class="star"><a class="navbar-brand" href="/">Everyone's a Critic</a></h1>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
		            <li class="nav-item active">
		             			 <a class="nav-link" href="/home">Home<span class="sr-only">(current)</span></a>
		            </li>
		                <li class="nav-item active">
		              			<a class="nav-link" href="#">Your reviews</a>
		            </li>
		                <li class="nav-item active">
		              			<a class="nav-link" href="#">Trending Reviews</a>
		            </li>
		                 <li class="nav-item active">
		              			<a class="nav-link" href="#">New Review</a>
		            </li>
	       </ul>
        </div>
      </nav>
        <div class="container text-center">
            <div class="row">
                <div id="content">
                		   <form:form method='POST' action="/createReview" modelAttribute="review" class="mt-5" >
                    <h1 class="star"> Review Form </h1>
                        <div class="form-group">
						                        		<form:hidden path="user"  value="${user.id}" />
						                        
															<form:label path="what" class="iconic question"> What are You Reviewing:  <span class="required">*</span> </form:label>
															<form:errors path="what" class="text-danger"/>
															<form:input path="what" type="text" class="form-control colorizer" required="required" value="${movie.title }"/>
															
                        </div>
                        <div class="form-group">
                        						    				<form:label path="rating" class="iconic dot"> Your Rating (out of 5):    <span class="required">*</span></form:label>
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
                         <div class="form-group form-inline">
                         		<c:forEach items="${allMedia}" var="media">
                         		<form:label class="m-2" path="media"><c:out value="${media.type }"/></form:label>
                         		<form:checkbox path="media" value="${media.id}" />  
                         		</c:forEach>
                        </div>

<%-- 										<form:label path="genre" > Genre (select one)</form:label>
				                        <div class="form-group form-inline">
				                         		<c:forEach items="${allGenres}" var="genre">
				                         		<form:label class="m-2" path="genre"><c:out value="${genre.name }"/></form:label>
				                         		<form:checkbox path="genre" value="${genre.id}"/>  
				                         		</c:forEach>
				                        </div> --%>
				                        
                        <div class="form-group">
                      			<form:label path="title" class="iconic user"> Review Title  <span class="required">*</span> </form:label>
								<form:errors path="title" class="text-danger"/>
								<form:input path="title" type="text" class="form-control colorizer" required="required"/>
                        </div>
                         
                         <div class="form-group">
                        		<form:label path="description">Description: </form:label><br>
							<form:errors path="description" class="text-danger"/>
							<form:textarea path="description" name="description" rows="20" id="desc" />

                        </div>
                        
                        <div class="form-group">
                        		<form:label path="content">Your Thoughts </form:label><br>
							<form:errors path="content" class="text-danger"/>
							<form:textarea path="content" rows="20" class="form-control"/>
                        </div>
                        
    					   <div class="form-group">
                      			<form:label path="image" class="iconic user">Poster Image Link: (optional)</form:label>
								<form:errors path="image" class="text-danger"/>
								<form:input path="image" type="text" class="form-control colorizer" value="${poster.image}"/>
                        </div>
                        
				    	 <input type="submit" value="★ ★ ★ ★ ★ Submit Review"/>
						    </form:form>
                </div>
            </div>
            
        </div>
</body>
</html>