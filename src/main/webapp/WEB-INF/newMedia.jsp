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
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <h1><a class="navbar-brand" href="/">Everyone's a Critic</a></h1>
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
    <div class="container"> <!-- Beginning of Container -->
    
       <form:form method='POST' action="/createMedia" modelAttribute="media" class="mt-5" >
    <p>
        <form:label path="type">New Type To Add: </form:label>
        <form:errors path="type" class="text-danger"/>
        <form:input path="type"/>
    </p>
        <input type="submit" value="Create"/>
    </form:form>
    
    
    <table class="table-striped table-bordered table-hover mt-4">
    	<thead>
    		<tr>
    			<th>Media Types Available</th>
    			<th>Remove</th>
    		</tr>
    		</thead>
    		<tbody>
    		<c:forEach items="${allMedia}" var="mediaType">
    		<tr>
  				<td><h3><c:out value="${mediaType.type}"/></h3></td>
  				<td class="center"><a href="/delete/media/${mediaType.id}">Delete</a></td>
  			</tr> 
  			</c:forEach>
    		</tbody>
    </table>
    </div> <!-- End of Container -->
</body>
</html>