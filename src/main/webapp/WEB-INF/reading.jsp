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
        <link rel="stylesheet" href="/css/readPage.css" />
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
              <a class="nav-link" href="#">Your reviews</a>
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

        </div>
        
      </nav>
      <div class="container">
      <div class="header">
  <h2><c:out value="${review.what }"/> Review</h2>
</div>
<div class="row">
<p><c:out value="${review.description}"/></p>
</div>
<div class="row">
  <div class="leftcolumn">
    <div class="card">
       <h2><c:out value="${review.title }"/></h2>
      <h5>Reviewed on <c:out value="${date}"/></h5>
      <div class="banner" style="height:200px;"><p><c:out value="${review.content }"/></p></div>
      	<div class="d-flex p-1 justify-content-between">
      	 <p><c:out value="${review.rating }"/> Stars</p>
      		<div>
      		<button class="btn btn-success"></button>
      		<button class="btn btn-danger"></button>
      		
      		</div>
      	</div>
    </div>
  </div>
  <div class="rightcolumn">
    <div class="card">
      <h2>About <c:out value="${review.user.userName}"/></h2>
      <div class="banner" style="height:70px;">Image</div>
      <p>Some text about USER</p>
    </div>
    <div class="card">
      <h3>Other Reviews</h3>
	      <div class="banner">FILL IN</div>
	      	<br>
	      <div class="banner">FILL IN</div>
	      	<br>
	      <div class="banner">FILL IN</div>
    </div>
    <div class="card">
      <h3>Follow Me</h3>
      <p>Some text..</p>
    </div>
  </div>
</div>

<div class="footer">
  <h2>Footer</h2>
</div>
</div>
</html>