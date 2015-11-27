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
<title>${review.topic }</title>
</head>
<body>
<!--navigation  -->
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
<div class="jumbotron">
<div class="container">
	<h2>${review.topic }</h2>
	<p><small><em>#${review.tag } from...${review.user.username}</em></small></p>
	<p>${review.description }</p>
	
	<form:form ModelAttribute="review" role="form" >
		<p class="text-right">
		<input type="hidden" id="reviewid" name="reviewid" value="${review.review_id }"/>
		<button type='submit' name="reply1" class="btn btn-success">Reply</button>
		</p>
	</form:form>
	
</div>
</div>
<c:if test="${fn:length(reply) > 0}">
		<div class="container">
		<c:forEach var="r" items="${reply}">
		<div class="jumbotron">
			<p>${r.description}</p>
			<form:form class="form-inline" ModelAttribute="review" role="form" >
				<h3><small><em>${r.user.username} replied</em></small></h3>
				<p class="text-right">
					<input type="hidden" id="reviewid" name="reviewid" value="${review.review_id }"/>
					<input type="hidden" id="reId" name="reId" value="${r.review_id }"/>
					<button type='submit' name="reply2" class="btn btn-warning">Reply</button>
				</p>
			</form:form>
			<c:if test="${fn:length(inReply) > 0 }">
				
				<c:forEach var="i" items="${inReply}">
				
					<c:if test = "${i.inReply == r.review_id }">
					____________________________________________________________________________
						<p>${i.description }</p>
						<h3><small><em>${i.user.username} replied </em></small></h3>
						<%-- <p>${i.inReply == r.review_id }</p>
						<p>${r.review_id }</p> --%>
					____________________________________________________________________________
					</c:if>
				</c:forEach>
			</c:if>
		</div>
		</c:forEach>
		</div>
	</c:if>
</body>
</html>