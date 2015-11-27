<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>MyReview---Login Form---</title>
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
<!-- end nav bar -->
<div class="container">
  <h2>Register form</h2>
  <h5>Please fill in all the requirement(<code>*</code>) fields</h5>
<form:form class ="form-horizontal" role="form">
  <div class="form-group">
    <label class="control-label col-sm-2"  for="uname">Username: <code>*</code></label>
    <div class="col-sm-10">
    <input type="text" class="form-control" id="uname" placeholder="Enter Username">
    </div>
  </div>
  <div class="form-group required">
    <label class="control-label col-sm-2" for="email">Email: <code>*</code></label>
    <div class="col-sm-10">
    <input type="email" class="form-control" id="email" placeholder="Enter Email">
    
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">Password: <code>*</code></label>
    <div class="col-sm-10">
    <input type="password" class="form-control" id="pwd" placeholder="Enter password">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="cpwd">Confirm Password: <code>*</code></label>
    <div class="col-sm-10">
    <input type="password" class="form-control" id="cpwd" placeholder="Enter Confirm password">
    </div>
  </div>
  <div class="form-group">   
  <div class="col-sm-offset-2 col-sm-10" >
  <div class="checkbox">
    <label><input type="checkbox"> Remember me</label>
  </div>
  </div>
  </div>
  <div class="form-group">   
  <div class="col-sm-offset-2 col-sm-10" >
  <button type="submit" class="btn btn-primary">Submit</button>
  </div>
  </div>
</form:form>
</div>
</body>
</html>