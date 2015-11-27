<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <!-- tag spring:form -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyReview---Create A NEW Review---</title>
</head>
<body>
<nav class="navbar navbar-default" >
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="home">MyReview</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <!-- <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li> -->
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Menu <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="newReview">New Review</a></li>
            <li><a href="#">Your Profile</a></li>
            <li class="divider"></li>
            <li><a href="#">....</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span>Search</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
      	<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
        	<%-- <c:url value="/j_spring_security_logout" var="logoutUrl" /> --%>
			<c:url var="logoutUrl" value="/logout"/>
			<form:form action="${logoutUrl}" method="post">
			  <input type="submit" class="btn btn-warning" value="Log out" />
			  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			</form:form>
        </sec:authorize>
      </ul>
    </div>
  </div>
</nav>

<!--begin form  -->
<div class="container">
  <h5>Please fill in all the requirement(<code>*</code>) fields</h5>
  
	<form:form modelAttribute="newreview"  class ="form-horizontal" role="form">
	  <div class="form-group">
	    <label class="control-label col-sm-2"  for="topic">Topic Name<code>*</code>: </label>
	    <div class="col-sm-10">
	    <form:input path='topic'  type="text" class="form-control" id="topic" placeholder="Enter Topic Name"></form:input>
	    </div>
	  </div>
	  <div class="form-group">
	    <label class="control-label col-sm-2" for="tag">tag<code>*</code></label>
	    <div class="col-sm-10">
	   <!--  <input type="text" data-role="tagsinput" class="form-control" id="tag">  -->
	   <label class="checkbox-inline"><span class="label label-success"><form:checkbox value="Technology" path="tag"/>#Tech</span></label>
	    <label class="checkbox-inline"><span class="label label-success"><form:checkbox value="Life"  path="tag"/>#Life</span></label>
	    <label class="checkbox-inline"><span class="label label-success"><form:checkbox value="Food"  path="tag"/>#Food</span></label>
	    <label class="checkbox-inline"><span class="label label-success"><form:checkbox value="Love"  path="tag"/>#Love</span></label>
	    <label class="checkbox-inline"><span class="label label-success"><form:checkbox value="News"  path="tag"/>#News</span></label>
	    <label class="checkbox-inline"><span class="label label-success"><form:checkbox value="Music" path="tag"/>#Music</span></label>
	    <!-- <input type="button" class="btn btn-info" value="#general">
	    <input type="button" class="btn btn-success" value="#movie">
	    <input type="button" class="btn btn-warning" value="#tech">
	    <input type="button" class="btn btn-info" value="#music">
	    <input type="button" class="btn btn-success" value="#aboard">
	    <input type="button" class="btn btn-warning" value="#study"> -->
	    </div>
	  </div>
	  <div class="form-group">
	    <label class="control-label col-sm-2" for="desc">Description <code>*</code>: </label>
	    <div class="col-sm-10">
	    <form:textarea path='description' class="form-control" rows="10" id="desc" placeholder="Description"></form:textarea>
	    </div>
	  </div>
	  
	  <div class="form-group">   
	  <div class="col-sm-offset-2 col-sm-10" >
	  <button type="submit" class="btn btn-primary">Create A Review</button>
	  </div>
	  </div>
	</form:form>
</div>
</body>
</html>