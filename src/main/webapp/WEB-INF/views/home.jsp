<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
	   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> 
	<!--  <link href="resources/css/bootswatch.css" rel="stylesheet"> -->
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <title>Test page</title>
   
</head>
<body>
<h1>
    
</h1>
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

<div class="container">
  <div class="row">
    <nav class="col-sm-3">
      <ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="205">
        <li class="active"><a href="home">All Reviews</a></li>
        <li><a href="reviewsbyme">Reviews By Me</a></li>
        <li><a href="reviewireplied">Reviews that I replied</a></li>
      </ul>
    </nav>
    <div class="col-sm-9">  
	  <c:forEach items = "${reviews }" var ="review">
	  <form:form ModelAttribute="review" role="form"  method="get">
	  	<div class="row">
      	<a href = "review?reviewid=${review.review_id }"  class="list-group-item list-group-item-success">
      	<input type="hidden" id="reId" name="reId" value="${review.review_id }"/>
      	${review.topic }
      	<p class="text-right"><small>created by ${review.user.username} <!-- date --></small></p>
      	</a>
      	</div>
      </form:form>
      </c:forEach>
      
    </div>
  </div>
</div>

<!-- <div class="container">
  
  <div class="list-group">
    <a href="#" class="list-group-item list-group-item-success">All Reviews</a>
    <a href="#" class="list-group-item list-group-item-info">Review Type I</a>
    <a href="#" class="list-group-item list-group-item-warning">Review Type II</a>
    <a href="#" class="list-group-item list-group-item-danger">Review Type III</a>
  </div>
</div> -->

</body>
</html>